# Point-in-time recovery (PITR) backups

PITR maintains versions of your database from past timestamps, serving as a safeguard against data loss during various disasters, including database crashes, accidental data deletions, table drops, or unintended updates to multiple fields instead of a single one.

PITR complements on-demand and scheduled backup strategies by providing finer backup granularity with more specific recovery points for restoring data to the same cluster.


## How it works

Restoring databases up to a specific moment in time involves retrieving data from a backup snapshot and replaying all subsequent events that occurred until a specified moment using log slices.

When PITR and backups are enabled (either on-demand or scheduled), Percona Everest starts capturing successive database logs at predefined intervals. As soon as the initial full backup is available, Everest can start restoring the database from these PITR logs.

Since Everest saves logs and streams them into your storage between scheduled task runs, scheduling frequent backups is not necessary. You can use the available logs in your storage to restore a backup to any moment between snapshots.

## PITR upload intervals

By default, Everest uploads PITR logs every minute for MySQL databases and every ten minutes for MongoDB databases. If you wish to adjust these default intervals, you can easily do so through the Everest API.

## Enable Point-in-time recovery

### Prerequisites

Before enabling PITR, go to <i class="uil uil-cog"></i> **Settings > Backup Storages** and check that you have an available S3-compatible location for storing backups. Otherwise, [create a backup location](../CreateStorage.md) so Everest can store PITR artifacts for the database.

To enable PITR:
{.power-number}

=== "When creating a new database"


    1. On the Everest homepage, click **Create Database** to display the database creation wizard.
    2. Fill in the details of your database on the first steps of the wizard.
    3. Navigate to the **Backups** page, and make sure to enable and configure a backup schedule. 
    4. Click **Next** to go to the **Point-in-time recovery (PITR)** page where you can enable PITR and specify a location for storing the PITR backups and logs. 
    5. Complete the setup wizard to create the new database with PITR enabled. 

=== "When editing an existing database"

    1. In the <i class="uil uil-database"></i> **Databases** view, select the database for which you want to enable PITR. The **Overview** tab will be displayed.
    2. Navigate to **Backups & PITR > Point-in-time Recovery (PITR)** widget.
    3. Click **Edit**. The **Edit PITR** pop-up will be displayed.
    4. Toggle the switch on or off based on whether you want to enable or disable PITR. Click **Save**.


## Limitations

There are some limitations associated with the PITR functionality. For a comprehensive list of known limitations, see the [known Limitations](../../reference/known_limitations.md#point-in-time-recovery-pitr) section.

## Next step

[Restore backups :material-arrow-right:](../RestoreBackup.md){.md-button}