# Import external database backups into Percona Everest

## Introduction

This new feature in Percona Everest enables you to import database **backups stored in external object** storage into clusters managed by Percona Everest using an extensible design.


## Why importing external database backups matters?

Many users looking to adopt Percona Everest already have databases or database backups created with various tools or services, such as AWS RDS, Aurora, or MongoDB Atlas. These backups are often stored in object storage services like Amazon S3. 

Currently, Percona Everest does not offer a method to import these backups into its database clusters. Thus we need a solution where you can easily import external database backups into Percona Everest clusters.

## Goals

This feature aims to achieve the following goals:

- Allow you to import backup data stored in external locations like Amazon S3 into Everest-managed database clusters.

- Support various backup formats and tools, including logical and physical backups using `pg_dump`, `mysqldump`, `mongodump`, and more.

- Provide a pluggable and extensible framework that can adapt to different import needs and workflows.

