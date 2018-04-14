![gablogo][gablogo]
# Apply Governance to your Azure Subscription

Customers adopting Microsoft Azure need to take into consideration the opportunities and risks associated with this new cloud computing model. Azure Policy can help you with this new shift in cloud computing by providing policies that can enforce different rules and actions over your resources.

Understanding key challenges and considerations over those resources can help you stay compliant with your internal standards and service level agreements.

## Role Based Access Control (RBAC)
ARM provides role-based access control, integrating with the Azure Active Directory directory associated with your subscription.  This allows you to limit access to resource groups or resources to specific users or groups.

You can create a custom role in Azure Role-Based Access Control (RBAC) if none of the built-in roles meet your specific access needs. Custom roles can be created using Azure PowerShell, Azure Command-Line Interface (CLI), and the REST API. Just like built-in roles, you can assign custom roles to users, groups, and applications at subscription, resource group, and resource scopes. Custom roles are stored in an Azure AD tenant and can be shared across subscriptions.

![RBAC][RBAC]

## Resource Tags
Resource tags to your Azure resources to logically organize them by categories.Each tag consists of a name and a value. For example, you can apply the name "Environment" and the value "Production" to all the resources in production.

**Tags and billing**
You can use tags to group your billing data. For example, if you are running multiple VMs for different teams, use the tags to group usage by cost center. You can also use tags to categorize costs by runtime environment, such as the billing usage for VMs running in the production environment.

The following limitations apply to tags:
- Subscription-wide
- Each resource can have up to 15 tags
- Name <=512 | Value <=256
- No inheritance


## Azure Policies

Policy definitions used by Azure Policy enables you to enforce a desirable state of newly created services or to audit the current infrastructure. Policy definition is expressed in JSON format and divided into five elements: mode, parameters, display name, description and policy rule.

**Mode**

The mode determines which resource types will be evaluated for a policy. The supported modes are:
- all: evaluate resource groups and all resource types
- indexed: only evaluate resource types that support tags and location

**Display name and description**

You can use displayName and description to identify the policy definition and provide context for when it is used.

**Policy Rule**

The policy rule consists of If and Then blocks. In the If block, you define one or more conditions that specify when the policy is enforced. You can apply logical operators to these conditions to precisely define the scenario for a policy.

![policyRule][policyRule]

Once the If and Then block has been defined you can then determine what the Effect will be of this policy.

The policy supports the following types of effect:
- Deny: generates an event in the audit log and fails the request
- Audit: generates a warning event in audit log but does not fail the request
- Append: adds the defined set of fields to the request
- AuditIfNotExists: enables auditing if a resource does not exist
- DeployIfNotExists: deploys a resource if it does not already exist.

![policyRuleEffect][policyRuleEffect]

During this session will learn how to create, apply and modify Azure policies to your subscription.

![AzurePolicy][AzurePolicy]

# Let's code!

In the following labs we will perform the following:
 1. Apply the policy to your subscription to only allow resources to be created in a specific region.
 2. Enable chargeback across departments / Teams by enforcing tags on resources.

### LAB 1: Allow resources only in Canada Central / Canada East

**Create the Policy Definition for the Azure Canada Datacentre Regions**

```powershell
New-AzureRmPolicyDefinition -Name permittedLocationsCA -Description "This policy configures restrictions to only allow resource deployment in the Canadian Azure Regions." -Policy "https://raw.githubusercontent.com/erleonard/AzurePolicy/master/permittedLocationsCA.json"
```
**Verify**
![policyAssignment][policyAssignment]

**Apply the policy definition to an entire subscription**
```powershell
$policy = Get-AzureRmPolicyDefinition -Name permittedLocationsCA

$sub = Get-AzureRmSubscription -SubscriptionName "Your Subscription Name"

New-AzureRmPolicyAssignment -Name "Permitted Locations for Canada Only" -PolicyDefinition $policy -Scope "/subscriptions/$sub" –Sku @{Name='A1';Tier='Standard'}
```
### LAB 2: Add default tag automatically

**Create the Policy Definition to apply a default tag and value**

```powershell
New-AzureRmPolicyDefinition -Name applyDefaultTag -Description "This policy configures the required default tag, and its value." -Policy "https://raw.githubusercontent.com/erleonard/AzurePolicy/master/applyDefaultTag.rules.json" -Parameter "https://raw.githubusercontent.com/erleonard/AzurePolicy/master/applyDefaultTag.parameters.json"
```

**Apply the policy definition to an entire subscription**
```powershell
$policy = Get-AzureRmPolicyDefinition -Name applyDefaultTag

$sub = Get-AzureRmSubscription -SubscriptionName "Your Subscription Name"

New-AzureRmPolicyAssignment -Name "Apply default tag and value" -PolicyDefinition $policy -Scope "/subscriptions/$sub"
```

## Addendum

# Reference
* [Azure Policy Introduction](https://docs.microsoft.com/en-us/azure/azure-policy/azure-policy-introduction)
* [Create a policy assignment to identify non-compliant resources in your Azure environment](https://docs.microsoft.com/en-us/azure/azure-policy/assign-policy-definition)
* [Governance in Azure](https://docs.microsoft.com/en-us/azure/security/governance-in-azure)

[RBAC]: ./media/azureRBAC.png "Azure RBAC"
[policyRule]: ./media/policyRule.png "Azure Policy Rule"
[policyRuleEffect]: ./media/policyRuleEffect.png "Azure Policy Rule Effect"
[policyAssignment]: ./media/policyAssignment.png "Azure Policy Assignment"
[AzurePolicy]: ./media/add-policies.png "Azure Policy"
[gablogo]: ../media/logo-2018-500x444.png "Global Azure Bootcamp logo"