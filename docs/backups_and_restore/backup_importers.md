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

### DataImporters overview

A **DataImporter** is a self-contained, reusable blueprint for importing data into a newly created everest-managed database cluster.

It defines the following:

- The container to be run for your data restore logic.
- The database engines it supports.
- The input configurations it requires (e.g., S3 path, credentials, and custom inputs).
- Any constraints, such as engine version requirements, that your database cluster must meet.

### Why use a DataImporter?

Every organization utilizes different backup tools, such as `pg_dump`, `mysqldump`, `mongodump`, physical snapshots, or vendor-specific tools. As a result,, Percona Everest **does not enforce** a one-size-fits-all restore mechanism. Instead, with DataImporters, you can write **custom restore logic** specific to the backup tools or formats you prefer, and percona Everest  just executes them for you.

The benefits of using DataImporters are:

- Reusable: You can define it once and use it across various environments.

- Flexible: ou can use any scripting or programming language, as well as any restore tool, to perform imports.

- Extensible: It supports custom backup formats or workflows.

- Decoupled: Percona Everest manages the manages the infrastructure while you focus on the data logic.


## How to import external database backups using the Percona Everest UI

Here are the steps to import external database backups using Percona Everest UI:
{.power-number}

1. Log into the Percona Everest UI.

2. From the Percona Everest homepage, click **Import**. Select the database type you want to import(MySQL, PostgreSQL, or MongoDB). The **Basic information** page will open.

3. Fill in the required details on the **Basic information** page and click **Continue**. This will take you to the **Import info** page.

3. On the **Import info** page, choose the data importer from the dropdown. Depending on the technology selected, you will need to provide the details as given in the tabs below:

=== "MongoDB"
    On the **Import info** page, choose the data importer from the dropdown and provide the following details:
    {.power-number}

    1. Click **Fill details** to provide your S3 storage details. The **S3 details** page will open. 
    
        Enter:

        - **Bucket name**:  Enter the unique name identifying your S3 storage bucket.
        - **Region**: Select the geographical AWS region where your bucket is hosted (e.g., us-east-1, eu-west-1)
        - **Access key**: Enter your AWS Access Key ID (like a username for API access).
        - **Secret key**: Enter your AWS Secret Access Key (like a password for secure API access).
        
        Click **Save**.

            ![!image](../images/mongodb_s3_details_importers.png)

    2. In the **File directory** section, specify the path within your S3 bucket where the backup files are stored. Click **Save**.

        ![!image](../images/importers_mongo_file_path.png)


        ??? example "Example"
            How to find the file path using the AWS CLI:
            {.power-number}

            1. Ensure that you have AWS CLI installed.

            2. Set the following using the CLI:

                ```sh
                [default]
                aws_access_key_id = SECRET
                aws_secret_access_key = SECRET
                ```

            
            3. Run the following command:
            
                ```sh
                aws s3 ls <S3 bucket-name>
                ```

                Output

                ```sh
                PRE mongodb-zh5/
                PRE postgresql-6az/
                ```

            4. Run the following command:

                ```sh
                aws s3 ls <S3 bucket-name>/mongodb-zh5/
                ```
                
                Output

                ```sh
                02d0a297-16ca-4b9f-8073-2f16607de3c9/
                ```

            5. Run the following command:

                ```sh
                aws s3 ls <S3 bucket-name>/mongodb-zh5/02d0a297-16ca-4b9f-8073-2f16607de3c9/2025-07-01T07:13:32Z/
                ```

                Output

                ```sh
                PRE rs0/
                ```

                Thus, the file path for MongoDB will be:

                /mongodb-zh5/02d0a297-16ca-4b9f-8073-2f16607de3c9/2025-07-01T07:13:32Z/


    3. Provide the **DB credentials**, the key-value pairs for credentials, and user secrets.

        ![!image](../images/importers_mongodb_db_credentials.png)

        ??? example "Example"
            You can obtain the **DB credentials** as follows using the AWS CLI in a decoded format by running the following command:

            ```sh
            kubectl get secret everest-secrets-mongodb-zh5 -n everest -o jsonpath="{.data}" | jq 'map_values(@base64d)'
            ```

            Output

            ```sh
            {
                "MONGODB_BACKUP_PASSWORD": "3mBRT5XuJSrMzwhB",
                "MONGODB_BACKUP_USER": "backup",
                "MONGODB_CLUSTER_ADMIN_PASSWORD": "hE1M5Eaut93uWJGCykd",
                "MONGODB_CLUSTER_ADMIN_USER": "clusterAdmin",
                "MONGODB_CLUSTER_MONITOR_PASSWORD": "4ICXY35dqCfjZYR2p7",
                "MONGODB_CLUSTER_MONITOR_USER": "clusterMonitor",
                "MONGODB_DATABASE_ADMIN_PASSWORD": "5aQbEZEDjhoAWoSbc03",
                "MONGODB_DATABASE_ADMIN_USER": "databaseAdmin",
                "MONGODB_USER_ADMIN_PASSWORD": "a9pb12A09pSNchldzq",
                "MONGODB_USER_ADMIN_USER": "userAdmin"
                }
            ```

    4. Click **Continue**. You will then see the basic information page for your new database.

    5. Enter the information and click on continue until you reach the end of the wizard.

    Your database backup will now start importing, and you will be notified upon successful completion.


=== "MySQL"
    On the **Import info** page, choose the data importer from the dropdown and provide the following details:
    {.power-number}

    1. 











