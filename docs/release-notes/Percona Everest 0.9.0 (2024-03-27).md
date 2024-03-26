# What's new in Percona Everest 0.9.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.9.0 introduces the following changes:


## Release highlights

We've taken a step forward in enhancing Percona Everest's point-in-time (PITR) capabilities for PostgreSQL, MySQL as well as MongoDB databases. 

You can now restore your databases to specific points in time within the same cluster as well as a new cluster. This gives you more control over your database environments and more options for data recovery.

## New features and improvements

### Point-in-time recovery for PostgreSQL databases

- [EVEREST-598](https://perconadev.atlassian.net/browse/EVEREST-598) - We have now added support for Point-In-Time Recovery (PITR) functionality for PostgreSQL databases.

- [EVEREST-624](https://perconadev.atlassian.net/browse/EVEREST-624) - We have added a message on the Percona Everest UI for PostgreSQL informing users that Point-in-time recovery (PITR) is enabled by default and cannot be turned off.

- [EVEREST-619](https://perconadev.atlassian.net/browse/EVEREST-619) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your PostgreSQL databases.

- [EVEREST-896](https://perconadev.atlassian.net/browse/EVEREST-896) - We have added a warning on the Percona Everest UI to inform users about the limitations of PostgreSQL for PITR. 

### Point-in-time recovery for MySQL databases

- [EVEREST-618](https://perconadev.atlassian.net/browse/EVEREST-618) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your MySQL databases.

### Point-in-time recovery for MongoDB databases

- [EVEREST-620](https://perconadev.atlassian.net/browse/EVEREST-620) - Starting with Percona Everest 0.9.0, you can now create a new database using point-in-time recovery for your MongoDB databases.


## Bugs fixed


- [EVEREST-656](https://perconadev.atlassian.net/browse/EVEREST-656) - Previously, while initiating a backup for MongoDB, the backup status was being displayed as unknown. The issue has been resolved now.

- [EVEREST-759](https://perconadev.atlassian.net/browse/EVEREST-759) - We have added an error message to the Percona Everest UI for scheduled backups, which reminds you to set a backup storage location before configuring backup schedules to avoid any hassles.

- [EVEREST-786](https://perconadev.atlassian.net/browse/EVEREST-786) - Fixed an issue where the PMM monitoring URL was accepting incorrect credentials.

- [EVEREST-813](https://perconadev.atlassian.net/browse/EVEREST-813) - When choosing the appropriate cluster size (small, medium, large) on the **Resources** page, the selector invariably switched to the **Custom** option. The issue has been resolved now.

- [EVEREST-856](https://perconadev.atlassian.net/browse/EVEREST-856) - When editing a database with multiple backup schedules, an error was thrown. The issue has been reolved now.

- [EVEREST-862](https://perconadev.atlassian.net/browse/EVEREST-862) - Column hide/unhide option not working as expected on different UI pages

- [EVEREST-883](https://perconadev.atlassian.net/browse/EVEREST-883) - PITR for PostgresSQL cannot be toggled to enabled/turned off as a limitation. We have added a message to inform the users about this.

- [EVEREST-885](https://perconadev.atlassian.net/browse/EVEREST-885) Quick install script doesn't work on linux arm

- [EVEREST-886](https://perconadev.atlassian.net/browse/EVEREST-886) Postgresql database could not be restored using PITR

- [EVEREST-887](https://perconadev.atlassian.net/browse/EVEREST-887) \[UI\] Storage location can't be chosen if scheduled backups are enabled for the first time in edit of mongodb

- [EVEREST-888](https://perconadev.atlassian.net/browse/EVEREST-888) \[UI\] Backup Storage does not have a value in manual backup

- [EVEREST-890](https://perconadev.atlassian.net/browse/EVEREST-890) Restore to a new mysql database fails with PITR

- [EVEREST-913](https://perconadev.atlassian.net/browse/EVEREST-913) \[operator\] HAProxy replicas service using incorrect LB in EKS

- [EVEREST-914](https://perconadev.atlassian.net/browse/EVEREST-914) \[operator\] PMM monioring missing k8s\_cluster\_id label







