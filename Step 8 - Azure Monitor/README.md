![gablogo][gablogo]

# Explore monitoring and troubleshooting with Azure Monitor

Azure Monitor is a service that gives you visibility into the performance, health and states of your Azure resources. 

Azure Monitor is available for almost every Azure resource and provides almost "free" out of the box monitoring otion. 

During this session, you will learn how to use Azure Monitor to perform troubleshooting. You will understand how Azure Monitor can help you to have a better visibility into anything that can impact your app availability and performance. 

We will show you how you can use Azure monitor to stay on top of things by generating notifications when a degradation happens. Because no matter what you do, it always happens.

## Inside Azure Monitor

At the heart of Azure Monitor is a telemetry pipeline that connects to your Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure Monitor has 3 categories of monitoring data: 

* Activity Logs
* Diagnostic Logs
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
You will also notice that we have alerts here.

This is an important part of monitoring.  As it allows you to get notified and take action against a specific event.

You can set alerts on your metrics to keep check on the health and performance of your resources.

![New Alert experience](Media/NewAlertMenu.PNG)
Alerts experience in Azure has a fresh look and updated functionality. This new experience is available from the Alerts tab under Azure Monitor. The following are some of the advantages of using the new Alerts experience compared to Alerts (Classic) experience:

* Separation of Fired alerts and Alert Rules - In the new Alerts experience, Alert Rules (the definition of condition that triggers an alert), and Fired Alerts (an instance of the alert rule firing) are differentiated, so the operational and configuration views are separated.
* A unified authoring experience for metric, activity log and log alerts - The new Alerts authoring experience guides the user along the process of configuring an alert rule, which makes it simpler to discover the right things to get alerted on.
* View fired Log Analytics alerts in Azure portal - In the Alerts experience, you can now also see fired Log Analytics alerts in your subscription.

In other word, no need to use Azure Alert Classic

When you set an alert, you set the criteria first and than choose how you want to be notified. Via SMS, email, or trigger a ticket in your incident management system or for more customization you can use Logic APP where you can define any custom workflow. 

### Get smarter alerts with Logic App

### Routing your logs
If you want to route for depeer analytics of your log, you can select your preferred way by customizing the diagnostics settings.  You can choose to stream the telemetry to your event hubs, or archive it in your storage account.

## Wrapping up

[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
