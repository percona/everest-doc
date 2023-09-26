# Backup and restore databases

## Why it’s important to create backups

Databases (DBs) may get damaged due to a variety of reasons, including disk crashes, power outages, software errors, or even virus attacks.  

To ensure that you can recover data in such events, it is critical to back up your databases. With Everest, you can do this with zero downtime and minimal performance impact.

## Supported setups

Currently, you can create and restore on-demand backups. Future releases will add Point-in-Time-Recovery and scheduled backups functionality.

## Prerequisites

### Prepare storage location

Before working with backups, create a backup location as a backup destination for creating and storing your backup artifacts.  

Everest supports Amazon S3-compatible backup locations, which means you can use [AWS S3](https://aws.amazon.com/s3/) or any other storage solutions that support S3 API, like [min.io](https://min.io/).

!!! caution alert alert-warning "Important"

     - Currently, Everest does not support S3 buckets with S3 Object Lock. Make sure your backup destination you are registering does not have S3 Object Lock enabled.
     - Make sure you have read/write/delete permissions to the S3 bucket.
     - Make sure not to share the same backup storage location for multiple database clusters.

To create a backup storage location:
{.power-number}

1. Go to **Settings > Backup storage** and click **Add backup storage**.  
2. In the **Name** field, specify a location name using only lowercase alphanumeric characters or hyphens. 
3. Enter your credentials, making sure to use regional AWS STS endpoints instead of the global endpoint: `https://s3.<region>.amazonaws.com`.
    Using an endpoint that is geographically closer to your application reduces latency and provides better response times.

## Create backup

To create a backup for a database:
{.power-number}

1. Go to <i class="uil uil-cog"></i>  **Settings > Backup Storages** and check that  you have an available AWS S3-compatible location for storing  backups.
2. Go to the <i class="uil uil-database"></i>  **Databases** view and select the DB which you want to back up.
3. Click **Create backup > Now**. 
4. In the **Create Backup** pop-up, change the default backup name if required, select an available backup location, and then click **Create**.

## Restore the database from a previously saved backup

To restore a database from a backup:
{.power-number}

1. In the <i class="uil uil-database"></i> **Databases** view, select the database you want to restore.
2. Click the <i class="uil uil-ellipsis-h"></i> Actions menu next to the backup you want to restore from, then click **Restore to this DB**. 
3. Select **Restore** to restore the backup of your database.

## Restore backup to a new database

Database backups and data replication are complementary components of an effective disaster recovery strategy. 

 There are specific situations that require the creation of a new database from a backup instead of restoring the data to the original database:

- **When the original database is compromised**: Restoring a backup directly to a compromised DB could reintroduce the same issues. Creating a new database from the backup ensures that the restored data is isolated from the original database, preserving data integrity.

- **When you want to debug a problem**: In a disaster recovery situation, it's essential to understand the root problem that led to the need for recovery. Creating a new database allows you to examine the original database for vulnerabilities or issues before restoring the data. This can help identify weaknesses that need to be addressed.

- **When you want to validate backup data before restore**: By creating a new database, you can test the integrity and consistency of the backup data before making it the primary production data. This validation process ensures that the backup is clean and free from corruption, reducing the risk of propagating issues from the backup to the new database.

- **Before upgrading or patching**: In some cases, a disaster recovery event might coincide with the need to upgrade or patch the database software. Creating a new database allows you to apply the necessary upgrades or patches to the new environment, ensuring that the production environment is up-to-date and secure.

- **To create a safety net for rollbacks**: Restoring the backup directly to the original database leaves little room for rolling back the recovery process if issues are discovered later. Creating a new database provides a safety net, as you can decide whether to promote the new database to the production environment or keep the original one if necessary.

To create a new database from backup:
{.power-number}

1. In the <i class="uil uil-database"></i> **Databases** view, select the database you want to replicate.
2. Click the <i class="uil uil-ellipsis-h"></i> Actions menu next to the backup you want to replicate from, then click **Create new DB**.
3. Select **Create** to start database provisioning for the DB replica.
4. In the **Basic information** window, change the default backup name if required, then select one of the classes created by your Kubernetes administrator. 
Storage classes define what storage configuration and features will be used for storing your database data. Different classes map to different quality-of-service levels, backup policies, persistent volumes, or to arbitrary policies determined by your cluster administrator. For more information, see [Storage Classes](https://kubernetes.io/docs/concepts/storage/storage-classes/) in the Kubernetes documentation. 
5. On the **Resources** page, select the number of nodes and set the resources. For more information see, [Provision a database](../use/db_provision.md).
6. On the **Advanced Configurations** page, enable external access and database engine parameters by turning the toggle button on. For more information on configuring specific database parameters, see the [MySQL](https://dev.mysql.com/doc/refman/8.0/en/option-files.html), [MongoDB](https://www.mongodb.com/docs/manual/reference/configuration-options), and [PostgreSQL](https://www.postgresql.org/docs/current/config-setting.html#CONFIG-SETTING-CONFIGURATION-FILE) configuration documentation.
7. If you've enabled monitoring during CLI provisioning, this option will show as active on the **Monitoring** page and you can disable it if required.
8. Click **Create database** then run the command on the screen to ensure that you're using the same secret as the selected backup.