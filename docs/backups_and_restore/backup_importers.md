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


## How to import external database backups using the Percona Everest UI

Here are the steps to import external database backups using Percona Everest UI:
{.power-number}

1. Log into the Percona Everest UI.

2. From the Percona Everest homepage, click **Import**. Select the database type you want to import(MySQL, PostgreSQL, or MongoDB). The **Import info** page will open.

3. On the **Import info** page, choose the data importer from the dropdown. Depending on the importer selected, you will need to provide the following details:

    1. Click **Fill details** to provide your Amazon S3 storage details. The **S3 details** page will open. 
    
        Enter:

        - **Bucket name**:  Enter the unique name identifying your S3 storage bucket.
        - **Region**: Select the geographical AWS region where your bucket is hosted (e.g., us-east-1, eu-west-1)
        - **Access key**: Enter your AWS Access Key ID (like a username for API access).
        - **Secret key**: Enter your AWS Secret Access Key (like a password for secure API access).
        
        Click **Save**.


    2. In the **File directory** section, enter the file path within your S3 bucket where the database backup files are stored. Click **Save**.


    3. Provide the **DB credentials**, the key-value pairs for credentials, and user secrets. 


4. Click **Continue**. You will then see the basic information page for your new database.

5. Enter the information and click on continue until you reach the end of the wizard.

Your database backup will now start importing, and you will be notified upon successful completion.














