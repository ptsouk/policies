$tag = @{"FileServerNTFSAudit"="Enabled"}
$subscriptionId = "870108ec-6747-428d-9627-c2f9db260b7f"
Set-AzContext -SubscriptionId $subscriptionId
$resourceGroupName = "Arc-rg"

$machineName = "SQL01"
$machine = Get-AzResource -ResourceType "Microsoft.HybridCompute/machines" -ResourceGroupName $resourceGroupName -Name $machineName
Update-AzTag -ResourceId  $machine.ResourceId -Tag $tag -Operation Merge