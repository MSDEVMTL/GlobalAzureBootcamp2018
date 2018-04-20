![gablogo][gablogo]
# Goal
Learn how to use Application Insight to find performance problems in a running application.

# Let's code!

## Set the context

Sometimes, it helps when we get started to know what we are looking for. In this first part of the Lab, we will create an Azure Function that will call our website every 15 seconds.  

Once the function is in place we will also create some traffic to the site by navigating around. One method has a `wait` in it and is intented to simulate work. Let's see if Application Insight will help us pinpoint it. 

## Setup the client side tracking

First, open the solution code and modify the file `Views\Shared\_Layout.cshtml`. Locate the following code:

```javascript
    <script type = 'text/javascript' >
        var appInsights=window.appInsights||function(config)
        {
            function r(config){ t[config] = function(){ var i = arguments; t.queue.push(function(){ t[config].apply(t, i)})} }
            var t = { config:config},u=document,e=window,o='script',s=u.createElement(o),i,f;for(s.src=config.url||'//az416426.vo.msecnd.net/scripts/a/ai.0.js',u.getElementsByTagName(o)[0].parentNode.appendChild(s),t.cookie=u.cookie,t.queue=[],i=['Event','Exception','Metric','PageView','Trace','Ajax'];i.length;)r('track'+i.pop());return r('setAuthenticatedUserContext'),r('clearAuthenticatedUserContext'),config.disableExceptionTracking||(i='onerror',r('_'+i),f=e[i],e[i]=function(config, r, u, e, o) { var s = f && f(config, r, u, e, o); return s !== !0 && t['_' + i](config, r, u, e, o),s}),t
        }({
            instrumentationKey: 'YOUR_INSTRUMENTATION_KEY_HERE'
        });
        
        window.appInsights=appInsights;
        appInsights.trackPageView();
    </script>
```
Replace the string `YOUR_INSTRUMENTATION_KEY_HERE` with `@Microsoft.ApplicationInsights.Extensibility.TelemetryConfiguration.Active.InstrumentationKey`

Deploy your application to the App Service **gab2018-dev-UNIQUE_STRING**

## Create an Azure Function

Second, let's go in the Function App. Navigate to the Azure Portal ([portal.azure.com](https://portal.azure.com) and select the `ResourceGroup` **gab2018-dev**. Then select the Function App starting by `gab2018-dev-func-app-  `.

![CreateAzureFunction][CreateAzureFunction]

To Create a new Azure Function click the "+" sign on the right of Functions (2) in the left menu bar. Then as showed in the screen capture (3) click on Timer. By sure that `Csharp` is selected (4). Finally click the button *Create this Function*. 

In the new window that appears, copy and paste the following code.

```csharp
using System;

public async static Task Run(TimerInfo myTimer, TraceWriter log)
{
    log.Info($"C# Timer trigger function executed at: {DateTime.Now}");

    using(var client = new HttpClient())
    {
        client.BaseAddress = new Uri("https://gab2018-dev-web-app-REPLACE_BY_YOUR_UNIQUE_STRING.azurewebsites.net/home/DoSomethingLong");
        var result = await client.GetAsync("");
        string resultContent = await result.Content.ReadAsStringAsync();
        log.Info(resultContent);
    }
}

```

This code will call the method `DoSomethingLong` of our web application. We need to update the Url with the proper unique identifier. When we deployed, a Unique String identifier was added into our name to ensure uniqueness. This is part of the best practices. 

Get your Unique String by looking in the breadcrumb or the name of your Function App. You could also go in your Service App, the same Unique String is used across the deployment. In the screenshot, the Unique String is *rolawncs63psm*. Find yours and update the line *10* in the function code to point to the correct Uri.

![functionDone][functionDone]

The last thing to do is to change the schedule of our function so it's executed every 15 seconds. To do it click on *Integrate* under your function name in the left menubar (1). Then change the value of Schedule for `*/15 * * * * *`.

![timer][timer]

The function is now getting executed every 15 seconds. You can see execution logs that are generated in the Logs section, located just under the code.

## Just play a little

Navigate to the web application and navigate through all pages. Try clicking a few times on the *Test!* button on the Home page, the *Let's crash*... By clicking it, you are generating data that Application Insight is collecting.

We are now ready to go investigate our data.

# Let's Look at our collected data

## The Overview 

For this second part of the Lab we will by exploring the Application Insights blade in the portal. In the Azure portal, insode the the `ResourceGroup` **gab2018-dev** select the resource with the name that starts by `gab2018-dev-ai-all`. It's the one with the purple bulb icon.

![AppInsights][AppInsights]

By opening that blade, you should land in the Overview, and right away be able to see a few important things.

![overview][overview]

On top, you got six squares that provide information about the number of Alerts, Livestream, users, etc. We will come back to it in a few.

Then you and see multiple charts showing the Health of your application. Things like the server response time (ours is cleary wrong with an average of nine second), number of request and number of errors. Those charts are refreshed every thirty minutes. So you should read that as a life line... 

Below you got other charts that show you by groups the *Total of Server Requests by Request Performance*. Again we could see that in our case the majority of the request are in bettween 7secs-15secs.

## Application map blade

The more your solution contains resources the more this blade will be interesting. It shows all the relation between the different parts. Here we can see that our application is also connected to the Application Insights, and two other parts, including one that seems to be in error... but that will be discussed a next lab. For every component, have some metrics, and you can dig dipper from each of them. 

