# Global Azure Bootcamp 2018 - Montréal & Ottawa, Canada

![gablogo][gablogo]

All around the world user groups and communities want to learn about Azure and Cloud Computing!

On **April 21, 2018**, all communities will come together once again in the fifth great [Global Azure Bootcamp](https://global.azurebootcamp.net/) event!

You will find included in this repository all materials use during the demos so you can try them at home.

## Life after initial deployment
Life has been going very well at *Contoso* as they just released the first version of their latest product in production.

Yesterday, *Contoso* lack of visibility in production bite them back as issues started to appear, the support & development teams didn't have much information to help troubleshoot the errors. After a long retrospective meeting, they decided to improve their maturity in troubleshooting and management of their cloud infrastructure.

At the end of their meeting they agreed on the following:

* Use an Application Performance Management (APM) tool to improve the visibility of their application
* Centralize the logs of their application and activities in Azure
* Have an audit logs of VMs remote access in production
* Better control the network traffic reaching virtual machines
* Be better at troubleshooting hard to diagnose problems like high CPU or memory leaks
* Reduce the noise to ensure people are not flooded by emails when a problem occurs
* Ensure only the right people have access to the cloud infrastructure
* Allow people to create/maintain cloud resources which are aligned with the company new governance.

The team has been assigned a couple of days to find tools & put new processes in place to check all the action items of the list above. Excited, the team will actively start documenting themselves and working on this tomorrow.

## Overview of the day

Step | Tittle | Description
-----|--------|------------
[Step 1](./step1/readme.md) | Provision Log Analytics | Deploy Log Analytics artifacts using an ARM template that we'll use throughout the day using the Azure Portal.
[Step 2](./step2/readme.md) | Provision environment | Deploy base artifacts using an ARM template that we'll use throughout the day using the Azure Portal.
[Step 3](./step3/readme.md) | Application Insights 1 | Learn how to use Application Insight to find problem in a running solution.
[Step 4](./step4/readme.md) | Log Analytics | Configuring Key Vault Analytics solution and creating alerts.
[Step 5](./step5/readme.md) | Azure Security Center |
[Step 6](./step6/readme.md) | App Service | How to configure remote debugging for Web Apps & Visual Studio 2017 and how to edit in production.
[Step 7](./step7/readme.md) | Application Insights 2 |
[Step 8](./step8/readme.md) | Azure Monitor | Explore monitoring and troubleshooting with Azure Monitor.
[Step 9](./step9/readme.md) | ARM Governance | Learn how to use and configure Azure policies

## Technology Stack required for the Global Azure Bootcamp 2018

* [Visual Studio 2017 or later](https://www.visualstudio.com/downloads/)
* [Azure PowerShell Module version 5.xx](https://github.com/Azure/azure-powershell/releases/tag/v5.2.0-January2018)
* [Git for Windows](https://git-scm.com/download/win)

## What you will need before the bootcamp?
Before the bootcamp, we encourage you to make sure you have all the requirement software so you can concentrate on learning and not running installations.  Make sure you get all the source code and install all the required software.

### Azure subscription
If you don't own an Azure subscription already, you can create your free account today. It comes with 200$ credit, so you can experience almost everything without spending a dime. 

Make sure to have your account up and ready before the bootcamp.

[Create your free Azure account today](https://azure.microsoft.com/en-us/free/)

*more detail soon....*

[gablogo]: ./media/logo-2018-500x444.png "Global Azure Bootcamp logo"
