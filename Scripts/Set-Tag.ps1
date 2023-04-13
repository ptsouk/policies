$tag = @{"FileServerNTFSAudit"="Enabled"}
$subscriptionId = "870108ec-6747-428d-9627-c2f9db260b7f"
Set-AzContext -SubscriptionId $subscriptionId
$resourceGroupName = "Arc-rg"

try 
{
    $machineNames = Get-Content -Path '.\OMS_Workspace_Servers - NTFS Audit.txt'
    foreach ($machineName in $machineNames) 
    {
        $machine = Get-AzResource -ResourceType "Microsoft.HybridCompute/machines" -ResourceGroupName $resourceGroupName -Name $machineName.split(".")[0] -ErrorAction SilentlyContinue
        if($machine)
        {
            Write-Output "Merging tag on $($machineName.split(".")[0])"
            $null = Update-AzTag -ResourceId  $machine.ResourceId -Tag $tag -Operation Merge -ErrorAction Stop
        }
        else 
        {
            Write-Error "$($machineName.split(".")[0]) Not found!"
        }
    }
}
catch 
{
    Write-Error -Message $_.Exception
    throw $_.Exception
}