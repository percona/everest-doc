# Troubleshooting database cluster issues

If your database cluster isn’t behaving as expected, start with these checks:
{.power-number}


1. Check cluster status.

    ```
    kubectl describe databasecluster <cluster-name> -n <your namespace>
    ```

2. Check the operator logs.

    ```
    kubectl logs -n <operator-namespace> deployment/everest-operator-controller-manager
    ```

The table below summarizes **frequent issues**, their **possible causes**, and **how to resolve them**. 

| Issue                          | Possible Cause                                   | How to Check / Fix                                                                 | Resolution                                                                 |
|--------------------------------|--------------------------------------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Cluster stuck in creating or initializing | Insufficient CPU, memory, or nodes available | - Inspect pod events:<br>`kubectl describe pod <pod-name> -n <namespace>`<br>`kubectl describe pod -l app.kubernetes.io/instance=<db-cluster-name> -n <namespace>`<br><br>- Check node resource allocation:<br>`kubectl describe nodes | grep -A5 "Allocated resources"`<br><br>- Monitor live usage:<br>`kubectl top nodes`<br>`kubectl top pods -A` | Add more nodes, increase resource limits/quotas, or free up resources by scaling down less critical workloads. |
| Cluster in error state          | Misconfigured storage class or insufficient resources | - Check available storage classes:<br>`kubectl get storageclass`<br><br>- Inspect pod events:<br>`kubectl describe pod <pod-name> -n <namespace>`<br>`kubectl describe pod -l app.kubernetes.io/instance=<db-cluster-name> -n <namespace>`<br><br>- Check node resource allocation:<br>`kubectl describe nodes` | Update the storage class in the cluster spec or request more resources. |
| Backup or restore fails         | Invalid `backupStorageName` or missing/incorrect S3 credentials | - Inspect backup:<br>`kubectl describe dbbackup <backup-name> -n <namespace>`<br>- Verify secrets:<br>`kubectl get secrets -n <namespace>` | Fix the BackupStorage configuration and update S3 credentials secret. |
| Monitoring not working          | Missing or invalid PMM credentials               | - Check monitoring config:<br>`kubectl get monitoringconfig -n <namespace>`<br>`kubectl describe monitoringconfig <name> -n <namespace>` | Recreate the PMM secret with valid base64-encoded credentials. |
| Proxy not starting              | Wrong proxy type or insufficient resources       | - Check proxy pod status:<br>`kubectl get pods -n <namespace>`<br>`kubectl describe pod <proxy-pod> -n <namespace>` | Correct the proxy type in spec and/or increase CPU/memory requests. |
