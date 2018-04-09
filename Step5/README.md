![gablogo][gablogo]


# Step goals

Azure Security Center monitors the security of machines, networks, storage and data services. At present it is doing a continuous assessment of the artifacts that we have added previously. It will aid in in discovering actionable recommendations for our Virtual Machine which we have procured. Virtual Machines in the cloud can be used to develop, host, run custom software. They however need to be secured and oversight via Azure Security Center is just the thing!

In order to secure the Virtual Machine, we will use Azure Security to oversee a few security related elements:
-Manage endpoint protection issues with Azure Security Center
-Secure the Virtual Machine with Network Storage Groups (NSG)
-Enable JIT for remote desktop 


# Let's configure!

# Lab 1 - Manage endpoint protection issues with Azure Security Center

## Step 1 - Oversee the recommendation
Azure Security Center monitors the status of antimalware protection and reports this under the Endpoint protection issues blade. Security Center highlights issues, such as detected threats and insufficient protection, which can make your virtual machines (VMs) and computers vulnerable to antimalware threats. 
Security Center reports the following endpoint protection issues:
•	Endpoint protection not installed on Azure VMs – A supported antimalware solution is not installed on these Azure VMs.

![alt text](media/ASC%20Lab%201_1.png)


## Step 2 - Implement the recommendation

Endpoint protection issues is presented as a recommendation in Security Center. 
this recommendation will be displayed under Prevention and under Compute.
 

Under Compute, select Endpoint protection issues. The Endpoint protection issues dashboard opens.sdf

 
![alt text](media/ASC%20Lab%201_2.png)
 

Click on Endpoint Protection not installed on Azure VMs.
 
![alt text](media/ASC%20Lab%201_3.png)

Check the box for the VM and click on the Install on 1 VMs icon.

![alt text](media/ASC%20Lab%201_4.png)

Click on the Microsoft Antimalware blade.
 
![alt text](media/ASC%20Lab%201_5.png)

Click on create
 
![alt text](media/ASC%20Lab%201_6.png)

Accept Defaults and click ok
 
![alt text](media/ASC%20Lab%201_7.png)

Installation will begin

![alt text](media/ASC%20Lab%201_8.png)

When omplete return to the azure security center under compute and the recommendation is no longer present.

![alt text](media/ASC%20Lab%201_9.png)

This article showed you how to implement the Security Center recommendation "Install Endpoint Protection." To learn more about enabling Microsoft Antimalware in Azure, see the following document:
•	Microsoft Antimalware for Cloud Services and Virtual Machines -- Learn how to deploy Microsoft Antimalware.

# Lab 2 - Protect the VM

Azure Security Center will recommend that you restrict access through Internet-facing endpoints if any of your Network Security Groups (NSGs) has one or more inbound rules that allow access from “any” source IP address. Opening access to “any” may enable attackers to access your resources. Security Center will recommend that you edit these inbound rules to restrict access to source IP addresses that actually need access.
This recommendation is generated for any non-web port that has "any" as source.

## Step 1 - Oversee the recommendation

# Lab 3 -Enable JIT for remote desktop 

## Step 1 - Oversee the recommendation

![alt text](media/ASC%20Lab%202_1.png)

![alt text](media/ASC%20Lab%202_2.png)

![alt text](media/ASC%20Lab%202_3.png)

![alt text](media/ASC%20Lab%202_4.png)

![alt text](media/ASC%20Lab%202_5.png)

![alt text](media/ASC%20Lab%202_6.png)

![alt text](media/ASC%20Lab%202_6b.png)

![alt text](media/ASC%20Lab%202_7.png)

![alt text](media/ASC%20Lab%202_8.png)

![alt text](media/ASC%20Lab%202_9.png)

![alt text](media/ASC%20Lab%202_10.png)

![alt text](media/ASC%20Lab%202_11.png)

![alt text](media/ASC%20Lab%202_12.png)
# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

