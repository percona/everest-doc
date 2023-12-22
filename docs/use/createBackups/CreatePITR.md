

# Point-in-Time Recovery (PITR) backups
PITR maintains versions of your databases from past timestamps, serving as a safeguard against data loss during various disasters, including database crashes, accidental data deletions, table drops, or unintended updates to multiple fields instead of a single one. For example, in the case of a developer pushing the incorrect data, PITR can seamlessly recover the data to a point in time in the past before this data was incorrecly added. 

Restores databases up to a specific moment in time involves retrieving data from a backup snapshot and replaying all subsequent events that occurred until a specified moment using oplog slices.

## How does it work?

When point-in-time recovery (PITR) is enabled and a backup schedule or an on-demand or schedule backup is started, Everest starts saving consecutive slices of the oplog pericodically.

You can restore a database from these PITR oplogs, as soon as the backup artifact from these backup is available. 

Since Everest saves oplog slices and streams them into your storage between scheduled task runs, scheduling frequent PITR backups is not necessary. You can use the available oplog slices in your storage to restore a backup to any moment between snapshots.

## Supported scenarios

Currently, PITR is only available for MySQL databases. Future releases will enable this functionality for MongoDB and PostgreSQL databases as well.

## Create a PITR backup

Before creating a backup, make sure to check the  backup prerequisites.

To configure a backup schedule:
{.power-number}

1. Go to <i class="uil uil-cog"></i>  **Settings > Backup Storages** and check that you have an available AWS S3-compatible location for storing backups. Otherwise, [create a backup location](../use/CreateBackup.md) so Everest can store backup artifacts for the database.
2. Go to the <i class="uil uil-database"></i> **Databases** view and select the database which you want to back up.
3. Click **Create backup > Schedule**.
4. Change the default backup name if required, and configure the frequency and start time for the backups.

    !!! note alert alert-primary "Important"
        Make sure that the schedule you specify here does not create overlapping jobs or overhead on the production environment. Also, check that your specified schedule does not overlap with production hours.

5. Click **Create**. All scheduled backups for the current DB will be listed at the top so you can review the schedules that are currently generating backup artifacts.
