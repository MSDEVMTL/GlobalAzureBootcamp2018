![gablogo][gablogo]
# Goal
Learn how to use Application Insight to find performance problems in a running application.

# Let's code!

## Set the context

Sometimes, it helps when we get started to know what we are looking for. In this first part of the Lab, we will create an Azure Function that will call our website every 15 seconds.  

Once the function is in place we will also create some traffic to the site by clicking around. One method has a `wait` in it and will be very slow... let see if Application Insight will help us finding it. 

## Create an Azure Function

First, let's go in the Function App. Navigate to the Azure Portal ((portal.azure.com)[https://portal.azure.com]) and select the `ResourceGroup` **gab2018-dev**. Then select the Function App starting by `gab2018-dev-func-app-  `.

![CreateAzureFunction][CreateAzureFunction]

To Create a new Azure Function click the "+" sign on the right of Functions (2) in the left menu bar. Then as showed in the screen capture (3) click on Timer. By sure that `Csharp` is selected (4). Finally clieck the button *Create this Function*. 

In the new windows that just showed copy paste the following code.

```csharp
using System;


public static async void Run(TimerInfo myTimer, TraceWriter log)
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

This code will call the method `DoSomethingLong` of our web application. We need to update the Url. When we deployed a Unique String was injected into our name to be sure that it was unique. This is part of the best practices. 

Get your Unique Sting by looking in the breadcrumb or the name of your Function App. You could also go in your Service App, the same Unique String is used across the deployment. In the screen capture the Unique String is *rolawncs63psm*. Find your's and update the line *10* the  function to fix the Uri.

![functionDone][functionDone]

The last thing to do is to change the schedule of our function so it's executed every 15 second.  Do to it client on *Integrate* under your function name in the left menubar (1). Then change the value of Schedule for `*/15 * * * * *`.

![timer][timer]

The function is now getting executed every 15 second. You can see the logs generated in the Logs section, located just under the code.

## Just play a little

Navigate to the web application and navigate through all pages. Try a few time the *Test!* button on the Home page, the *Let's crash*... doing so you are generating data that the Application Insight is collecting.

We are now ready to go investigate our data.

# Let's Look at our collected data

## The Overview 

For this second part of the Lab we will by exploring the Application Insights blade in the portal. In the Azure portal, insode the the `ResourceGroup` **gab2018-dev** select the resource with the name that starts by `gab2018-dev-ai-all`. It's the one with the purple bulb icon.

![AppInsights][AppInsights]

By opening that blade you should land in the Overview, and right away be able to see a few important things.

![overview][overview]

On the top you got six square that provide information about the number of Alerts, Livestream, users, and more. We will come back to it in a few.

Then you and see multiple charts showing the Health of your application. Things like The server response time (our is cleary wrong with an average of nine second), number of request and number of error.  Those charts are refresh every thirty minutes. So you should read that as a life line... 

Below you got other charts that show you by groups the *Total of Server Requests by Request Performance*.  Again we could see that in our case the majority of the request are in bettween 7sec-15sec.

## Application map blade

The more your solution contains resources the more this blade will be interesting. It shows all the relation between the different parts.   Here we can see that our application is also connected to the Application Insights, and two other parts, including one that seems to be in error... but that will be discussed a next lab.  For every component,  have some metrics, and you can dig dipper from each of them. 

When you have multiple application reporting to the same  Application Insight, you can filter down what's displayed in the options (the right panel). Here we don't see any filter because we only have one webApp that is monitored. 

This blade will be very useful to identify the bottle neck component.

![ApplicationMap][ApplicationMap]

## Live Metrics Stream blade

The blade is like looking inside the motor of your car while it's turning full speed.  It's incredible the amount of information that you can see, and it's in reel time!  Try to have to windows/ tabs open side by side; one this page and the other with the web App. Looks at the impact of each action in the report...

One thing here that we can notice is that we can see the exception throw by the CreateMEssage (in the top right corner), but we don't see the exception from the  "Let's carsh". Why? 

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
You can see that the code catches the exception, so it doesn't bubble-up.  This window will only show unmanaged exception.  

![LiveStream][LiveStream]

## Failures blade

Another blade to get details on exception and different failures. Very useful. Once again, only unmanaged exception will show here. How to see details about managed exception will be present in a next lab.

![Failures][Failures]

> **Note:**
> To know more about how you can bonify you managed eception by using the Application Insights SDK please refer to the [Global Azure BBootcamp 2017 - Step 6 - Analytics using Application Insights](https://github.com/MSDEVMTL/2017-04-22-GlobalAzureBootcamp2017/tree/master/Step%206%20-%20Analytics%20using%20Application%20Insights).

## Performance blade

The performance blave is one of the latest additions in the portal (still in Preview in April 2018). Now this is really a good place to look if you wish to get better performance. 

We can see that our current "performance" is pretty stable. We can also see that the slowest requests overall are the `POST Queue/CreateMessage` but that it's called less often then the second one `GET home/DoSOmethingLong`. This last one takes an average of 12.3 second and is called 1,300 times! If you are looking to get the biggest impact, its is definitely that thing you should be working on!

Once again, take your time test the impact of your action in the website to this report. Try to change the Operation time zoom to 95th... 

![Performance][Performance]

## User Flow blade

This blade won't show you any performance problem, but will definitly help you to identify where is your traffic.  Knowing the journey of your user will help you the first make it optimal, and see were your effort will have the biggest impact, but also will help you to know the context. Seeing the flow will help to understand what the user come from and his context.

Take some time to read sme flow. Do you recognize the things you did previously? You can also click on some Step to get more details.

![UserFlow][UserFlow]

# How much data do you need?

The application used in this demo is pretty simle and small. However, in a reel situation collect "all" the data like that will become a problem. First you will probably hit your quota very quickly and even though your user won't suffer from it, you may miss for information because Application Insights had stop collecting data. Of course, you could decide to go for a bigger plan, and it's certainly worth it. 

I smart way to get the maximum of your plan is by sampling your data. By selecting a fraction of data received from your app to Application Insights service is called Data sampling.

![sampling][sampling]

Let's change the current data sampling to select the amount of sampling at 12.5%. From the Application Insights blade, select the **Usage and estimation cost** option (1). Then on the click  **Data sampling**. Now change it to 12.5%. 

This option can be changed at anytime. So you can bring it back to 100% and trying to understand a bug in production.

## Keep the data



### Reference

* [Application Insights](https://azure.microsoft.com/en-us/services/application-insights/)
* [Application Insights Documentation](https://docs.microsoft.com/en-us/azure/application-insights/)
* [Interactive data analytics demo](https://analytics.applicationinsights.io/demo)


# End


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