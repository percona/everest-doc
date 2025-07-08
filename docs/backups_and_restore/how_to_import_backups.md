# How to import external database backups using the Percona Everest UI

Here are the steps to import external database backups using Percona Everest UI:
{.power-number}

1. Log in to the Percona Everest UI.

2. From the Percona Everest homepage, click **Import**. Select the database type you want to import(MySQL, PostgreSQL, or MongoDB). The **Basic Information** page will be displayed.


3. Fill in the details on the **Basic information** page and click **Continue**. This will take you to the **Import info** page.

3. Select the data importer from the dropdown on the **Import information** page. Follow the steps below based on the selected database:

=== ":simple-mongodb: MongoDB"
    # Import MongoDB backups
     
     Provide the details of the backup you want to import:
    {.power-number}

    1. Click **Fill details** to provide your S3 storage details. The **S3 details** page will open. 
    
        Enter the following:

        - **Bucket name**:  Enter the unique name identifying your S3 storage bucket.
        - **Region**: Select the geographical AWS region where your bucket is hosted (e.g., us-east-1, eu-west-1)
        - **Access key**: Enter your AWS Access Key ID (like a username for API access).
        - **Secret key**: Enter your AWS Secret Access Key (like a password for secure API access).
        
        Click **Save**.

        ![!image](../images/mongodb_s3_details_importers.png)

    2. In the **File directory** section, specify the path within your S3 bucket where the backup files are stored. Click **Save**.

        !!! info "Important"
            Percona Everest does not validate file paths or verify the existence of files in the specified storage buckets. Make sure that the backup directory path is correct and accessible.


        ??? example "Find the file path using AWS CLI"
            **Prerequisites:** Ensure AWS CLI is installed and configured on your system. To install AWS CLI, refer to the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).


            1. Run the following command:

                ```sh
                cat > ~/.aws/credentials
                [default]
                aws_access_key_id = SECRET
                aws_secret_access_key = SECRET
                ```
            
            2. Navigate your S3 bucket structure:
            
                ```sh
                # List the folders in the bucket            
                aws s3 ls <S3 bucket-name>
            
                # Output           
                PRE mongodb-zh5/
                PRE postgresql-6az/
            
                # List the subfolders                
                aws s3 ls <S3 bucket-name>/mongodb-zh5/
                                
                # Output                
                PRE 02d0a297-16ca-4b9f-8073-2f16607de3c9/
                
                # Drill down further
                aws s3 ls <S3 bucket-name>/mongodb-zh5/02d0a297-16ca-4b9f-8073-2f16607de3c9/
                
                # Output               
                PRE 2025-07-01T07:13:32Z/
            
                # Dig deeper            
                aws s3 ls <S3 bucket-name>/mongodb-zh5/02d0a297-16ca-4b9f-8073-2f16607de3c9/2025-07-01T07:13:32Z/
        
                # Output
                PRE rs0/

                The file path for MongoDB will be:
                /mongodb-zh5/02d0a297-16ca-4b9f-8073-2f16607de3c9/2025-07-01T07:13:32Z/
                ```

        ![!image](../images/importers_mongo_file_path.png)


    3. In the **DB Credentials** section, enter the key-value pairs for credentials and user secrets.


        ??? example "Retrieve the credentials from the Kubernetes secret"
            Run the following command to decode the credentials stored in the Kubernetes secret:


            ```sh
            kubectl get secret everest-secrets-mongodb-zh5 -n everest -o jsonpath="{.data}" | jq 'map_values(@base64d)'
            ```

            Replace `everest-secrets-mongodb-zh5` with your secret name.


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
        
        ![!image](../images/importers_mongodb_db_credentials.png)      


    4. Click **Continue** to proceed. You will see the basic information page for your target database.

    5. Enter the information and click continue until you reach the end of the wizard.

    Your backup import process will now start. You will be notified once the import is successfully completed.

    ![!image](../images/import_complete_mongodb.png)



