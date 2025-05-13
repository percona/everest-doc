# On-demand and scheduled backups

Initiate an immediate backup for hands-on control, or schedule one if you prefer the automated reliability of scheduled backups.

## Create on-demand backups

On-demand backups give you immediate control over when and what data to back up. One-time backups can be particularly useful when you need to safeguard critical information before making significant changes to your database.

!!! info "Important"
    There are few limitations to consider when working with PostgreSQL's on-demand backups. For detailed information, refer to the [limitations](../../reference/known_limitations.md#postgresql-limitations-for-on-demand-backups) section.

To create a backup now:
{.power-number}

1. Go to <i class="uil uil-cog"></i>  **Settings > Backup Storages** and check that you have an available S3-compatible location for storing backups. Otherwise, [create a backup location](../createBackups/backup_storage/CreateStorage.md) so Everest can store backup artifacts for the database.
2. Go to the <i class="uil uil-database"></i> **Databases** view and select the database which you want to back up.
3. Navigate to the **Backups** tab and click **Create backup > Now**.
4. In the **Create Backup** pop-up, change the default backup name if required, select an available backup location, and then click **Create**.

## Schedule a backup

Schedule a backup when you want your backups to occur automatically at predetermined intervals. This automation reduces the risk of human error and ensures that your data is consistently backed up without requiring your constant intervention.

!!! info "Important"
    There are few limitations to consider when working with PostgreSQL's scheduled backups. For detailed information, refer to the [limitations](../../reference/known_limitations.md#postgresql-limitations-for-schedules) section.

To configure a backup schedule:
{.power-number}

1. Go to <i class="uil uil-cog"></i>  **Settings > Backup Storages** and check that you have an available AWS S3-compatible location for storing backups. Otherwise, [create a backup location](../createBackups/backup_storage/CreateStorage.md) so Everest can store backup artifacts for the database.
2. Go to the <i class="uil uil-database"></i> **Databases** view and select the database which you want to back up.
3. Navigate to the **Backups** tab and click **Create backup > Schedule**.
4. Change the default backup name if required, and configure the frequency and start time for the backups.

    !!! note alert alert-primary "Important"
        Make sure that the schedule you specify here does not create overlapping jobs or overhead on the production environment. Also, check that your specified schedule does not overlap with production hours.

5. Click **Create**. All scheduled backups for the current DB will be listed at the top so you can review the schedules that are currently generating backup artifacts.

### Edit a scheduled backup

To edit a schedule that is currently generating backup artifacts:
{.power-number}

1. Go to the <i class="uil uil-database"></i> **Databases** view and select the DB for which backups have been scheduled.  
2. Select the **Backups** tab and expand the Schedule box.
3. Select the schedule you want to update, click the ellipsis <i class="uil uil-ellipsis-h"></i> and select **Edit**.
4. Update the schedule and click **Save**.

## Next step
[Enable PITR :material-arrow-right:](../createBackups/EnablePITR.md){.md-button}
[Restore backups :material-arrow-right:](../RestoreBackup.md){.md-button}