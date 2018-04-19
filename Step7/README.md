![gablogo][gablogo]
# Application Insights Exception Snapshot
## Goal
Debugging in production app with exception snapshot

## Steps
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

8. On the POST Queue/CreateMessage operation you will want to look for an exception of type InvalidOperationException (applying filters will help if too much info is displayed) and then click on the Take Action button ![failureblade][failureblade]

9. From that list you will want to find an exception with the snapshot available icon (sort by date can help, if too many exceptions are shown)![takeaction][takeaction]

10. By clicking on snapshot available icon you will then have acces to an end-to-end transaction details view, select the exception and the Open debug snapshot will now be available  ![endtoend][endtoend]

11. By navigating to the snapshot you may need to, depending on your role within the subscription, [grant authorization](https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions)

12. Once the snapshot has been authorized, analyzed and displayed you will be able to navigate in the call stack on see the captured values from each call stack, notice in the last image that both the variable in the method as well as the method params were captured

![callstack1][callstack1]

![callstack2][callstack2]

![callstack3][callstack3]

![callstack4][callstack4]

**Snapshots can potentially contain personal and other sensitive information in variable and parameter values.**

13. (Optional)**VS2017 Entreprise Only**: You could download the diagnostic session to view in the context of VisualStudio and your application code (big file to download) ![download][download]

## end

# Application Insights Performance
## Goal
Profile a production application

## Steps
1. Go to the Performance Blade in Application Insights and click the Enable Profiler button ![enableprofiler][enableprofiler]

2. Link the app that needs to be profiled ![linkapp][linkapp]

3. Install the profiler extension if you get the message "Not install click to install" by clicking on "..." link ![profilerextension][profilerextension]

4. When prompted "Installing will restart the App" click OK

**In order to have profiling information you may need to Run a performance test on your app**

5. Go to your webapp and select Performance Test, create a new one and make it run for 10 minutes(5 should be enough, but just to be safe go for 10)

6. Go back to the performance view in Application Insights and after a few minutes and some refresh (a break maybe) the Profiler Trace button will show ![profilertrace][profilertrace], click it

7. You will then be presented with some profiling examples and some performance tips. The graph also displays Hot Path if needed or applicable ![hotpath][hotpath]

##end

# Visual Studio 2017 Snapshot Debugger (Optional Lab)
## Goal
Debug a live application without being blocking in production

## Steps
1. Ensure that you have the proper tooling installed in VS2017 => run Visual Studio installer

2. Choose to modify VS2017 (dropdown menu)

3. Ensure that Azure development -> Snapshot debugger is installed otherwise install it

4. Complete the installation (may require a restart of VS or computer)

5. Open project in Visual Studio 2017 and in the Cloud Explorer (View > Cloud Explorer), right-click the Azure App Service your project is deployed to and select Attach Snapshot Debugger.![attach](https://docs.microsoft.com/en-ca/visualstudio/debugger/media/snapshot-launch.png) 

_The first time you select Attach Snapshot Debugger, you're prompted to install the Snapshot Debugger site extension on your Azure App Service. This installation requires a restart of your Azure App Service._

6. Set a snappoint bu clicking in the left gutter by the line of code you are interested in. ![snappoint](https://docs.microsoft.com/en-ca/visualstudio/debugger/media/snapshot-set-snappoint.png)

7. Click Start Collection to turn on collection ![collection](https://docs.microsoft.com/en-ca/visualstudio/debugger/media/snapshot-start-collection.png)

_You can't step when viewing a snapshot, but you can place multiple snappoints in your code to follow execution at different lines of code. If you have multiple snappoints in your code, the Snapshot Debugger makes sure that the corresponding snapshots are from the same end-user session. The Snapshot Debugger does this even if there are many users hitting your app._

8. When the snappoint is hit, a snapshot appears in the Diagnostic Tools window. To open this window, choose Debug / Windows / Show Diagnostic Tools.

9. Double-click the snappoint to open the snapshot in the code editor.

## end

# Reference
Exception Snapshot:  https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger

Snapshot Authorization: https://docs.microsoft.com/en-us/azure/application-insights/app-insights-snapshot-debugger#grant-permissions

Application Profiling
https://docs.microsoft.com/en-us/azure/application-insights/app-insights-profiler

Performance Test
https://docs.microsoft.com/en-us/vsts/load-test/app-service-web-app-performance-test

Snapshot Debugger:
https://docs.microsoft.com/en-ca/visualstudio/debugger/debug-live-azure-applications

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"
[snapshotdebugging]: https://docs.microsoft.com/en-us/azure/application-insights/media/app-insights-snapshot-debugger/snapshot-on-exception.png

[failureblade]: media/failureBlade.PNG
[takeaction]: media/takeAction.PNG
[endtoend]: media/endtoend.PNG
[callstack1]: media/callstack1.PNG
[callstack2]: media/callstack2.PNG
[callstack3]: media/callstack3.PNG
[callstack4]: media/callstack4.PNG
[download]: media/download.PNG
[enableprofiler]: media/enableProfiler.PNG
[linkapp]: media/linkapp.PNG
[profilerextension]: media/installprofilerextension.PNG
[profilertrace]: media/profilertrace.PNG
[hotpath]: media/hotpath.PNG