# What's new in Percona Everest 0.9.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.9.0 introduces the following changes:


## Release highlights

We've taken a step forward in enhancing Percona Everest's point-in-time (PITR) capabilities for PostgreSQL, MySQL as well as MongoDB databases. 

You can now restore your databases to specific points in time within the same cluster as well as a new cluster. This gives you more control over your database environments and more options for data recovery.

## New features and improvements

- [EVEREST-618](https://perconadev.atlassian.net/browse/EVEREST-618) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your MySQL databases.

- [EVEREST-620](https://perconadev.atlassian.net/browse/EVEREST-620) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your MongoDB databases.

### Point-in-time recovery for PostgreSQL databases

- [EVEREST-598](https://perconadev.atlassian.net/browse/EVEREST-598) - We have now added support for Point-In-Time Recovery (PITR) functionality for PostgreSQL databases.

- [EVEREST-624](https://perconadev.atlassian.net/browse/EVEREST-624) - We have added a message on the Percona Everest UI for PostgreSQL informing users that Point-in-time recovery (PITR) is enabled by default and cannot be turned off.

- [EVEREST-619](https://perconadev.atlassian.net/browse/EVEREST-619) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your PostgreSQL databases.

- [EVEREST-896](https://perconadev.atlassian.net/browse/EVEREST-896) - We have added a warning on the Percona Everest UI to inform users about the limitations of PostgreSQL for PITR. 


## Bugs fixed


- [EVEREST-656](https://perconadev.atlassian.net/browse/EVEREST-656) - While initiating a backup for MongoDB, the backup status was being displayed as unknown. The issue has been resolved now.

- [EVEREST-759](https://perconadev.atlassian.net/browse/EVEREST-759) - We have added an error message to the Percona Everest UI for scheduled backups, which reminds you to set a backup storage location before configuring backup schedules to avoid any hassles.

- [EVEREST-786](https://perconadev.atlassian.net/browse/EVEREST-786) - Fixed an issue where the PMM monitoring URL was accepting incorrect credentials.

- [EVEREST-813](https://perconadev.atlassian.net/browse/EVEREST-813) - When choosing the appropriate cluster size (small, medium, large) on the **Resources** page, the selector invariably switched to the **Custom** option. The issue has been resolved now.

- [EVEREST-856](https://perconadev.atlassian.net/browse/EVEREST-856) - When editing a database with multiple backup schedules, an error was thrown. The issue has been reolved now.

- [EVEREST-862](https://perconadev.atlassian.net/browse/EVEREST-862) - We resolved an issue where the column hide/unhide option was not functioning correctly on various UI pages.

- [EVEREST-883](https://perconadev.atlassian.net/browse/EVEREST-883) - PITR for PostgresSQL cannot be toggled to enabled/turned off as a limitation. We have added a message to inform the users about this.

- [EVEREST-885](https://perconadev.atlassian.net/browse/EVEREST-885) - Fixed an issue where the Quick install script did not work on linux arm.

- [EVEREST-887](https://perconadev.atlassian.net/browse/EVEREST-887) - Storage location could not be chosen if scheduled backups were enabled for the first time while editing a MongoDB database.

- [EVEREST-888](https://perconadev.atlassian.net/browse/EVEREST-888) - When creating a backup, the Backup storage field was not automatically populated as it was for scheduled backups. We have resolved this issue now.

- [EVEREST-890](https://perconadev.atlassian.net/browse/EVEREST-890) - We have fixed an issue that was causing problems with restoring data to a new MySQL database using point-in-time recovery (PITR).

- [EVEREST-913](https://perconadev.atlassian.net/browse/EVEREST-913) \[operator\] HAProxy replicas service using incorrect LB in EKS

- [EVEREST-914](https://perconadev.atlassian.net/browse/EVEREST-914) - In the PMM dashboard, you can now select a cluster ID among multiple monitored k8s clusters. Previously, VMAgent did not have such labels and hence was absent from PMM.







