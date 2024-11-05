# Known limitations in Percona Everest


This section describes the known limitations associated with Percona Everest:



## Passwords

Refrain from changing the password of administrative users (e.g., root, monitor, or operator) manually in the database. This action may cause inconsistencies with the secrets stored in Kubernetes, which are crucial for the proper functioning of the cluster. Such modifications have the potential to disrupt your cluster.

We are developing a new feature that will allow you to modify these settings directly from the user interface (UI).


## Backups

Let's delve into the limitations of on-demand backups in Percona Everest. 

### PostgreSQL limitations for on-demand backups

- When attempting to delete a PostgreSQL database that contains backups created with Everest versions older than 1.0.0, the database may become stuck in the **Deleting** state. 

    **Workaround**: To prevent this, manually delete any backups created with versions prior to 1.0.0 by using the **Delete** action on the **Backups** page before deleting the database.

- You cannot change the bucket name and region for a specific backup storage. Doing so will make any backups taken for that bucket unusable.

- You can use any of the existing backup storages across on-demand backups and schedules, as long as the total number of storages in use (by existing on-demand backups and schedules) does not exceed three.

    If you have created two schedules using backup storage `bucket-1` and `bucket-2`, and an on-demand backup using backup storage `bucket-3`, you can only utilize one of these three backup storages to create the next on-demand backup or a schedule.

### PSMDB backup failures

There maybe instances when your MongoDB backups may encounter unexpected failures. 

Let's check the reason for these failures by running the following command:

    kubectl get psmdb-backup <BACKUP_NAME> -n <YOUR_NAMESPACE> -o yaml | grep error

Here are some potential errors you could encounter:

- `starting deadline exceeded`
- `'couldn''t get response from all shards: convergeClusterWithTimeout:`

#### Workarounds for PSMDB backup failures

In the following table, we have compiled a list of workarounds to ensure that your backups function properly again.
{.power-number}


|**Workaround**|**Impact on the cluster**|**Action**|**Procedure**|
|----------|-----------|-------------|--------------------|
| **1**|**No downtime**  |Delete the locks |Do the following:</br>{.power-number}</br>**1.** Connect to your MongoDB database. </br></br> **2.** Run the command: `db.getSiblingDB("admin").pbmLock.find()` to see the list of database locks. If the list is empty, the scenario is not applicable. </br></br> **3.** If the list was not empty, run the command`db.pbmLock.deleteMany({})`. </br></br> **4.** Run another backup. If the backup still fails, check the workaround 2.|
| **2**|**Shorter downtime**  |Restart config server (sharded clusters only) |**1.** Get the list of config server pods:`kubectl get po -n <YOUR_NAMESPACE> -l app.kubernetes.io/component=cfg,app.kubernetes.io/instance=<YOUR_DB_CLUSTER_NAME>`. </br></br> **2.** For each pod name in the list, run `kubectl delete pod <POD_NAME> -n <YOUR_NAMESPACE>` </br></br> **3.** Wait until your database cluster is up. </br></br> **4.** Run another bakckup. If the backup still fails, check workaround 3.|
| **3**|**Longer downtime**|Restart the DB server |**1.** On Percona Everest UI, click **Actions >> Restart**. </br></br> **2.** When the database cluster is up, take another backup.|


## Scheduled backups

Let's explore the constraints of scheduled backups in Percona Everest.

### PostgreSQL Limitations for schedules

Due to PostgreSQL limitations, the following functionality is unavailable for PostgreSQL:

- Modifying the storage location in existing schedules
- Using the same backup storage for different schedules
- Creating more than three schedules for PostgreSQL
- Using more than three different backup storages in total, including those used in existing on-demand backups.
 
Everest does not allow these actions to be performed because they could corrupt previously taken backups, making it impossible to restore from them.


## Point-in-time-recovery (PITR)

Point-In-Time Recovery (PITR) can only be used after a certain time has elapsed since the latest backup. This interval of time is referred to as the **PITR upload interval**. During this interval, PITR restore won't be available.

The default **uploadInterval** values for different databases are as follows:  

- MySQL = 1 minute
- MongoDB = 10 minutes
- PostgreSQL = 1 minute


### PostgreSQL limitation for PITR

When performing point-in-time recovery (PITR) for PostgreSQL, it is important to consider the following limitation:

You may encounter issues with point-in-time recovery (PITR) when attempting to recover the database after the last transaction. PITR can get stuck in the **Restoring** state.

**Check the timestamp of the last transaction**

Connect to your database and run the following command:

`select pg_last_committed_xact();`

??? example "Expected output"
    ```
    (768,“2024-03-13 15:52:25.122746+00”,0);
    ```
    It contains the global transaction identifier (`GTID`), `timestamp` and the status of the last transaction.
    
                
!!! warning  
    You can only recover data for the dates prior to this specific date.


**Workaround**

You can follow these steps if your database cluster is stuck in the **Restoring** state:
{.power-number}


1. Check if your database cluster has been stuck because you have used a date after the last transaction:

    a. Find the recovery pod:

        
	    kubectl get pod -n your-namespace
        		
    
    The format of the recovery pod name is `<cluster_name>-pgbackrest-restore-<XYZ>`. The status of the recovery pod should be **Running**.

    b. Check the logs for the recovery pod:
       
        kubectl logs <restore_pod_name> -n your-namespace

    ??? example "Example"
        ```        
        kubectl logs postgresql-kbi-pgbackrest-restore-8b95v -n your-namespace
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