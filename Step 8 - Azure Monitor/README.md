![gablogo][gablogo]

# Explore monitoring and troubleshooting with Azure Monitor

Azure Monitor is a service that gives you visibility into the performance, health and states of your Azure resources. With Azure Monitor, you can consume metrics and logs within the portal and via APIs.

During this session, you will learn how to use Azure Monitor to perform troubleshooting. You will understand how Azure Monitor can help you to have a better visibility into anything that can impact your app availability and performance. 

We will show you how you can use Azure monitor to stay on top of things by generating notifications when a degradation happens. Because no matter what you do, it always happens.

### Oversee your insights with Azure dashboard

These insights can be visualized within an Azure dashboard giving you an end-to end monitoring experience:

* Infrastructure metrics
* VM and web servers
* Application telemetry, such as response time and application dependencies
* Security health and recommendations.

Azure dashboards are shareable and entirely customizable the way is important for you.

### Inside Azure Monitor

At the heart of Azure Monitor is a telemetry pipeline that connects to your Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure monitor is collecting metrics, logs, health and service events from these services.

### How to start using Azure Monitor

To get Azure Monitoting working for you back in the Azure portal and navigate to this monitoring icon.

If you don't see it, just add it as your favorite this way (see screenshot)

### Logs

From Azure Monitoring you can explorer all the raw telemetry from your Azure services, such as activity log ( navigate to activity log ) which gives you information about events such as when VM shutdown or deployment failure.

### Diagnostics
And if you want more information, you can always look at diagnostic logs .

### Metrics
We can move over to metrics, which shows you all the performance telemetry from your servers and apps

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
