![gablogo][gablogo]
# Goal
Debugging in production app with exception snapshot

1. Enable Application Insights in your web app, if you haven't done it yet (already done). 

2. Include the Microsoft.ApplicationInsights.SnapshotCollector NuGet package in your app.

3. Review the default options that the package added to ApplicationInsights.config:
```
<TelemetryProcessors>
    ...
    <Add Type="Microsoft.ApplicationInsights.SnapshotCollector.SnapshotCollectorTelemetryProcessor, Microsoft.ApplicationInsights.SnapshotCollector">
      <!-- The default is true, but you can disable Snapshot Debugging by setting it to false -->
      <IsEnabled>true</IsEnabled>
      <!-- Snapshot Debugging is usually disabled in developer mode, but you can enable it by setting this to true. -->
      <!-- DeveloperMode is a property on the active TelemetryChannel. -->
      <IsEnabledInDeveloperMode>false</IsEnabledInDeveloperMode>
      <!-- How many times we need to see an exception before we ask for snapshots. -->
      <ThresholdForSnapshotting>1</ThresholdForSnapshotting>
      <!-- The maximum number of snapshots we collect for a single problem. -->
      <MaximumSnapshotsRequired>3</MaximumSnapshotsRequired>
      <!-- The maximum number of problems that we can be tracking at any time. -->
      <MaximumCollectionPlanSize>50</MaximumCollectionPlanSize>
      <!-- How often to reset problem counters. -->
      <ProblemCounterResetInterval>24:00:00</ProblemCounterResetInterval>
      <!-- The maximum number of snapshots allowed per day. -->
      <SnapshotsPerDayLimit>30</SnapshotsPerDayLimit>
      <!--Whether or not to collect snapshot in low IO priority thread.-->
      <SnapshotInLowPriorityThread>true</SnapshotInLowPriorityThread>
    </Add>
  </TelemetryProcessors>
```
4. Publish the new version of your app

5. By using the already existing exception from the QueueController we will now generate an exception snapshot

6. Go to http://[your_app].azurewebsites.net/Queue/CreateMessage  enter some value in the textbox and click create. Since the exception snapshot is sometime a bit flacky you will want to generate about 5-6 exceptions.

7. From the Failure blade in ApplicationInsight you will eventually see your generated exceptions, it can take up to 5 minutes to see the exceptions

8. On the POST Queue/CreateMessage operation you will want to look for an exception of type InvalidOperationException (applying filters will help if too much info is displayed) and then click on the Take Action button![failureblade]

9. From that list you will want to find an exception with the snapshot available icon (sort by date can help, if too many exceptions are shown)![takeaction]

10. By clicking on snapshot available icon you will then have acces to an end-to-end transaction details view, select the exception and the Open debug snapshot will now be available  ![endtoend]

11. By navigating to the snapshot you may need to, depending on your role within the subscription, [grant authorization](https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions)

12. Once the snapshot has been authorized, analyzed and displayed you will be able to navigate in the call stack on see the captured values from each call stack, notice in the last image that both the variable in the method as well as the method params were captured![callstack1]![callstack2]![callstack3]![callstack4]

**Snapshots can potentially contain personal and other sensitive information in variable and parameter values.**

13. (Optional)**VS2017 Entreprise Only**: You could download the diagnostic session to view in the context of VisualStudio and your application code (big file to download) ![download]
# Reference
Exception Snapshot:  https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger

Snapshot Debugger:
https://docs.microsoft.com/en-ca/visualstudio/debugger/debug-live-azure-applications

Snapshot Authorization: https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions

# Application Profiling

# Optional Lab
Snapshot debugger in live apps


# Let's code!
## Addendum

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[snapshotdebugging]: https://docs.microsoft.com/en-us/azure/application-insights/media/app-insights-snapshot-debugger/snapshot-on-exception.png

[failureblade]: media/failureBlade.png
[takeaction]: media/takeaction.png
[endtoend]: media/endtoend.png
[callstack1]: media/callstack1.png
[callstack2]: media/callstack2.png
[callstack3]: media/callstack3.png
[callstack4]: media/callstack4.png
[download]:media/download.png