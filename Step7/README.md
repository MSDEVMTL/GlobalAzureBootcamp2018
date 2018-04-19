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
6. Go to your_app.azurewebsites.net/Queue/CreateMessage  enter some value in the textbox and create. Since the snapshot debugging is sometime a bit flacky you will want to generate about 5-6 exceptions.
7. From the exception blade you will eventually see your generated exceptions with a snapshot logo
8. By navigating to the snapshot you may need to depending on your role within the subscription [grant authorization](https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions)
9. Show that from the call stack it is possible to view values and parameters as well as navigating in the call stack

**Snapshots can potentially contain personal and other sensitive information in variable and parameter values.**

9. VS2017 Entreprise: You could download the diagnostic session to view in the context of VisualStudio and your application code
# Reference
Exception Snapshot:  https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger

Snapshot Debugger:
https://docs.microsoft.com/en-ca/visualstudio/debugger/debug-live-azure-applications

Snapshot Authorization: https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions
# Optional Lab
Snapshot debugger in live apps


# Let's code!
## Addendum

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[snapshotdebugging]: https://docs.microsoft.com/en-us/azure/application-insights/media/app-insights-snapshot-debugger/snapshot-on-exception.png

