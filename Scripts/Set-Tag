$tag = @{"FileServerNTFSAudit"="Enabled"}

$machineName = "SQL01"
$machine = Get-AzResource -ResourceType "Microsoft.HybridCompute/machines" -ResourceGroupName $resourceGroupName -Name $machineName
Update-AzTag -ResourceId  $machine.ResourceId -Tag $tag -Operation Merge