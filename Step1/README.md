![gablogo][gablogo]
# Goal
Deploy OMS artifacts using an ARM template that we'll use throughout the day using the Azure Portal.

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

After provisioning is finished, navigate to the [Azure portal](https://portal.azure.com)

In the search bar type `gab2018-dev-oms-all`, click the related *Log Analytics* resource

![search-oms-in-portal][search-oms-in-portal]

Once in the resource, scroll down the left pane to **Azure Activity Log** then click the desired subscription

![browse-to-subscription-to-connect][browse-to-subscription-to-connect]

A new pane will open, click the **Connect** button

![connect-subscription-to-log-analytics][connect-subscription-to-log-analytics]


# End

[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[search-oms-in-portal]: media/search-oms-in-portal.png "Search for OMS in Azure portal"
[browse-to-subscription-to-connect]: media/browse-to-subscription-to-connect.png "Navigate to subscription to connect to Log Analytics"
[connect-subscription-to-log-analytics]: media/connect-subscription-to-log-analytics.png "Connect subscription to Log Analytics"