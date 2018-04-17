![gablogo][gablogo]


# Step goals

Azure Security Center monitors the security of machines, networks, storage and data services. At present it is doing a continuous assessment of the artifacts that we have added previously. It will aid in in discovering actionable recommendations for our Virtual Machine which we have procured. Virtual Machines in the cloud can be used to develop, host, run custom software. They however need to be secured and oversight via Azure Security Center is just the thing!

In order to secure the Virtual Machine, we will use Azure Security to oversee a few security related elements:

* Manage endpoint protection issues with Azure Security Center
* Secure the Virtual Machine with Network Storage Groups (NSG)
* Enable JIT for remote desktop 


# Let's configure!

# Lab 1 - Manage endpoint protection issues with Azure Security Center

## Step 1 - Oversee the recommendation
Azure Security Center monitors the status of antimalware protection and reports this under the Endpoint protection issues blade. Security Center highlights issues, such as detected threats and insufficient protection, which can make your virtual machines (VMs) and computers vulnerable to antimalware threats. 

Security Center reports the following endpoint protection issues:

* Endpoint protection not installed on Azure VMs – A supported antimalware solution is not installed on these Azure VMs.

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

When complete, return to the Azure Security Center under Compute and the Recommendation is no longer present.

![alt text](media/ASC%20Lab%201_9.png)

This lab showed you how to implement the Security Center recommendation "Install Endpoint Protection." To learn more about enabling Microsoft Antimalware in Azure, see the following links:

* [Manage endpoint protection issues with Azure Security Center](https://docs.microsoft.com/en-us/azure/security-center/security-center-install-endpoint-protection)  
* [Microsoft Antimalware for Azure Cloud Services and Virtual Machines](https://docs.microsoft.com/en-us/azure/security/azure-security-antimalware)  


# Lab 2 - Enable Network Security Groups in Azure Security Center

Azure Security Center recommends that you enable a network security group (NSG) if one is not already enabled. NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your VM instances in a Virtual Network. NSGs can be associated with either subnets or individual VM instances within that subnet. When an NSG is associated with a subnet, the ACL rules apply to all the VM instances in that subnet. In addition, traffic to an individual VM can be restricted further by associating an NSG directly to that VM. 

## Step 1 - Oversee the recommendation

 Open the **Security Center** dashboard.

Select **Networking.** from the recommendations pane.

![alt text](media/ASC%20Lab%203_1.png)

Oversee the Networking related recommendations and notive that there is a recommendation for NSGs on both the subnet and the VM. We will be adding the NSGs to the subnet. 

Click on **NSGs on subnets not enabled**

![alt text](media/ASC%20Lab%203_2.png)

This will open the Configure Missing Network Security groups for Subnets Pane.

Select Lan **Lan** Virtual Network.

![alt text](media/ASC%20Lab%203_3.png)

select **gab2018-dev-nsg-lan-YOURKEY** as the NSG to utilize

![alt text](media/ASC%20Lab%203_4.png)

Lastly the notification will shows itself and  **Creating NSG Resource.**

![alt text](media/ASC%20Lab%203_5.png)

Once complete we can go back to the recommendations pane and after some time the issue will be shown as resolved.


# Lab 3 -Enable JIT (Just in Time) for remote desktop 

Just in time virtual machine (VM) access can be used to lock down inbound traffic to your Azure VMs, reducing exposure to attacks while providing easy access to connect to VMs when needed.

## Step 1 - Manage virtual machine access using just in time


 Open the **Security Center** dashboard.

In the left pane, select **Just in time VM access.**

![alt text](media/ASC%20Lab%202_1.png)

The **Just in time VM access** blade will open.

![alt text](media/ASC%20Lab%202_2.png)

Click the Try Just in time VM Access.

![alt text](media/ASC%20Lab%202_3.png)

This step may have already previously been completed of you have the Standard plan already. However if you do not we will Applu Standard plan which is free for 60 days. Select the appropriate Name of the Subscription where your VM is located.

![alt text](media/ASC%20Lab%202_4.png)

Azure will commence the procurement. The progress can be monitored in the Notifications area Top-Right in Azure Portal.

Once complete.



To select the VMs that you want to enable:

1. Under **Just in time VM access** , select the **Recommended** tab.
![alt text](media/ASC%20Lab%202_5.png)
2. Under **VIRTUAL MACHINE**, select the VMs that you want to enable. This puts a checkmark next to a VM.
3. Select **Enable JIT on VMs.**
4. Select**Save.**



You can see the default ports that Security Center recommends enabling just in time.

1. Under Just in time VM access, select the Recommended tab.

![alt text](media/ASC%20Lab%202_6.png)

![alt text](media/ASC%20Lab%202_6b.png)
2. Under VMs, select a VM. This puts a checkmark next to the VM and opens JIT VM access configuration. This blade displays the default ports.



Requesting access to a VM
To request access to a VM:

1.Under Just in time VM access, select the Configured tab.
2.Under VMs, select the VMs that you want to enable access. This puts a checkmark next to a VM.
3.Select Request access. This opens Request access.
![alt text](media/ASC%20Lab%202_7.png)

![alt text](media/ASC%20Lab%202_8.png)

4.Under Request access, you configure for each VM the ports to open along with the source IP that the port is opened to and the time window for which the port is opened. You can request access only to the ports that are configured in the just in time policy. Each port has a maximum allowed time derived from the just in time policy.

5.Select Open ports.


![alt text](media/ASC%20Lab%202_9.png)

![alt text](media/ASC%20Lab%202_10.png)

![alt text](media/ASC%20Lab%202_11.png)

![alt text](media/ASC%20Lab%202_12.png)

# Resources

To learn more about Security Center, see the following:

Setting security policies — Learn how to configure security policies for your Azure subscriptions and resource groups.
Managing security recommendations — Learn how recommendations help you protect your Azure resources.
Security health monitoring — Learn how to monitor the health of your Azure resources.
Managing and responding to security alerts — Learn how to manage and respond to security alerts.
Monitoring partner solutions — Learn how to monitor the health status of your partner solutions.
Security Center FAQ — Find frequently asked questions about using the service.
Azure Security blog — Find blog posts about Azure security and compliance.

# End


[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"

