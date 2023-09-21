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

     Make sure not to share the same backup storage location for multiple database clusters.

To create a backup storage location:

1. Go to **Settings > Backup storage** and click **Add backup storage**.  
2. In the **Name** field, specify a location name using only lowercase alphanumeric characters or hyphens. 
3. Enter your credentials, making sure to use regional AWS STS endpoints instead of the global endpoint: `https://s3.<region>.amazonaws.com`.
 Using an endpoint that is geographically closer to your application reduces latency and provides better response times.

## Create backup

To create a backup for a database:

1. Go to <i class="uil uil-cog"></i>  **Settings > Backup Storages** and check that  you have an available AWS S3-compatible location for storing  backups.
2. Go to the <i class="uil uil-database"></i>  **Databases** view and select the DB which you want to back up.
3. Click **Create backup > Now**. 
4. In the **Create Backup** pop-up, change the default backup name if required, select an available backup location, and then click **Create**.

## Restore backup  to a database cluster

To restore a database from a backup:

1. In the <i class="uil uil-database"></i> **Databases** view, select the database you want to restore.
2. Click the <i class="uil uil-ellipsis-h"></i> Actions menu next to the backup you want to restore from, then click **Restore to this DB**. 
3. Select **Restore** to restore the backup of your database.

## Replicate database from backup

Database backups and data replication are complementary components of an effective disaster recovery strategy. 


There are specific situations when it makes sense to create a new database using a backup instead of restoring the data to the original database:

- **When the original database is compromised**: Restoring a backup directly to a compromised DB could reintroduce the same issues. Creating a new database from the backup ensures that the restored data is isolated from the original database, preserving data integrity.

- **When you want to debug a problem**: In a disaster recovery situation, it's essential to understand the root problem that led to the need for recovery. Creating a new database allows you to examine the original database for vulnerabilities or issues before restoring the data. This can help identify weaknesses that need to be addressed.

- **When you want to validate backup data before restore**: By creating a new database, you can test the integrity and consistency of the backup data before making it the primary production data. This validation process ensures that the backup is clean and free from corruption, reducing the risk of propagating issues from the backup to the new database.

- **Before upgrading or patching**: In some cases, a disaster recovery event might coincide with the need to upgrade or patch the database software. Creating a new database allows you to apply the necessary upgrades or patches to the new environment, ensuring that the production environment is up-to-date and secure.

- **To create a safety net for rollbacks**: Restoring the backup directly to the original database leaves little room for rolling back the recovery process if issues are discovered later. Creating a new database provides a safety net, as you can decide whether to promote the new database to the production environment or keep the original one if necessary.

To create a database from backup:

1. In the <i class="uil uil-database"></i> **Databases** view, select the database you want to replicate.
2. Click the <i class="uil uil-ellipsis-h"></i> Actions menu next to the backup you want to replicate from, then click **Create new DB**.
3. Select **Create** to start database provisioning for the DB replica.








