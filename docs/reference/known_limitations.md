# Known limitations in Percona Everest


This section describes the known limitations associated with Percona Everest:



## Passwords

Refrain from changing the password of administrative users (e.g., root, monitor, or operator) manually in the database. This action may cause inconsistencies with the secrets stored in Kubernetes, which are crucial for the proper functioning of the cluster. Such modifications have the potential to disrupt your cluster.

We are developing a new feature that will allow you to modify these settings directly from the user interface (UI).



## Backups

The limitations related to backups in Percona Everest are as follows:

- When attempting to delete a PostgreSQL database that contains backups created with Everest versions older than 1.0.0, the database may become stuck in the **Deleting** state. 

    **Workaround**: To prevent this, manually delete any backups created with versions prior to 1.0.0 by using the **Delete** action on the **Backups** page before deleting the database.

- You cannot change the bucket name for a specific backup storage. Doing so will make any backups taken for that bucket unusable.


## Scheduled backups

Due to an issue identified in PostgreSQL, the following functionalities are currently unavailable:

- Modifying the storage location in existing schedules
- Using the same backup storage for different schedules
- Creating more than three schedules for PostgreSQL

The bug may result in a situation where editing or deleting the schedules could corrupt previously taken backups, making it impossible to restore from them.


## Point-in-time-recovery (PITR)

Point-In-Time Recovery (PITR) can only be used after a certain time has elapsed since the latest backup. This interval of time is referred to as the **PITR upload interval**. During this interval, PITR restore won't be available.

The default **uploadInterval** values for different databases are as follows:  

- MySQL = 1 minute
- MongoDB = 10 minutes
- PostgreSQL = 1 minute


### Limitation for PostgreSQL

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


## CLI

If an unexpected error occurs when using the Everest CLI (everestctl), you may encounter a development stack trace that is helpful for debugging.