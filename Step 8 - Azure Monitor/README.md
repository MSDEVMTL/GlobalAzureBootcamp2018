![gablogo][gablogo]

# Explore monitoring and diagnostics with Azure Monitor

Azure Monitor is a platform that give you visibility into the performance, health and states of your Azure resources.

During this session, you will learn how to use Azure Monitor, logs and diagnostics to perform troubleshooting. You will understand how Azure Monitor can help you to have a better visibility into anything that can impact your app availablity and performance. 

We will show you how you can use Azure monitor to stay on top of things by generating notifications when a degradation happen. Because nomather what you do, they happen.

## What is Azure Monitor

Azure Monitor is a service that provides a single source for monitoring Azure resources.

With it you can visualize, query and take action on the metrics and logs coming from resources in Azure.

### Oversee your insights with Azure dashboad

These insights can be visualized within an Azure dashboard giving you an end-to end monitoring experience for infrastructure metrics, for your most important resources such as VM and web servers, For your Application Telemetry, such as response time and application dependencies and aggregated view of operationl insights such as missing patches and change activity. And last but not least, security health and recommendations.

Azure dashboard are shareable and entirely customizable the way is important for you.

### Inside Azure Monitor

At the hearth of Azure Monitor is a telemetry pipeline that connect to your Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure monitor is collectioning metrics, logs, health and service events from these services.

### How to start using Azure Monitor

To get Azure Monitoting working for you back in the Azure portal and navvigate to this monitoring icon.

If you dont see it, just add it as your favorite this way (see screenshot)

### Logs

From Azure Monitoring you can explorer all the raw telemetry from your Azure services, such as activity log ( navigate to activity log ) which gives you information about event such as when VM shutdown or deployment failure.

### Diagnostics
And if you want more information you can always look at diagnostic logs .

### Metrics
We can move over to metrics, which shows you all the performance telemetry from your servers and apps

### Alerts
You will also notice that we have alerts here.

This is an important part of monitoring.  As it allows you to get notified and take action against a specific event.

You can set alerts on your metrics to keep check on the health and performance of your resources

When you set an alert, you set the criteria first and than choose how you want to be notified. Via SMS, email, or trigger a ticket in your incident mangement system or for more customization you can use Logic APP where you can define any custom workflow. 

### Get smarter alerts with Logic App

### Routing your logs
If you want to route for depeer analytics of your log, you can select your prefered way by customizing the diagnostics settings.  You can choose to stream the telemetry to your event hubs, or archvie it in your storage account.

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

