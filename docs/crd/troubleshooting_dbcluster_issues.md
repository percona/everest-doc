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
| Cluster stuck in creating or initializing | Missing or invalid secrets for database users (`userSecretsName`) | ```kubectl get secrets -n <namespace>``` | Recreate or update the secret with the correct keys (`username`, `password`, etc.). |
| Cluster in error state          | Misconfigured storage class or insufficient resources | ```kubectl get pvc -n <namespace>```<br>```kubectl describe pvc <pvc-name> -n <namespace>``` | Update the storage class in the cluster spec or request more resources. |
| Backup or restore fails         | Invalid `backupStorageName` or missing S3 credentials | ```kubectl describe dbbackup <backup-name> -n <namespace>```<br>```kubectl get secrets -n <namespace>``` | Fix the BackupStorage configuration and update S3 credentials secret. |
| Monitoring not working          | Missing or invalid PMM credentials               | ```kubectl get monitoringconfig -n <namespace>```<br>```kubectl describe monitoringconfig <name> -n <namespace>``` | Recreate the PMM secret with valid base64-encoded credentials. |
| Proxy not starting              | Wrong proxy type or insufficient resources       | ```kubectl get pods -n <namespace>```<br>```kubectl describe pod <proxy-pod> -n <namespace>``` | Correct the proxy type in spec and/or increase CPU/memory requests. |
| Upgrade stuck in upgrading      | Incompatible engine version                      | ```kubectl describe databasecluster <cluster-name> -n <namespace>``` | Use a supported engine version for in-place upgrades or recreate cluster with the new version. |


 







    










