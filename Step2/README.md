![gablogo][gablogo]
# Goal
Deploy base artifacts using an ARM template that we'll use throughout the day using the Azure Portal.

# Requirements
Azure PowerShell Module version 5.xx

In an Administrator PowerShell console window, type:

`Install-Module -Name AzureRM -RequiredVersion 5.6.0 -Force`

# Let's code!
## Provision OMS
Open a PowerShell console and type the following:

`Login-AzureRmAccount`

Enter your credentials

Select the desired subscription using:

`Set-AzureRmContext -Subscription 'MySubscriptionName'`

Invoke the provisioning by typing:

`& .\Invoke-Provisioning.ps1`

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"