# RBAC for external backup imports in Percona Everest

When importing external backups into Percona Everest, it is essential to consider Role-Based Access Control(RBAC) permissions. This ensures only authorized users have the required permissions to access and manage the data.


The following RBAC permissions are supported for `DataImporters` and `DataImportJobs`:


!!! warning "Important"
    :x: Represents an action that's not supported by the Percona Everest API.

|**Resource**| **Read**| **Create**| **Update**|**Delete**|
|------------|---------|-----------|-----------|----------|
| `data-importers`|[name]| :x:|:x: | :x:|
| `data-import-jobs`|[namespace]/[db name]| :x:|:x: | :x:|


## Example: RBAC Policy for importing a MySQL backup

To import a MySQL backup using a `DataImporter`, a user with the `dbadmin` role needs the following permissions within the `a2` namespace :

    p, role:dbadmin, namespaces, read, *
    p, role:dbadmin, database-engines, read, a2/*
    p, role:dbadmin, database-clusters, *, a2/*
    p, role:dbadmin, backup-storages, read, a2/*
    p, role:dbadmin, database-cluster-backups, *, a2/*
    p, role:dbadmin, monitoring-instances, read, a2/*
    p, role:dbadmin, data-importers, read, everest-percona-pxc-operator
    p, role:dbadmin, data-import-jobs, read, a2/*


??? info "Let’s dive into decoding this!"

    | Resource |Action | Description |
    | ---------| ------|--------------|
    | `namespaces`| read| You can view all namespaces in the cluster. |                                    |
    | `database-engines` | read | You can view the available database engine types within the `a2` namespace.|
    | `database-clusters` | \* | Full access to manage database clusters in the `a2` namespace. |
    | `backup-storages` | read  | You can view configured external storage targets (e.g., S3, GCS).          |
    | `database-cluster-backups` | \*| Grants full control over database backups. You can create new backups, restore from existing ones, and delete them as needed.                                             |
    | `monitoring-instances`| read| You can view monitoring configuration for clusters|
    | `data-importers` | read | You can view and use a specific `DataImporter` (in this case, everest-percona-pxc-operator) during the backup import workflow. Without this, the importer will not appear in the UI or CLI. |
    | `data-import-jobs`| read| View You can monitor the status of import jobs triggered via the `DataImporter`.|

!!! note
    For MongoDB and PostgreSQL, the importer names will be `everest-percona-psmdb-operator` and `everest-percona-pg-operator `respectively.
