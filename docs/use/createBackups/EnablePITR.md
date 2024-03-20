# Point-in-time recovery (PITR) backups

PITR maintains versions of your database from past timestamps, serving as a safeguard against data loss during various disasters, including database crashes, accidental data deletions, table drops, or unintended updates to multiple fields instead of a single one.

PITR complements on-demand and scheduled backup strategies by providing finer backup granularity with more specific recovery points for restoring data to the same cluster.

## Supported scenarios

Currently, PITR is only available for restoring MySQL and MongoDB databases to the same cluster. Future releases will cover PITR support for PostgreSQL databases and PITR restores to different clusters.

## How it works

Restoring databases up to a specific moment in time involves retrieving data from a backup snapshot and replaying all subsequent events that occurred until a specified moment using log slices.

When PITR and backups are enabled (either on-demand or scheduled), Percona Everest starts capturing successive database logs at predefined intervals. As soon as the initial full backup is available, Everest can start restoring the database from these PITR logs.

Since Everest saves logs and streams them into your storage between scheduled task runs, scheduling frequent backups is not necessary. You can use the available logs in your storage to restore a backup to any moment between snapshots.

## PITR upload intervals

By default, Everest uploads PITR logs every minute for MySQL databases and every ten minutes for MongoDB databases. If you wish to adjust these default intervals, you can easily do so through the Everest API.

## Enable Point-in-time recovery

### Prerequisites

Before enabling PITR, go to <i class="uil uil-cog"></i> **Settings > Backup Storages** and check that you have an available S3-compatible location for storing backups. Otherwise, [create a backup location](../CreateStorage.md) so Everest can store PITR artifacts for the database.

To enable PITR:
{.power-number}

=== "When creating a new database"


    1. On the Everest homepage, click **Create Database** to display the database creation wizard.
    2. Fill in the details of your database on the first steps of the wizard.
    3. Navigate to the **Backups** page, and make sure to enable and configure a backup schedule. 
    4. Click **Next** to go to the **Point-in-time recovery (PITR)** page where you can enable PITR and specify a location for storing the PITR backups and logs. 
    5. Complete the setup wizard to create the new database with PITR enabled. 

=== "When editing an existing database"


    1. In the <i class="uil uil-database"></i> **Databases** view, select the database for which you want to enable PITR.
    2. Click the <i class="uil uil-ellipsis-h"></i> Actions menu next to the database, then click **Edit**.
    3. Navigate through the database configuration wizard to get to the **Backups** page where you can configure a backup schedule that will create an initial full backup required for PITR.
    4. Complete the setup wizard to schedule a full backup and enable PITR for the existing database.


## Limitation

When performing point-in-time recovery (PITR) for PostgreSQL, it is important to consider the following limitation:

You may encounter issues with point-in-time recovery (PITR) when attempting to recover the database after the last transaction. PITR can get stuck in the **Restoring** state.


**Check the timestamp of the last transaction**

Connect to your database and run the following command. It contains the `gtid`, the `timestamp` and the status of the last transaction.

`select pg_last_committed_xact();`

??? example "Expected output"
    ```
    (768,“2024-03-13 15:52:25.122746+00”,0);
    ```
                
!!! warning 
    You can only recover data for the dates prior to this specific date.


**Workaround**

You can follow these steps if your database cluster is stuck in the **Restoring** state:
{.power-number}


1. Check if your database cluster has been stuck because you have used a date after the last transaction:

    a. Find the recovery pod:

        
	    kubectl get pod -n <your-namespace>
        		
    
    The format of the recovery pod is `<cluster_name>-pgbackrest-restore-<XYZ>`. The status of the recovery pod should be **Running**.

    b. Check the logs for the recovery pod:
       
        kubectl logs <restore_pod_name> -n your-namespace

    ??? example "Example"
        ```        
        kubectl logs postgresql-kbi-pgbackrest-restore-8b95v` -n <your-namespace>
        ```

    Check whether the log contains the following:
        
        FATAL: recovery ended before configured recovery target was reached
        
    In this case, the cluster is stuck during restoration because you used a date that was after the last transaction.

2. Start an interactive bash shell inside the recovery pod:

    ```
	kubectl -n your-namespace exec <restore_pod_name> -it -- bash
	```

    ??? example "Example"
        ```        
	    kubectl -n your-namespace exec postgresql-kbi-pgbackrest-restore-8b95v -it -- bash
        ```

    Delete the `recovery.signal `file:

    ```sh
	rm pgdata/pg16/recovery.signal
    ```

    After a certain period, the recovery pod will self-destruct. The database cluster status will change from **Restoring** to **Initializing** and eventually to **Up**.


## Next step

[Restore backups :material-arrow-right:](../RestoreBackup.md){.md-button}