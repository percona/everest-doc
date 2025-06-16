# Import external database backups into Percona Everest

## Introduction

This new feature in Percona Everest enables you to import database **backups stored in external object** storage into clusters managed by Percona Everest using an extensible design.


## Why importing external database backups matters?

Many users looking to adopt Percona Everest already have databases or database backups created with various tools or services, such as AWS RDS, Aurora, or MongoDB Atlas. These backups are often stored in object storage services like Amazon S3. 

Currently, Percona Everest does not offer a method to import these backups into its database clusters. Thus we need a solution where you can easily import external database backups into Percona Everest clusters.

### Goals

This feature aims to achieve the following goals:

- Allow you to import backup data stored in external locations like Amazon S3 into Everest-managed database clusters.

- Support various backup formats and tools, including logical and physical backups using `pg_dump`, `mysqldump`, `mongodump`, and more.

- Provide a pluggable and extensible framework that can adapt to different import needs and workflows.


## Understanding DataImporters


## How to import external database backups using Percona Everest UI

Here are the steps to import external database backups using Percona Everest UI:
{.power-number}

1. Log into the Percona Everest UI.

2. On the Percona Everest homepage, click **Import**.  Select the database type that you wish to import. The **Import info** page will then be displayed.

3. On the **Import info** page, select the available data importer from the drop down and then based on this importer enter the following information:

    1. Click **Fill details** to provide the S3 details. The **S3 details** page will be displayed. Enter the following details such as:

        - Bucket name: A unique identifier you give to your bucket (storage container) to distinguish it from others.
        - Region: Specific geographical location (data center) where your data is physically stored.
        - Access key: Equivalent of a username used for programmatic (API) access to AWS services.
        - Secret key: Equivalent of a password used for programmatic (API) access to AWS services.
        
        - Click **Save**.


    2. In the **File directory** section and provide the file path (The specific folder path within your S3 storage where your database backup files are stored). Click **Save**.


    3. Provide the **DB credentials** which are basically the key-value pairs for crendtials and user secrets.    


4. Click **Continue**.














