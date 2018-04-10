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

# Reference

# Let's code!
## Addendum

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

