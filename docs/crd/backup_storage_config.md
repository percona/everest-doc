# Configure backup storage

Before configuring backups, you must set up a backup storage location.
{.power-number} 


1. Create a Kubernetes secret using your cloud storage credentials.

    ```sh
    apiVersion: v1
    data:
        AWS_ACCESS_KEY_ID: YOUR_ACCESS_KEY_ID_BASE64_ENCODED
        AWS_SECRET_ACCESS_KEY: YOUR_SECRET_ACCESS_KEY_BASE64_ENCODED
    kind: Secret
    metadata:
        name: my-s3-backup-storage
    type: Opaque
    ```

2. Create a `BackupStorage` CRD that references this secret.

    ```sh
    apiVersion: everest.percona.com/v1alpha1
    kind: BackupStorage
    metadata:
        name: my-s3-backup-storage
    spec:
        bucket: my-s3-bucket
        credentialsSecretName: my-s3-backup-storage
        description: My S3 backup storage
        endpointURL: https://my-s3-endpoint.com
        forcePathStyle: false
        region: us-west-2
        type: s3
        verifyTLS: true
    ```

3. Configure backup schedules in your `DatabaseCluster`.

    ```sh
    spec:
    backup:
        schedules:
        - name: "daily-backup"
            enabled: true
            schedule: "0 0 * * *"  # Daily at midnight
            retentionCopies: 7
            backupStorageName: "my-s3-backup-storage"
        pitr:  # Point-in-Time Recovery
        enabled: true
        backupStorageName: "my-s3-backup-storage"
        uploadIntervalSec: 300  # 5 minutes
    ```

## Manual backups and restores

In addition to scheduled backups, you can create manual backups and perform restores using the `DatabaseClusterBackup` and `DatabaseClusterRestore` CRDs.


### Create a manual backup

Define a `DatabaseClusterBackup` object:


```sh
apiVersion: everest.percona.com/v1alpha1
kind: DatabaseClusterBackup
metadata:
  labels:
    clusterName: my-database-cluster
  name: my-database-cluster-backup
spec:
  backupStorageName: my-s3-backup-storage
  dbClusterName: my-database-cluster
```

Monitor the backup status:

```sh
kubectl get dbbackup manual-backup-2024-04-11 -o jsonpath='{.status}'
```

A backup typically progresses through these states:

- **Starting**: Initial backup preparation

- **Running**: Backup in progress

- **Succeeded**: Backup completed successfully

- **Failed**: Backup failed





