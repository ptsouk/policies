$subscriptionId = "870108ec-6747-428d-9627-c2f9db260b7f"
$resourceGroupName = "Arc-rg"
$location = "westeurope"
$setting = '{"proxy":{"mode":"application","address":"http://myproxy:80","auth": false}}' | ConvertFrom-Json -AsHashtable
Set-AzContext -SubscriptionId $subscriptionId

# create a loop for all machine names
$machineName = "SQL01"
New-AzConnectedMachineExtension `
    -Name AzureMonitorWindowsAgent `
    -ExtensionType AzureMonitorWindowsAgent `
    -Publisher Microsoft.Azure.Monitor `
    -ResourceGroupName $resourceGroupName `
    -MachineName $machineName `
    -Location $location `
    -EnableAutomaticUpgrade `
    -Setting $setting