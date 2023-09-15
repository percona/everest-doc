# Backup and restore databases

## Why it’s important to create backups

Databases (DBs) may get damaged due to a variety of reasons, including disk crashes, power outages, software errors, or even virus attacks.  

To ensure that you can recover data in such events, it is critical to back up your databases. With Everest, you can do this with zero downtime and minimal performance impact. 

## Supported setups
Currently,  you can create and restore on-demand backups. Future releases will add Point-in-Time-Recovery and scheduled backup functionality.

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

1. Go to  ![!](../images/settings_icon.png) **Settings > Backup Storages** and check that  you have an available AWS S3-compatible location for storing  backups.
2. Go to the ![!](../images/databases_icon.png) **Databases** view and select the DB which you want to back up.
3. Click **Create backup > Now**. 
4. In the **Create Backup** pop-up, change the default backup name if required, select an available backup location, then click **Create**.

## Restore backup  to a database cluster

To restore a database from a backup:

1. In the ![!](../images/databases_icon.png) **Databases** view, select the database that you want to restore.
2. Click the ![!](../images/actions_icon.png) Actions menu next to the backup you want to restore from, then click **Restore to this DB**.
3. Select **Restore** to restore the backup of your database.

## Replicate database from backup

Database backups and data replication are complementary components of an effective disaster recovery strategy. 

While backups are typically used as a last resort to restore data when the original data becomes unavailable or unusable, replication creates an exact copy of the database to ensure quick failovers in the event of a disaster. 

This means that in a replication setup, if the primary database or system experiences a failure, the secondary replica can seamlessly take over, minimizing downtime and ensuring continuous access to the data and services.

To create a database from backup:

1. In the ![!](../images/databases_icon.png) **Databases** view ,  select the database that you want to replicate.
2. Click the ![!](../images/actions_icon.png)  Actions menu next to the backup you want to replicate from, then click **Create new DB**.
3. Select **Create** to start database provisioning for the DB replica.