=== ":simple-mysql: MySQL"
    # Import MySQL backups

    Provide the details of the backup you want to import:
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


        !!! info "Important"
            Percona Everest does not validate file paths or verify the existence of files in the specified storage buckets. Make sure that the backup directory path is correct and accessible.


        ??? example "Example"

            !!! info "Find the file path using AWS CLI"
                **Prerequisites:** Ensure AWS CLI is installed and configured on your system. To install AWS CLI, follow the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).


            1. Run the following command:

                ```sh
                cat > ~/.aws/credentials
                [default]
                aws_access_key_id = SECRET
                aws_secret_access_key = SECRET
                ```
            
            2. Navigate your S3 bucket structure:
            
                ```sh
                # List the folders in the bucket
                aws s3 ls <S3 bucket-name>


                # Output
                PRE mongodb-zh5/
                PRE mysql-wih/
                

                # List the subfolders
                aws s3 ls <S3 bucket-name>/mysql-wih/
                
                # Output
                PRE 515f9e1b-301d-4b34-b2bd-959713bc70d0/


                # Drill down further
                aws s3 ls <S3 bucket-name>/mysql-wih/515f9e1b-301d-4b34-b2bd-959713bc70d0/
            

                # Output
                PRE mysql-wih-2025-07-01-11:40:18-full.sst_info/
                PRE mysql-wih-2025-07-01-11:40:18-full/
                2025-07-01 17:10:49  
                25765 mysql-wih-2025-07-01-11:40:18-full.md5
                2025-07-01 17:10:36  
                128 mysql-wih-2025-07-01-11:40:18-full.sst_info.md5

                The full file path for MySQL will be:
                /mysql-wih/515f9e1b-301d-4b34-b2bd-959713bc70d0/mysql-wih-2025-07-01-11:40:18-full/
                ```

        ![!image](../images/importers_mysql_file_path.png)


    3. In the **DB Credentials** section, enter the key-value pairs for credentials and user secrets.

        ![!image](../images/importers_mysql_db_credentials.png)

        ??? example "Retrieve the DB credentials from the Kubernetes secrets"
            Run the following command to decode the credentials stored in the Kubernetes secret:


            ```sh
            kubectl get secret everest-secrets-mysql-wih -n everest -o jsonpath="{.data}" | jq 'map_values(@base64d)'
            ```

            Output

            ```sh
            {
                "monitor": "hgL3^_P*LE$4,b.Z=",
                "operator": "480.GqWs&K>!~$Di",
                "proxyadmin": "tud&9[9gVSMMNt+6pj.",
                "replication": "q!<76<X}F.S2mA._%w",
                "root": "_bvt*Ip*@r-JOpz>q@1",
                "xtrabackup": "icR#jAwr0V-UW##73o"
            }
            ```

    4. Click **Continue** to proceed. You will see the basic information page for your target database.

    5. Enter the information and click on continue until you reach the end of the wizard.

    Your backup import process will now start. You will be notified once the import is successfully completed.

       ![!image](../images/import_complete.png)


=== ":simple-postgresql: PostgreSQL"
    # Import PostgreSQL backups

    Provide the details of the file you want to import:
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

        !!! info "Important"
            Percona Everest does not validate file paths or verify the existence of files in the specified storage buckets. Make sure that the backup directory path is correct and accessible.


        ??? example "Find the file path using AWS CLI"
            !!! info "Find the file path using AWS CLI"
                **Prerequisites:** Ensure AWS CLI is installed and configured on your system. To install AWS CLI, refer to the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

                        

            1. Run the following command:

                ```sh
                cat > ~/.aws/credentials
                [default]
                aws_access_key_id = SECRET
                aws_secret_access_key = SECRET
                ```
            
            2. Navigate your S3 bucket structure:
            
                ```sh
                # List the folders in the bucket
                aws s3 ls <S3 bucket-name>

                # Output
                PRE postgresql-nf9/

                # List the subfolders:
                aws s3 ls <S3 bucket-name>/postgresql-nf9/
                
                # Output
                PRE bd68c303-33eb-4368-b564-2cc4b9c71163/

                # Drill down further:
                aws s3 ls <S3 bucket-name>/postgresql-nf9/bd68c303-33eb-4368-b564-2cc4b9c71163/

                # Output
                PRE archive/
                PRE backup/


                # Go into the backup folder
                aws s3 ls <S3 bucket-name>/postgresql-nf9/bd68c303-33eb-4368-b564-2cc4b9c71163/backup/

                # Output
                PRE db/


                # Go into the db folder
                aws s3 ls <S3 bucket-name>/postgresql-nf9/bd68c303-33eb-4368-b564-2cc4b9c71163/backup/db/

                # Output
                PRE 20250702-085755F/
                PRE backup.history/
                2025-07-02 14:28:53   1174 backup.info
                2025-07-02 14:28:53   1174 backup.info.copy

            
                The full file path for PostgreSQL will be:
                /postgresql-nf9/bd68c303-33eb-4368-b564-2cc4b9c71163/backup/db/PRE 20250702-085755F/
                ```

        ![!image](../images/importers_pg_file_path.png)


    3. Click **Continue**. You will see the basic information page for your target database.

    4. Enter the information and click **Continue** until you reach the end of the wizard.

    Your backup import process will now start. You will be notified once the import is completed.

    ![!image](../images/import_complete_postgresql.png)


        







