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

![ApplicationMap][ApplicationMap]

## Live Metrics Stream blade

![LiveStream][LiveStream]

## Failures blade

![Failures][Failures]

## Performance blade

![Performance][Performance]

## User Flow blade

![UserFlow][UserFlow]

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