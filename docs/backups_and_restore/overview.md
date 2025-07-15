# Overview: Import external database backups into Percona Everest

!!! warning
    The external backup import feature in Percona Everest is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and **not in production environments**.


This new feature in Percona Everest enables you to import database **backups stored in external object** storage into clusters managed by Percona Everest using an extensible design.

## Objectives

This feature can help you achieve the following objectives:

- Allow you to import backup data stored in external storage like Amazon S3 into database cluster managed by Percona Everest.

- Allow you to customize the import process using your preferred tools, such as `mongodump`, `pg_dump`, or `mysqldump`.

- Provide a pluggable and extensible framework that can adapt to different import needs and workflows.


## Understanding DataImporters

### What are DataImporters?

A **DataImporter** is a cluster-scoped CRD (Custom Resource Definition). It represents a self-contained, reusable blueprint for importing data into a newly created database cluster managed by Percona Everest. It defines:

- The container to be run for your data restore logic.
- The database engines it supports.
- The input configurations it requires (e.g., S3 path, credentials, and custom inputs).
- Any constraints that your database cluster must meet, such as engine version requirements.

!!! note
    Initially, Percona Everest includes three **pre-installed DataImporters**, designed to restore external backups created using Percona operators.

### What is a DataImport job?

`DataImportJob` is a namespace-scoped CRD that represents a single execution of a DataImporter. Percona Everest automatically creates it when a user initiates a backup import using a specified `DataImporter`. Internally, it runs a Kubernetes Job that runs the specified import logic on a newly created `DatabaseCluster`, using the credentials and configuration provided by the user (e.g., S3 bucket, file path, access keys).

### Why use DataImporters?

Organizations use different backup/restore tools, such as `pg_dump`, `mysqldump`, `mongodump`, physical snapshots, or vendor-specific tools. While Percona Everest does not natively offer support for such tools, with DataImporters, you can write **custom restore logic** for your preferred backup tools or formats, and Percona Everest executes them.

The benefits of using DataImporters are:

- **Reusable:** You can define it once and use it across various environments.

- **Flexible:** You can perform imports using any scripting or programming language and restore tool.

- **Extensible:** It supports custom backup formats or workflows.

- **Decoupled:** Percona Everest manages the infrastructure while you focus on the data logic.


Do you want to customize your import process? You can create a custom `DataImporter` tailored to your specific use case. See the [documentation](https://github.com/percona/everest-operator/blob/main/docs/guides/build_your_own_dataimporter.md){:target="_blank"} for detailed instructions.


## Use cases

Here are some common scenarios for importing database backups into Percona Everest.

=== "PG restore from S3"

    ### Restore a PostgreSQL cluster from an S3 backup

    You have a logical backup of a PostgreSQL database, created using `pg_dump`, stored in an Amazon S3 bucket. You want to use this backup to initialize a new PostgreSQL cluster managed by Percona Everest.


=== "Migrate from MongoDB Atlas"

    ### Migrate from MongoDB Atlas to Percona Everest
    You want to migrate from MongoDB Atlas using a `mongodump` export and import it into a MongoDB cluster on Percona Everest.

=== "Custom import strategy"

    ### Create and share a custom import strategy
    You want to develop and reuse a custom data import strategy for your organization and make it available within Percona Everest.

## Limitations

There are a few limitations to be aware of when importing external database backups:

- Percona Everest 1.8.0 **does not guarantee** successful imports for physical backups because it lacks an encryption key configuration. Although some cases may work depending on the backup method and environment, there is currently no official support for this feature.

- Certain import methods require database user credentials that exactly match those from the source system. Since Percona Everest does not validate these credentials, you must ensure they are **accurate** before starting the import.

- Percona Everest does not verify the **compatibility of imported data** with the version of the target `DatabaseCluster`. Ensure that the backup is compatible with the database version managed by Percona Everest.






        







