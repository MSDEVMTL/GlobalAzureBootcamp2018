![gablogo][gablogo]
# Goal
Deploy Log Analytics (OMS) artifacts using an ARM template that we'll use throughout the day using the Azure Portal.

# Requirements
* [Azure PowerShell Module version 5.xx](https://github.com/Azure/azure-powershell/releases/tag/v5.2.0-January2018)
* [Git for Windows](https://git-scm.com/download/win)

In an Administrator PowerShell console window, type:

``` powershell
Install-Module -Name AzureRM -RequiredVersion 5.2.0 -Force
```

# Let's code!
## Clone repository
Ensure you have Git for Windows installed.

Open a PowerShell console and type the following:

``` powershell
git clone https://github.com/MSDEVMTL/GlobalAzureBootcamp2018.git c:\gab2018\

Set-Location c:\gab2018\step1\
```
![git-clone-repository][git-clone-repository]

## Provision OMS
Still in the PowerShell console, type the following:

``` powerhell
Login-AzureRmAccount
```

Enter your credentials

Select the desired subscription using:

``` powershell
Set-AzureRmContext -Subscription 'MySubscriptionName'
```

Invoke the provisioning by typing:

``` powershell
& .\Invoke-Provisioning.ps1
```

> Presenter: While provisioning is running (~1min), you can show the scripts/templates around...

> ### NOTE: Log Analytics changed his pricing model in April 2018. If you encounter an error in the step above saying:
> 
> *Pricing tier doesn't match the subscription billing model*
>
> Browse to the file `template-oms.parameters.json` and change the value of the `Sku` parameter from **Free** to **PerGB2018** (or the opposite) and run the provisioning again.
![log-analyics-new-pricing-model-error][log-analyics-new-pricing-model-error]


After provisioning is finished, navigate to the [Azure portal](https://portal.azure.com)

In the search bar type `gab2018-dev-oms-all`, click the related *Log Analytics* resource

![search-oms-in-portal][search-oms-in-portal]

Once in the resource, scroll down the left pane to **Azure Activity Log** then click the desired subscription

![browse-to-subscription-to-connect][browse-to-subscription-to-connect]

A new pane will open, click the **Connect** button

![connect-subscription-to-log-analytics][connect-subscription-to-log-analytics]

# Reference
[Log Analytics Documentation](https://docs.microsoft.com/en-us/azure/log-analytics/)

# End
*Previous Step*
[Next Step](../Step2/README.md)


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[search-oms-in-portal]: media/search-oms-in-portal.png "Search for OMS in Azure portal"
[browse-to-subscription-to-connect]: media/browse-to-subscription-to-connect.png "Navigate to subscription to connect to Log Analytics"
[connect-subscription-to-log-analytics]: media/connect-subscription-to-log-analytics.png "Connect subscription to Log Analytics"
[log-analyics-new-pricing-model-error]: media/log-analyics-new-pricing-model-error.png "Error when provisioning Free sku under April 2018 new pricing model"
[git-clone-repository]: media/git-clone-repository.png "Git clone MSDEVMTL GAB 2018 repository"