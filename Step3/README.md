![gablogo][gablogo]
# Goal
Learn how to use Application Insight to find performance problem in a running application.

# Let's code!

## Set the context

Some thing it help when we get started to know what we are looking for. In this first part of the Lab we will create an Azure Function that will call our website every 15 secondes.  

Once the function is in place we will also create some traffic on the site by clicking around. One methode has a `wait` in it and will be very slow... let see if Application Insight will help us find ing it. 


## Create an Azure Function

First, let's go in the Function App. Navigate to the Azure Portal ((portal.azure.com)[https://portal.azure.com]) an select the `ResourceGroup` gab2018-dev. Then select the Function App starting by `gab2018-dev-func-app-  `.

![CreateAzureFunction][CreateAzureFunction]

To Create a new Azure Function click the "+" sign on the right of Functions. 


Use this code


```csharp
using System;


public static async void Run(TimerInfo myTimer, TraceWriter log)
{
    log.Info($"C# Timer trigger function executed at: {DateTime.Now}");

    using(var client = new HttpClient())
    {
        client.BaseAddress = new Uri("https://gab2018-dev-web-app-rolawncs63psm.azurewebsites.net/home/DoSomethingLong");
        var result = await client.GetAsync("");
        string resultContent = await result.Content.ReadAsStringAsync();
        log.Info(resultContent);
    }
}

```


Then Set the Cron Setting

![timer][timer]

## Just play a little

Navigate to the web application and navigate throut all pages. Try a few time the Test button on the Home page.



## Addendum

# Reference

* [Application Insights](https://azure.microsoft.com/en-us/services/application-insights/)
* [Application Insights Documentation](https://docs.microsoft.com/en-us/azure/application-insights/)
* [Interactive data analytics demo](https://analytics.applicationinsights.io/demo)
# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[CreateAzureFunction]: media/CreateAzureFunction.png "Create Azure Function"
[timer]: media/timer.png "Cron Setting"

