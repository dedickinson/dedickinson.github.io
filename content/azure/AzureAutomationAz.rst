Az PowerShell in Automation
###########################

:date: 2019-03-02
:tags: azure, powershell
:slug: azure-automation-az
:summary: Using the Az modules in Azure Automation

Runbooks in Azure Automation Accounts primarily use the older `AzureRM` PowerShell 
module. However, you can start using the newer `Az PowerShell module <https://docs.microsoft.com/en-us/powershell/module/?view=azps-1.4.0>`_. 

The process is essentially:

#. Create an automation account
#. Install the ``Az.Accounts`` module
#. Create an ``Azure Run As Account``
#. Prepare a small Runbook to test the setup

Get started by preparing a resource group and automation account::

    New-AzResourceGroup -Name "demo_automation" -Location "East US"

    New-AzAutomationAccount -Name "AzDemoAutomationAccount" -Location "East US" -ResourceGroupName "demo_automation"

Install the `Az.Accounts module <https://www.powershellgallery.com/packages/Az.Accounts/1.3.0>`_::

    New-AzAutomationModule -AutomationAccountName "AzDemoAutomationAccount" -Name "Az.Accounts" -ContentLink "https://www.powershellgallery.com/api/v2/package/Az.Accounts/1.3.0" -ResourceGroupName "demo_automation"

Note: *You can also install the Az.Accounts module via the Modules gallery in the automation account settings.*

Now create the Runbook::

    New-AzAutomationRunbook -AutomationAccountName "AzDemoAutomationAccount" -Name "AzAccountTest" -ResourceGroupName "demo_automation" -Type "PowerShell"

At this stage you can head to the Azure Portal and go to the automation account you just created.
Under ``Account Settings -> Run as accounts``, create the ``Azure Run As Account``.

Finally, add the following code to the Runbook::

    $connection = Get-AutomationConnection -Name AzureRunAsConnection

    Connect-AzAccount -ServicePrincipal `
                    -Tenant $connection.TenantId `
                    -ApplicationID $connection.ApplicationId `
                    -CertificateThumbprint $connection.CertificateThumbprint

    Get-AzContext

You can now test the Runbook and should see the output of ``Get-AzContext``.

At this point you can add further ``Az.*`` modules as required.
Just be aware that you shouldn't (can't) mix ``Az`` and ``AzureRM``
calls in the same script.

See also: `Az module support in Azure Automation <https://docs.microsoft.com/en-us/azure/automation/az-modules>`_