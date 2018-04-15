![gablogo][gablogo]
# Goal
Deploy base artifacts using an ARM template that we'll use throughout the day using the Azure Portal.

# Requirements
* [Azure PowerShell Module version 5.xx](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-5.7.0)
* Visual Studio 2017

In an Administrator PowerShell console window, type:
`Install-Module -Name AzureRM -RequiredVersion 5.6.0 -Force`

# Let's code!
## Provision environment
Open a PowerShell console and type the following:
`Login-AzureRmAccount`

Enter your credentials

Select the desired subscription using:
`Set-AzureRmContext -Subscription 'MySubscriptionName'`

Invoke the provisioning by typing:
`& .\Invoke-Provisioning.ps1`

## Provision environment
Open solution in Visual Studio:

Open Visual Studio 2017 and click on the menu File -> Open -> Project/Solution
![open-solution-menu-in-vs2017][open-solution-menu-in-vs2017]


Browse to file `..\Step0\Initial Solution\GlobalAzureBootcamp2018.sln`
![open-solution-dialog][open-solution-dialog]

In the Solution Explorer panel, right-click on the solution, then click **Restore NuGet Packages**
![restore-nuget-pakages-on-solution][restore-nuget-pakages-on-solution]

Wait a couple of seconds for the packages restore to complete...
![nuget-package-restore-finished][nuget-package-restore-finished]

One restored, your solution is now ready to be deployed on Azure.

In the Solution Explorer panel, right-click on the web application, then click **Publish**

In the dialog that appears, ensure *Microsoft Azure App Service* is selected, then click the **Select Existing** option and click the **Publish** button.
![publish-to-azure-appservice][publish-to-azure-appservice]

In the dialog that appears, top right, ensure you are using the right account (if not or not logged yet, Add your account in and select it to continue). Choose the right subscription from the drop-down and in the search box, enter `gab2018`, this will filter the desired web app if you have many in your subscription. Click the filtered *App Service*, should have a name with the following pattern *gab2018-dev-web-app-** then click the **OK** button to start the publish process...
![select-and-publish-to-gab2018-appservice][select-and-publish-to-gab2018-appservice]

Wait compilation to complete and publish process to take place. After a while you'll have a browser window that opens to the URL of your web application in Azure.
![webapp-is-deployed][webapp-is-deployed]

# End

[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[open-solution-menu-in-vs2017]: media/open-solution-menu-in-vs2017.png "Open solution menu in Visual Studio 2017"
[open-solution-dialog]: media/open-solution-dialog.png "Open solution dialog"
[restore-nuget-pakages-on-solution]: media/restore-nuget-pakages-on-solution.png "Restore NuGet packages on solution"
[nuget-package-restore-finished]: media/nuget-package-restore-finished.png "NuGet packages restore completion"
[publish-to-azure-appservice]: media/publish-to-azure-appservice.png "Publish to Azure AppService"
[select-and-publish-to-gab2018-appservice]: media/select-and-publish-to-gab2018-appservice.png "Select App Service to publish to"
[webapp-is-deployed]: media/webapp-is-deployed.png "WebApp is now deployed"