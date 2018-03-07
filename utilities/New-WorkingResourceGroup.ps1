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

    # Create resource group
    $resourceGroupName = 'gab2018-{0}' -f $EnvironmentCode
    New-AzureRmResourceGroup -ResourceGroupName $resourceGroupName -Location $ResourceGroupLocation -Force
}