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

    Write-Host "OMS resources deployment in resource group '$($rg.ResourceGroupName)'" -ForegroundColor Cyan
    $deploymentName = 'gab2018-{0}-oms' -f $EnvironmentCode
    $mainDeployment = New-AzureRmResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName `
        -Name $deploymentName `
        -TemplateFile $PSScriptRoot\templates\template-oms.json `
        -TemplateParameterFile $PSScriptRoot\templates\template-oms.parameters.json `
        -EnvironmentCode $EnvironmentCode `
        -AppName $ApplicationName `
        -Verbose

    Write-Host 'Provisioning completed!' -ForegroundColor Green
}