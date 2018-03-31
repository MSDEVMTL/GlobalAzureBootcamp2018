![gablogo][gablogo]

# Explore monitoring and troubleshooting with Azure Monitor

Azure Monitor is a landing page that helps users to have a better visibility into the performance, health and states of Azure resources. 

During this session, you will learn how to use Azure Monitor to perform troubleshooting. You will understand how Azure Monitor can help you to have a better visibility into anything that can impact your app availability and performance. 

We will show you how you can use Azure monitor to stay on top of things by generating notifications when a degradation happens. Because no matter what you do, it always happens.

## Inside Azure Monitor

At the heart of Azure Monitor is a telemetry pipeline that connects to your Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure Monitor has 3 categories of monitoring data: 

* Activity logs
* Diagnostic logs
* Metrics

## Activity Logs
The Azure Activity Log is a subscription log that provides insight into subscription-level events that have occurred in Azure.  Using the Activity Log, you can determine the ‘what, who, and when’ for any write operations (PUT, POST, DELETE) taken on the resources in your subscription.

The Azure Activity Log is primarily for activities that occur in Azure Resource Manager. It does not track resources using the Classic model. 

You can retrieve events from your Activity Log using the Azure portal, CLI, PowerShell cmdlets, and Azure Monitor REST API.

### LAB 1 - Who scale your app service plan?

**Prerequisite:** Change you app service plan from Free tier to D1 Shared

**Scenario**: You are reviewing your Azure subscription bill like you do every month but this time you're saw a sudden increase of your  subscription total. Someone scaled up your service plan from a Free tier to a D1 Shared but you just don't recall that you've made that change.

**Goal:** Identify who made that change

* Step 1 : Go on Azure portal and choose the Azure Monitor landing page
* Step 2: Select Activity log the navigation pan
* Step 3: Use the filter to search changes that occured during the last month for you service plan.
* Step 4: Observe : A scale was done on [date] by [user].

## Alerts

You can receive an alert based on monitoring metrics for, or events on, your Azure services.

* Metric values - The alert triggers when the value of a specified metric crosses a threshold you assign in either direction. That is, it triggers both when the condition is first met and then afterwards when that condition is no longer being met.
* Activity log events - An alert can trigger on every event, or, only when certain event occurs.

You can configure a classic metric alert to do the following when it triggers:

* send email notifications to the service administrator and co-administrators
* send email to additional emails that you specify.
* call a webhook
* start execution of an Azure runbook (only from the Azure portal)

Azure Monitor now supports a new metric alert type. The newer alerts differ from classic metric alerts in a few ways:

* **Improved latency**: Newer metric alerts can run as frequently as every one minute. Older metric alerts always run at a frequency of 5 minutes. Log alerts still have a longer than 1 minute delay due to the time is takes to ingest the logs.
* **Support for multi-dimensional metrics**: You can alert on dimensional metrics allowing you to monitor an only an interesting segment of the metric.
* **More control over metric conditions**: You can define richer alert rules. The newer alerts support monitoring the maximum, minimum, average, and total values of metrics.
* **Combined monitoring of multiple metrics**: You can monitor multiple metrics (currently, up to two metrics) with a single rule. An alert is triggered if both metrics breach their respective thresholds for the specified time-period.
* **Better notification system**: All newer alerts use action groups, which are named groups of notifications and actions that can be reused in multiple alerts. Classic metric alerts and older Log Analytics alerts do not use action groups.
* **Metrics from Logs (limited public preview)**: Log data going into Log Analytics can now be extracted and converted into Azure Monitor metrics and then alerted on just like other metrics.

### LAB 2 - Generate an alert when you app service plan is updated?

**Scenario**: In the previous lab we saw how it easy using the activity log to monitor changes in our Azure resources.  Let's now generate when an update is done to your app service plan. 

**Goal:** Generate a new alert when your service plan is updated.

* Step 1: From the navigation pane in Azure Monitor, select ***Alert***
* Step 2: Using the top menu, click ***+ New Alert Rule***
* Step 3: Select your app Service Plan as the target of your alert
* Step 4: Use ***Create or Update App Service Plan*** as criteria.
* Step 5: Type a name, a description and a severity for your alert. ex: ***GAB 2018 App service plan updates*** and ***A change has been made to your service plan***, ***Severity 3***
* Step 6: Let's now change your App Service Plan back to Free tier

### Metrics

Right of the bat, metrics (telemetry data \ performance counters) are already configured. Just wait a few minutes after creating your virtual machines and you should see available metrics that you wish to display. That is it. No cost. No configuration, but a limited range of metrics by default.  

Metrics are:

* Collected at one minute frequency
* Available immediately
* Retained for 30 days

## Metrics (Preview)



### LAB 3 - *********

**Scenario**: ....

**Goal:** ....

* Step 1: ...
* Step 2: ...
* Step 3: ...

## Diagnostics Logs
What can we do if we need additional performance data? E.g. memory. 

## Service Health

Service Health is your personalized dashboard in the Azure Portal for receiving notifications when Azure service issues, update or planned maintenance that could affect your resources


### Get smarter alerts with Logic App

You should receive two emails alert when a metric reach it's configured limit. One when it's get activated and another one when the metric is back under normal value. Receiving too many emails for alerts can be annoying and also the basic email alert template doesnt tell you much information on the current situation.



### Routing your logs
If you want to route for depeer analytics of your log, you can select your preferred way by customizing the diagnostics settings.  You can stream monitoring data to other locations.

Examples include:

* Send to Application Insights so you can use its richer visualization and analysis tools.
* Send to Event Hubs so you can route to third-party tools.

### Store and Archive
Some monitoring data is already stored and available in Azure Monitor for a set amount of time.

* Metrics are stored for 30 days.
* Activity log entries are stored for 90 days.
* Diagnostics logs are not stored at all.

### Visualize
Visualizing your monitoring data in graphics and charts helps you find trends quicker than looking through the data itself.

A few visualization methods include:

* Use the Azure portal
* Route data to Azure Application Insights
* Route data to Microsoft PowerBI
* Route the data to a third-party visualization tool using either live streaming or by having the tool read from an archive in Azure storage

### Pin to your Dashboard
You can create multiple dashboards and share them with others who have access to your Azure subscriptions. 

### Reference
* [Overview of Azure Monitor](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-azure-monitor)
* [View activity logs to audit actions on resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-audit)

* [Create and share dashboards in the Azure portal](https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-dashboards)
* [The next generation of Azure Alerts has arrived](https://azure.microsoft.com/en-us/blog/the-next-generation-of-azure-alerts-has-arrived/)
* [Azure Monitor–General availability of multi-dimensional metrics APIs](https://azure.microsoft.com/en-us/blog/azure-monitor-general-availability-of-multi-dimensional-metrics-apis/)
* [Supported metrics with Azure Monitor](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-metrics)
* [Monitor Subscription Activity with the Azure Activity Log](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs)
* [Azure Monitor Pricing](https://azure.microsoft.com/en-us/pricing/details/monitor/)
* [Azure diagnostic logs](https://docs.microsoft.com/en-us/azure/cdn/cdn-azure-diagnostic-logs)


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
