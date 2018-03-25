![gablogo][gablogo]

#Explore Microsoft Azure Monitoring and diagnostics with Azure Monitor

Azure Monitor is a platform that give you built-in for all visibility into the performance, helth and state of your Azure resources.

We will show you how it works. How to create alerts and to eneable deeper insights and analytics to perform troubleshooting.

When you are managing cloud-based services, it's important to have visibility into anything that can impact your app availability and performance.

Azure Monitor is a service that provides a single source for monitoring Azure resources.

With it you can visualize, query and take action on the metrics and logs coming from resources in Azure.

These insights can be visualized within an Azure dashboard giving you an end-to end monitoring experience for infrastructure metrics, for your most important resources such as VM and web servers, For your Application Telemetry, such as response time and application dependencies and aggregated view of operationl insights such as missing patches and change activity. And last but not least, security health and recommendations.

Azure dashboard are shareable and entirely customizable the way is important for you.

Let's take a look at how the Azure Monitoring works

At the hearth of Azure Monitor is a telemetry pipeline that conencts to yoru Azure services.  And there are over 30 services that you can pull data from now. And the list keeps growing.

Azure monitoring is collection metrics, logs, health and service events from these services.


This allows for a consistent monitoring experience insite the Azure portal.  You can unlock deeper insights by routing the raw telemetry to Azure log analtyics.

All of this can be visuzalize in a single Azure dashboard as I just showed.  And of course you can consume the telemetry into your preferred monitoring sollution with Microsft Azure REST API's.

To get Azure Monitoting working for you back in the Azure portal and navvigate to this monitoring icon.

If you dont see it, just add it as your favorite this way ( see screenshot)

From Azure Monitoring you can explorer all the raw telemetry from your Azure services, such as activity log ( navigate to activity log ) which gives you information about event such as when VM shutdown or deployment failure.

And if you want more information you can always look at diagnostic logs .

We can move over to metrics, which shows you all the performance telemetry from your servers and apps

You will also notice that we have alerts here.

This is an important part of monitoring.  As it allows you to get notified and take action against a specific event.

You can set alerts on your metrics to keep check on the health and performance of your resources

When you set an alert, you set the criteria first and than choose how you want to be notified. Via SMS, email, or trigger a ticket in your incident mangement system or for more customization you can use Logic APP where you can define any custom workflow. 

If you want to route for depeer analytics of your log, you can select your prefered way by customizing the diagnostics settings.  You can choose to stream the telemetry to your event hubs, or archvie it in your storage account.

Lastly, let's also take a quick look at how Azure Monitor helps you triage an event:


# Demo
Step goals

# Reference

# Let's code!
## Addendum

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

