#Requires -Version 5.0

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
param(
    [Parameter(Mandatory)]
    [PSCustomObject]
    $KeyVaultName,
    [Parameter(Mandatory)]
    [String]
    $AdminUsernameSecretName,
    [Parameter(Mandatory)]
    [String]
    $AdminPasswordSecretName    
)

Begin {
    $ErrorActionPreference = 'stop'
}

Process {
    Write-Host "Setting key vault secrets for virtual machine ..." -ForegroundColor Cyan

    $password = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..23] -join ''

    & $PSScriptRoot\Set-KeyVaultSecretsIfNotExist.ps1 `
        -VaultName $KeyVaultName `
        -Secrets @{
            $AdminUsernameSecretName = (ConvertTo-SecureString -String 'vm-admin' -AsPlainText -Force)
            $AdminPasswordSecretName = (ConvertTo-SecureString -String $password -AsPlainText -Force)
        }

    Write-Host "Key vault secrets set!" -ForegroundColor Green
}