![gablogo][gablogo]
# Goal
Configuring Key Vault Analytics solution and creating KeyVault alerts.

# Let's code!

## Installing the solution
1. Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

2. In the menu, select **Log analytics (OMS)**.

![step4_001][step4_001]

3. Select **+ Add** and type **Key Vault Analytics** in the search box.
4. In the results select **Key Vault Analytics**.

![step4_002][step4_002]

5. Select **Create**

![step4_003][step4_003]

6. Select the OMS workspace named **gab2018-dev-oms-all**

![step4_004][step4_004]

7. To deploy the solution, select **Create**

![step4_005][step4_005]

8. The Key Vault Analytics solution should now be available in the `ResourceGroup` **gab2018-dev**.

![step4_006][step4_006]

## Enabling Key Vault diagnostics to be sent to Log Analytics
1. Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

2. In the menu, select **Diagnostics logs**.

![step4_007][step4_007]

3. Select **+ Add diagnostic setting**.

![step4_008][step4_008]

4. In the `Name` textbox type **Log Analytics**.

5. Select `Send to Log Analytics`.

6. Select `Configure` and choose the OMS workspace named **gab2018-dev-oms-all**

7. In `Log`, check the checkbox **AuditEvent**

8. Select **Save**

![step4_009][step4_009]

# Access the KeyVault Secrets
1. Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

2. In the menu, select **Secrets**.

![step4_010][step4_010]

3. Select a secret in the list, select the current version and select the **Show secret value**.

![step4_011][step4_011]

The goal here is to create access logs to the KeyVault, so we will be able to use it later. It should take up to **15-20 minutes** to be able to use those logs.


# Leverage Log Analytics to create alerts

## Creating an alert for when KeyVault secrets are accessed
1. Go to the `ResourceGroup` **gab2018-dev**, select the Key Vault Analytics resource **KeyVaultAnalytics(gab2018-dev-oms-all)**.

2. In the overview summary, select the Key Vault Analytics.

![step4_012][step4_012]

3. In **ALL OPERATIONS**, select the `SecretGet` operation.

![step4_013][step4_013]

4. Select **+ New Alert Rule**

![step4_014][step4_014]

5. In **1.Define alert condition** select **Alert Criteria**

![step4_015][step4_015]

6. In the **Alert Logic**, set the **Threshold** value to `1` and select **Done**

![step4_016][step4_016]

7. In **2.Define alert details**, enter the following values:

* **Alert rule name**: KeyVault Secret Accessed
* **Description**: Triggered when Key Vault secrets are accessed more than two times in 5 minutes.
* **Severity**: Informational(Sev 2)

![step4_017][step4_017]

8. In **3.Define action group**, select **+ New action group**.

Enter the following values:

* **Action group name**: Email Alert group
* **Short name**: EmailGroup.

9. In the actions, create an action with the following values:
* **Action name**: SendEmail
* **Action Type**: Email/SMS/Push/Voice

10. Select **Edit details**, enter your Email and select **OK**.

11. Finalize the creation of the by selecting **OK**

![step4_018][step4_018]

12. Wait for the action group to be created, and select **Select action group**.
13. Choose the created action group in the list and select **Add**.

14. Now select **Create alert rule** to finalize the creation of the alert and wait for it to be created.

![step4_019][step4_019]

15. Go to the `ResourceGroup` **gab2018-dev**, select the Log Analytics resource **gab2018-dev-oms-all**.

16. Select **Alerts** and ensure the alert was properly created.

![step4_020][step4_020]

## Test and receive an alert
1. Go to the `ResourceGroup` **gab2018-dev**, select the KeyVault **gab2018-dev-kv**.

2. Then in the menu, select **Secrets**.

![step4_010][step4_010]

3. Select the first secret in the list and select the current version. 

4. Go back to the list, select the second secret and select the current version.

![step4_021][step4_021]

**It should take up a few minutes to receive the KeyVault secrets accessed alert.**


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
[step4_010]: media/step4_010.jpg "10"
[step4_011]: media/step4_011.jpg "11"
[step4_012]: media/step4_012.jpg "12"
[step4_013]: media/step4_013.jpg "13"
[step4_014]: media/step4_014.jpg "14"
[step4_015]: media/step4_015.jpg "15"
[step4_016]: media/step4_016.jpg "16"
[step4_017]: media/step4_017.jpg "17"
[step4_018]: media/step4_018.jpg "18"
[step4_019]: media/step4_019.jpg "19"
[step4_020]: media/step4_020.jpg "20"
[step4_021]: media/step4_021.jpg "21"