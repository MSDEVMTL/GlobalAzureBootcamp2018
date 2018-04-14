![gablogo][gablogo]
# Goal
Configuring Key Vault Analytics solution and creating KeyVault alerts.

# Let's code!

## Installing the solution
Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

Then in the menu, select **Log analytics (OMS)**.

![step4_001][step4_001]

Select **+ Add** and type **Key Vault Analytics** in the search box. In the results select **Key Vault Analytics**.

![step4_002][step4_002]

Select **Create**

![step4_003][step4_003]

Select the OMS workspace named **gab2018-dev-oms-all**

![step4_004][step4_004]

To deploy the solution, select **Create**

![step4_005][step4_005]

The Key Vault Analytics solution should now be available in the `ResourceGroup` **gab2018-dev**.

![step4_006][step4_006]

## Enabling Key Vault diagnostics to be sent to Log Analytics
Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

Then in the menu, select **Diagnostics logs**.

![step4_007][step4_007]

Select **+ Add diagnostic setting**.

![step4_008][step4_008]

In the `Name` textbox type **Log Analytics**.

Select `Send to Log Analytics`.

Select `Configure` and choose the OMS workspace named **gab2018-dev-oms-all**

In `Log`, check the checkbox **AuditEvent**

Then select **Save**

![step4_009][step4_009]

# Leverage Log Analytics to create alerts

## Creating an alert for when KeyVault secrets are accessed

...

## Creating an alert for when KeyVault secrets are written

...


### Reference

* [Log Analytics](https://docs.microsoft.com/en-us/azure/log-analytics/)
* [Key Vault Analytics Solution](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/Microsoft.KeyVaultAnalyticsOMS?tab=Overview)


# End

[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[step4_001]: media/step4_001.jpg "1"
[step4_002]: media/step4_002.jpg "2"
[step4_003]: media/step4_003.jpg "3"
[step4_004]: media/step4_004.jpg "4"
[step4_005]: media/step4_005.jpg "5"
[step4_006]: media/step4_006.jpg "6"
[step4_007]: media/step4_007.jpg "7"
[step4_008]: media/step4_008.jpg "8"
[step4_009]: media/step4_009.jpg "9"