When you have multiple application reporting to the same Application Insight, you can filter down what's displayed in the options (the right panel). Here we don't see any filter because we only have one webApp that is monitored. 

This blade can be very useful to identify the bottleneck in the problematic component.

![ApplicationMap][ApplicationMap]

## Live Metrics Stream blade

The blade is like looking inside the motor of your car while it's running full speed. The amount of information that you can see here is incredible, and it's in real time! Try to have the windows/tabs open side by side; one on this page and the other with the web App. Look at the impact of each action in the report...

One thing here that we can notice is that we can see the exception thrown by the CreateMessage menu tab (in the top right corner), but we don't see the exception from the  "Let's crash". Why? 

```csharp

    public ActionResult Error()
    {
        try {
            throw new Exception("As expected it craches!");
        }
        catch (Exception ex) {
            ViewBag.Msg = ex.Message;
        }
        return View();
    }

```
As you can see that the exception is caught by the application, so it doesn't bubble-up. This window will only show unmanaged (uncaught) exceptions.  

![LiveStream][LiveStream]

## Failures blade

Another blade to get details on exceptions and different failures. Very useful. Once again, only unmanaged exceptions will appear here. How to see details about managed exceptions will be present in a next lab.

![Failures][Failures]

> **Note:**
> To know more about how you can bonify your managed exceptions, by using the Application Insights SDK, please refer to the [Global Azure Bootcamp 2017 - Step 6 - Analytics using Application Insights](https://github.com/MSDEVMTL/2017-04-22-GlobalAzureBootcamp2017/tree/master/Step%206%20-%20Analytics%20using%20Application%20Insights).

## Performance blade

The performance blade is one of the latest additions in the portal (still in Preview as of this writing (April 2018)). Now this is really a good place to look if you wish to get better performance. 

We can see that our current "performance" is pretty stable. We can also see that the slowest request overall is the `POST Queue/CreateMessage` but that it's called less often then the second one `GET home/DoSOmethingLong`. The latter takes an average of 12.3 seconds and is called 1,300 times! If you are looking to get the huge impact, it is definitely that that you should be working on!

Once again, take your time to test the impact of your action(s) in the website and come back to this report to see how it performs. Try to change the Operation time zoom to 95th percentile... 

![Performance][Performance]

## User Flow blade

This blade won't show you any performance problems, but will definitely help you to identify where is your traffic. Knowing the journey of your users will help you concentrate your effort to make your application run as optimal as it should. It will also make you realize were your efforts will have the biggest impact, but also will help you to know the overall context. Seeing the flow will help to understand what the user intent is and his context.

Take some time to visualize some flow. Do you recognize the things you did previously? You can also click on some Step to get more details.

![UserFlow][UserFlow]

## Browser blade

Application Insight can also track the client side. The Browser blade contains statistics about the client side of your application. This can be a gem when it comes to getting information about the performance and behavior of your application as a user sees it, such as lengthy Ajax request calls and client side (browser) exceptions.

![browser][browser]

# How much data do you need?

The application used in this demo is pretty simle and small. However, in a reel situation collect "all" the data like that will become a problem. First you will probably hit your quota very quickly and even though your user won't suffer from it, you may not have the full picture as information will be dropped in the process; Application Insights will stop collecting data. Of course, you could decide to go for a bigger plan (vertical scaling), and it's certainly worth it. 

The ideal smart way to get the maximum of your plan is by sampling your data. Selecting a fraction of data received from your app to Application Insights service is called Data sampling.

![sampling][sampling]

Let's change the current data sampling to select the amount of sampling 12.5%. From Application Insights blade, select the **Usage and estimation cost** option (1). Then on the click  **Data sampling**. Now change it to 12.5%. 

This option can be change at anytime. So you can bring it back to 100% and trying to undestand a bug in production.

## Keep the data

Liked mentioned in the introduction slide, all information collected by Application Insghts will by saved in Azure for 90 days. After that that data will be deleted. A good way to keep all the collected data is to configure a continuous export. The nice thing about it is that it's very easy to do. Click on the **Continuous Export** option (4). 

### Reference

* [Application Insights](https://azure.microsoft.com/en-us/services/application-insights/)
* [Application Insights Documentation](https://docs.microsoft.com/en-us/azure/application-insights/)
* [Interactive data analytics demo](https://analytics.applicationinsights.io/demo)


# End
[Previous Step](../Step2/README.md)
[Next Step](../Step4/README.md)

[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[CreateAzureFunction]: media/CreateAzureFunction.png "Create Azure Function"
[timer]: media/timer.png "Schedule Setting"
[functionDone]: media/functionDone.png "Function Done"
[overview]: media/overview.png "Overview  Application Insights blade"
[AppInsights]: media/AppInsights.png "Application Insight Resource"
[ApplicationMap]: media/ApplicationMap.png "Application Map blade"
[LiveStream]: media/LiveStream.png "Live Stream blade"
[Failures]: media/Failures.png "Failures blade"
[Performance]: media/Performance.png "Performance blade"
[UserFlow]: media/UserFlow.png "User Flow blade"
[sampling]: media/sampling.png "Data sampling"
[browser]: media/browser.png "Browser blade"
