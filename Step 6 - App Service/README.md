![gablogo][gablogo]
# Goal
Some bugs will only appear when the application is deployed in Azure like a typo in a connection string.  How do you troubleshoot and fix these issues?  In this section, you'll attach the Visual Studio 2017 bebugger to the process running in Azure.  It is VERY IMPORTANT that you insist that this should not be done on apps in production since it will block the execution thread.

You'll use the Kudu tools and Monaco to edit files directly in production.  Let's say you're visiting uncle Bob, it's 11PM, the site is down and you don't have your laptop.  What do you do to fix the issue?  Again, it is VERY IMPORTANT that you state that this is against best practices since the changes made outside of the normal source control and deployment process.

# Reference
How to configure remote debugging for Web Apps & Visual Studio 2017
https://www.youtube.com/watch?v=2-Dt8521Ixk

# Let's code!
## Debugging in Azure
We have an issue with a page when it's running in Azure!

Navigate to the [insert page name] page and explain that this error only happens when the app is deployed in Azure.  
[insert screenshot]

One way to get the information we need is run the app in debug mode in Visual Studio but how do do you attach the debugger to a live app running in Azure?

### Step 1 - Enable remote debugging
Navigate to the Azure portal.  In the App Service Settings section of our Web App, click on Application Settings.  Scroll to the Debugging section and turn remote debugging ON and select the Visual Studio version
[insert screenshot]

### Step 2 - Configure Web.config and place a breakpoint
In Visual Studio, open the Web.config file and validate that the debug attribute of the compilation setting is set to true.
[insert screenshot]

Open the [page name] page and place a breakpoint on this line:
[insert screenshot]

### Step 3 - Configure Visual Studio
Open the Tools/Options dialog and select the Debugging/General section.  Uncheck the Enable Just My Code setting.
[insert screenshot]

### Step 4 - Publish in debug mode
The app was previously published in release mode.  We need to change this to Debug.  In Solution Explorer, right-click on the project name and select Publish.  Click on Setting and in the Publish dialog, click Settings.  Change the Configuration to Debug and the Save button
[insert screenshot]

### Step 5 - Publish, attach the debugger and debug
Click Publish.  Visual Studio will launch the application browser but the debugger is not attached yet.  Open the Server Explorer window, select the App Service, right-clik on the Web App and select Attach Debugger.
[insert screenshot]

Explain that if they have the Cloud Explorer installed, they can do the same thing from that window.  Visual Studio will launch a browser and run the app with the debugger attached.  Navigate to the page and the breakpoint will be hit.

### Step 6 - Demonstrate the issue with this technique
Hitting a breakpoint will stop the execution thread in Azure.  Demonstrate that by opening the same page in a new browser tab.  Execution has stopped on both page.  INSIST ON TELLING THE AUDIENCE THAT THEY SHOULD ONLY DO THIS ON NON PRODUCTION APPS!!!


Take the time to watch this video that explains the whole process:

<a href="http://www.youtube.com/watch?feature=player_embedded&v=2-Dt8521Ixk" target="_blank"><img src="http://img.youtube.com/vi/2-Dt8521Ixk/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>


## The Kudu tools

## The Monaco editor

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

