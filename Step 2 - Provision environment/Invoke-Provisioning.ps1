#Requires -Version 5.0

param(
    [string]
    [ValidateSet('dev','qa','stg','prod', IgnoreCase=$false)]
    $EnvironmentCode = 'dev',
    [string]
    [ValidateNotNullOrEmpty()]
    $ResourceGroupLocation = 'East US'
)

Begin {
    $ErrorActionPreference = 'stop'

    function Get-AzureRmAccountObjectId {
        param(
          [Parameter(Mandatory=$true)]
          [Microsoft.Azure.Commands.Profile.Models.PSAzureRmAccount]
          $Account
        )
        switch ($Account.Type) {
          'user' {
            $user = $Account.Id
            $aduser = Get-AzureRmADUser -UserPrincipalName $user
            if(-not $aduser) {
              $adusers = Get-AzureRmADUser
              # try to resolve the user as an external user in tenant.
              $aduser = $adusers | ? UserPrincipalName -Match ($user -replace '@', '_')
            }
            if($aduser.Id) {
              $objectId = $aduser.Id
            }
          }
          'serviceprincipal' {
            $objectId = (Get-AzureRmADServicePrincipal | ? ApplicationId -eq $Account.Id).Id
          }
          'default' {
            throw ('Unsupported Account type: {0}' -f $Account.AccountType)
          }
        }
        if(-not $objectId) {
          throw ('Unable to resolve account {0}' -f $Account.Id)
        }
        $objectId
      }
      
}

Process {

    try{
        $context = Get-AzureRmContext -ErrorAction SilentlyContinue
        if(-not $context.Environment.Name) {
            throw 'No current context'
        }
    }
    catch {
        Login-AzureRmAccount
    }

    # Define the application name
    $ApplicationName = 'gab2018'

    # Create resource group
    $rg = & $PSScriptRoot\..\utilities\New-WorkingResourceGroup.ps1 `
        -EnvironmentCode $EnvironmentCode `
        -ResourceGroupLocation $ResourceGroupLocation

    $deploymentName = 'gab2018-{0}-keyvault' -f $EnvironmentCode
    $azureAdTenantId = (Get-AzureRmContext).Tenant.Id
    $currentUserObjectId = Get-AzureRmAccountObjectId -Account (Get-AzureRmContext).Account

    $accessPolicies = @(
        @{
            tenantId = $azureAdTenantId
            objectId = $currentUserObjectId
            permissions = @{
            keys = @()
            secrets = @('get', 'delete', 'list', 'set', 'recover', 'backup', 'restore')
            certificates = @()
            }
        } 
    )

    Write-Host "Provisioning started for keyvault in resource group '$($rg.ResourceGroupName)'" -ForegroundColor Cyan
    $deploymentName = 'gab2018-{0}-keyvault-all' -f $EnvironmentCode
    $kvDeployment = New-AzureRmResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName `
        -Name $deploymentName `
        -TemplateFile $PSScriptRoot\templates\keyvault.json `
        -EnvironmentCode $EnvironmentCode `
        -AppName $ApplicationName `
        -RoleName 'kv-all' `
        -AccessPolicies $accessPolicies `
        -EnableVaultForDeployment $true `
        -EnableVaultForTemplateDeployment $true `
        -ProtectWithLocks $false `
        -Verbose
    
    if($kvDeployment.ProvisioningState -ne 'Succeeded') {
        throw 'Unable to continue, KeyVault deployment failed.'
    }
    $keyVaultName = $kvDeployment.Outputs.keyVaultName.value

    Write-Host 'Setting VM admin credentials' -ForegroundColor Cyan
    & $PSScriptRoot\..\utilities\Set-VmAdminSecrets.ps1 -KeyVault $keyVaultName `
        -AdminUsernameSecretName 'vmpdf-admin-name' `
        -AdminPasswordSecretName 'vmpdf-admin-password'
    
    # dynamically inject keyvault secrets in parameter file
    $parameterFile = Get-Content $PSScriptRoot\templates\azuredeploy.parameters.json -Raw | ConvertFrom-Json
    $keyVaultResourceId = '{0}/providers/Microsoft.KeyVault/vaults/{1}' -f $rg.ResourceId, $keyVaultName
    $parameterFile.parameters.VirtualMachineAdminUsername.reference.keyvault.id   = $keyVaultResourceId
    $parameterFile.parameters.VirtualMachineAdminUsername.reference.secretname    = 'vmpdf-admin-name'
    $parameterFile.parameters.VirtualMachineAdminPassword.reference.keyvault.id   = $keyVaultResourceId
    $parameterFile.parameters.VirtualMachineAdminPassword.reference.secretname    = 'vmpdf-admin-password'
    $parameterFile | ConvertTo-Json -Depth 100 -Compress | Out-File -FilePath $PSScriptRoot\templates\azuredeploy.parameters.tmp.json

    Write-Host "Main resources deployment in resource group '$($rg.ResourceGroupName)'" -ForegroundColor Cyan
    $deploymentName = 'gab2018-{0}-all' -f $EnvironmentCode
    $mainDeployment = New-AzureRmResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName `
        -Name $deploymentName `
        -TemplateFile $PSScriptRoot\templates\azuredeploy.json `
        -TemplateParameterFile $PSScriptRoot\templates\azuredeploy.parameters.tmp.json `
        -EnvironmentCode $EnvironmentCode `
        -AppName $ApplicationName `
        -Verbose

    Write-Host 'Provisioning completed!' -ForegroundColor Green
}