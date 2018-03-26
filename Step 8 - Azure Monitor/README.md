![gablogo][gablogo]

# Explore monitoring and troubleshooting with Azure Monitor

Azure Monitor is a landing page that helps users to have a better visibility into the performance, health and states of your Azure resources. 

During this session, you will learn how to use Azure Monitor to perform troubleshooting. You will understand how Azure Monitor can help you to have a better visibility into anything that can impact your app availability and performance. 

We will show you how you can use Azure monitor to stay on top of things by generating notifications when a degradation happens. Because no matter what you do, it always happens.

## Inside Azure Monitor

At the heart of Azure Monitor is a telemetry pipeline that connects to your Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure Monitor has 3 categories of monitoring data: 

* Activity logs
* Diagnostic logs
* Metrics

## How can you start using Azure Monitor?

To get Azure Monitor working for you, we just need to go back in the Azure portal and navigate to Azure Monitor section.

### Activity Logs
Activity logs gives you information about events such as when VM shutdown or deployment failure.
It require you to create a storage account to store your logs. Charges will occured. ref ![Step 4 - Log Analytics](../Step 4 - Log Analytics)

### Diagnostics Logs
What can we do if we need additional performance data? E.g. memory. 

### Metrics

Right of the bat, metrics (telemetry data \ performance counters) are already configured. Just wait a few minutes after creating your virtual machines and you should see available metrics that you wish to display. That is it. No cost. No configuration, but a limited range of metrics.  

Metrics are:

* Collected at one minute frequency
* Available immediately
* Retained for 30 days


### Alerts

Alert allows you to get notified and take action against a specific event.

You can set alerts on your metrics to keep check on the health and performance of your resources.

![New Alert experience](Media/NewAlertMenu.PNG)

Alerts experience in Azure has a fresh look and updated functionality. This new experience is available from the Alerts tab under Azure Monitor. The following are some of the advantages of using the new Alerts experience compared to Alerts (Classic) experience:

* Separation of Fired alerts and Alert Rules - In the new Alerts experience, Alert Rules (the definition of condition that triggers an alert), and Fired Alerts (an instance of the alert rule firing) are differentiated, so the operational and configuration views are separated.
* A unified authoring experience for metric, activity log and log alerts - The new Alerts authoring experience guides the user along the process of configuring an alert rule, which makes it simpler to discover the right things to get alerted on.
* View fired Log Analytics alerts in Azure portal - In the Alerts experience, you can now also see fired Log Analytics alerts in your subscription.

In other word, no need to use Azure Alert Classic

### Get smarter alerts with Logic App

[DEMO HERE]

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

### Dashboard
You can create multiple dashboards and share them with others who have access to your Azure subscriptions. 

### Reference
* https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-azure-monitor
* https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-dashboards


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
