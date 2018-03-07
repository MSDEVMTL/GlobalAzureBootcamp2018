#Requires -Version 5.0 -Module AzureRM.KeyVault

param(
    [Parameter(Mandatory)]
    [string]
    $VaultName,
    [Parameter(Mandatory)]
    [hashtable]
    $Secrets
)

Begin {
    $ErrorActionPreference = 'stop'
}

Process {
    function Set-KeyVaultSecretIfNotExist {
        param(
            [Parameter(Mandatory)]
            [string]
            $VaultName,
            [Parameter(Mandatory)]
            [string]
            $Name,
            [Parameter(Mandatory)]
            [SecureString]
            $Value,
            [switch]
            $AlwaysUpdate
        )

        $secret = Get-AzureKeyVaultSecret -VaultName $VaultName -Name $Name -ErrorAction SilentlyContinue

        if ($secret) {
            Write-Verbose -Message 'Skipped setting secret ''{0}'' in vault ''{1}''.'
        } 
        else {
            Set-AzureKeyVaultSecret -VaultName $VaultName -Name $Name -SecretValue $Value
        }
    }

    foreach ($secret in $secrets.GetEnumerator()) {
        $null = Set-KeyVaultSecretIfNotExist -VaultName $VaultName -Name $secret.Name -Value $secret.Value
    }
}