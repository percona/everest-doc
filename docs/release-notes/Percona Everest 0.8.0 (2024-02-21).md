# What's new in Percona Everest 0.8.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.8.0 introduces the following changes:

## Beta release

We're excited to announce that Percona Everest is now in Beta!

Under development for the past six months and in testing since October 2023, we're now taking Percona Everest public, making it open for anyone who wants to explore our Cloud Native database platform.

Be an early adopter and join us in driving its progress!

## Release highlights

### Multiple namespaces

Starting with Percona Everest 0.8.0, we have introduced a new feature called **Multiple namespaces**. With this feature, you can create separate groups of resources within a single cluster. Namespaces enable you to partition your clusters logically, organizing and managing the resources effectively without impacting other resources in the same cluster.

To view the list of configured namespaces, navigate to <i class="uil uil-cog"></i> **Settings > Namespaces** on the Percona Everest UI.

    ![!image](../images/everest_multinamespaces.png)

To gain a deeper understanding of this feature, refer to our comprehensive [documentation](https://docs.percona.com/everest/use/multi-namespaces.html).

### Support for scheduled backups for PostgreSQL

We’re expanding Percona Everest’s schedule backup functionality to include PostgreSQL databases. This enables you to run automatic backups at predefined times for PostgreSQL as well.

    ![!image](../images/PostreSQL_Backups.png)

However, due to a limitation on PostgreSQL Operator, scheduling is currently restricted to a maximum of three concurrent backups for PostgreSQL databases.

## New features and improvements

- [EVEREST-509](https://perconadev.atlassian.net/browse/EVEREST-509) - We've completed support for Scheduled Backups functionality, extending automated backup capabilities to PostgreSQL databases as well.

- [EVEREST-821](https://perconadev.atlassian.net/browse/EVEREST-821) - We've added a copy button next to the **Host** string on the **Connection Details** panel to enable you to copy the host string easily.

- [EVEREST-748](https://perconadev.atlassian.net/browse/EVEREST-748) - The PostgreSQL operator has been upgraded to version 2.3.1.

## Bugs fixed

- [EVEREST-802](https://perconadev.atlassian.net/browse/EVEREST-802) - When editing a MongoDB database, the **Storage location** field on the **Backups** page is now disabled to prevent changes to the current location. This limitation stems from a restriction in Everest, which currently restricts MongoDB databases to utilizing a single storage location for backups.
- [EVEREST-814](https://perconadev.atlassian.net/browse/EVEREST-814) - While reinstalling Percona Everest, no login token was displayed. To log in to Percona Everest, the token from the previous installation had to be used. Now, the uninstall command removes the token as well, so a new token is generated in a subsequent installation.
- [EVEREST-827](https://perconadev.atlassian.net/browse/EVEREST-827) - When trying to set up a fourth scheduled backup for PostgreSQL databases, Everest now notifies that initiating another backup is not possible when three backup schedules are already in place. This restriction is due to a current limitation in the PostgreSQL Operator, which allows a maximum of three concurrent backups to be scheduled for PostgreSQL databases.
- [EVEREST-822](https://perconadev.atlassian.net/browse/EVEREST-822) - Fixed an issue that sometimes occurred when restoring a Postgresql database from a backup.
- [EVEREST-826](https://perconadev.atlassian.net/browse/EVEREST-826)  - When initiating an on-demand backup for PostgreSQL databases, Everest would incorrectly perform incremental backups instead of conducting a full backup. This issue is now fixed.
- [EVEREST-833](https://perconadev.atlassian.net/browse/EVEREST-833) - When creating a new database from a backup, Everest now pre-fills the database version inherited from the backup artifact, ensuring consistency and compatibility throughout deployments.
- [EVEREST-854](https://perconadev.atlassian.net/browse/EVEREST-854) - Fixed an issue where the default number of nodes on the **Resources** page for MySQL showed up as 1 instead of 3. 

## Known issues

- [EVEREST-819](https://perconadev.atlassian.net/browse/EVEREST-819) - Due to a limitation on PostgreSQL Operator, scheduling backups for PostgreSQL databases is currently restricted to a maximum of three concurrent backups.
- [EVEREST-820](https://perconadev.atlassian.net/browse/EVEREST-820) - When performing a MongoDB database restore from a Point-in-Time (PITR), the displayed time in the UI does not align with the actual PITR creation time due to discrepancies between the PITR chunk creation time and the time at which chunks are uploaded to the S3 storage location.