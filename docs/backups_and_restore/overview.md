# Overview: Import external database backups into Percona Everest

!!! warning "Disclaimer"
    Importing external database backups into Percona Everest feature is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and **not in production environments**.


This new feature in Percona Everest enables you to import database **backups stored in external object** storage into clusters managed by Percona Everest using an extensible design.


## Why import external database backups?

Many users looking to adopt Percona Everest already have databases or database backups created with various tools or services, such as AWS RDS, Aurora, or MongoDB Atlas. These backups are often stored in object storage services like Amazon S3. 

Percona Everest currently does not provide a method for importing external database backups into its database clusters. We require a solution that enables you to import these backups into Percona Everest clusters.

### Objectives

This feature can help you achieve the following objectives:

- Allow you to import backup data stored in external locations like Amazon S3 into everest-managed database clusters.

- Support various backup formats and tools, including logical and physical backups using `pg_dump`, `mysqldump`, `mongodump`, and more.

- Provide a pluggable and extensible framework that can adapt to different import needs and workflows.


## Understanding DataImporters

### What are DataImporters?

A **DataImporter** is a self-contained, reusable blueprint for importing data into a newly created everest-managed database cluster, which defines:

- The container to be run for your data restore logic.
- The database engines it supports.
- The input configurations it requires (e.g., S3 path, credentials, and custom inputs).
- Any constraints that your database cluster must meet, such as engine version requirements.

### What is a DataImporters job?

DataImportJob is a namespace-scoped CRD that represents a single execution of a DataImporter. Percona Everest automatically creates it when a user initiates a backup import using a specified `DataImporter`. Internally, it runs a Kubernetes Job that runs the specified import logic on a newly created `DatabaseCluster`, using the credentials and configuration provided by the user (e.g., S3 bucket, file path, access keys).

### Why use DataImporters?

Organizations use different backup tools, such as `pg_dump`, `mysqldump`, `mongodump`, physical snapshots, or vendor-specific tools. Percona Everest offers multiple restore methods instead of a single standard approach. With DataImporters, you can write **custom restore logic** for your preferred backup tools or formats, and Percona Everest executes them.

The benefits of using DataImporters are:

- **Reusable:** You can define it once and use it across various environments.

- **Flexible:** You can perform imports using any scripting or programming language and restore tool.

- **Extensible:** It supports custom backup formats or workflows.

- **Decoupled:** Percona Everest manages the infrastructure while you focus on the data logic.

## Limitations

There are a few limitations to be aware of when importing external database backups:


- For certain data import methods, you must provide database user credentials that match those of the source database. Percona Everest does not validate these credentials, so ensure that they are accurate.

- Percona Everest does not verify the compatibility of imported data with the version of the target `DatabaseCluster`. Ensure that the backup is compatible with the version of the database managed by Percona Everest.



        







