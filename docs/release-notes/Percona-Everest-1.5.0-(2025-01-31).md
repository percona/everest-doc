# What's new in Percona Everest 1.5.0

!!! warning
    Google Container Registry (GCR) is scheduled to be deprecated and will officially shut down on March 18, 2025. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date. We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible. If you do not upgrade, Percona Everest will no longer function.

    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Affinity](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_1)||
    | **2.**|[Operators support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_4)|Support for [Percona Operator for MongoDB v1.18.0](https://docs.percona.com/percona-operator-for-mongodb/RN/Kubernetes-Operator-for-PSMONGODB-RN1.18.0.html){:target="_blank"} (PSMDB) and [Percona Operator for PostgreSQL v2.5.0](https://docs.percona.com/percona-operator-for-postgresql/2.0/ReleaseNotes/Kubernetes-Operator-for-PostgreSQL-RN2.5.0.html){:target="_blank"} (PG)|
    | **5.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.4.0|
    | **6.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.4.0|
    | **7.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.4.0|
    | **8.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.4.0|


## Release highlights


=== "Operators support"

    ### Support for PSMDB 1.18.0 and PG 2.5.0


    Starting with Percona Everest 1.4.0, we are thrilled to announce that we have added support for PSMDB Operator v1.18.0 and PG operator v2.5.0.

## New features





## Improvements



## Bugs




## Known limitations

- In Percona Operator for PostgreSQL version 2.5.0, backups start failing after a minor version upgrade from PostgreSQL 16.3 to 16.4 if **monitoring is enabled** on the database. 

    **Workaround** 

    Once you upgrade your PostgreSQL version, it’s essential to also update the `pg_stat_monitor` extension by executing the following command:
    
    ```sql
    ALTER EXTENSION pg_stat_monitor UPDATE;
    ```

- The backup storage you choose for your initial backup schedule will be used for all subsequent schedules and point-in-time recovery (PITR).

- When creating a 1-node MongoDB cluster, the cluster temporarily enters an **Error** state instead of **Initializing** before transitioning to the **Ready** state.

- When restoring a MySQL database from a backup, the process may fail if the database name is too long. Use a shorter name for the restored database.







