# What's new in Percona Everest 0.7.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source private database-as-a-service that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.7.0 introduces the following changes:

## Beta release

We're excited to announce that Percona Everest is now in Beta!

Under development for the past five months and in testing since October 2023, we’re now taking Percona Everest public, making it open for anyone who wants to explore our Cloud Native database platform.

## Point-in-Time Recovery (PITR) for MongoDB databases

We're expanding Percona Everest's PITR capabilities to include MongoDB databases.

You can now also restore MongoDB databases to specific points in time within the same cluster. This gives you more control over your MongoDB environments and more options for data recovery.

Future releases will cover PITR support for PostgreSQL databases and PITR restores to different clusters.

![Alt text](../images/PITR_Mongo.png)


Known issue
After restoring a MongoDB database, PITR does not resume automatically. 

After restoring a MongoDB database from a point in time, PITR requires a full backup to resume after a restore.