# What's new in Percona Everest 0.10.1

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.10.1 introduces the following changes:


## Fixed issues

### Retention copies

- [EVEREST-1054](https://perconadev.atlassian.net/browse/EVEREST-1054) - Rentention copies did not work While setting up a PostgreSQL database cluster, we encountered an issue using the minIO bucket for backups and restores. This problem caused the restored cluster to become unresponsive and enter an unknown state. The issue has been resolved now.

- [EVEREST-979](https://perconadev.atlassian.net/browse/EVEREST-979) - When the retention copies are specified in a backup schedule, the Everest operator successfully deleted the backup objects from Kubernetes. However, it failed to clean up the data on S3. The issue has been resolved at this time.

### Backups

- [EVEREST-1061](https://perconadev.atlassian.net/browse/EVEREST-1061) - We fixed a race condition in the Everest operator where backups deleted due to retention policies were re-created. We fixed the issue and ensured that completed backups were not reconciled.
- [EVEREST-1064](https://perconadev.atlassian.net/browse/EVEREST-1064) - While configuring a backup schedule for the MongoDB cluster, duplicate backups of the same data were generated in S3, whereas only a single backup was produced in Everest. The issue has been resolved now.

### Restores

- [EVEREST-1082](https://perconadev.atlassian.net/browse/EVEREST-1082) - Attempting to restore a MongoDB backup to a new database failed if the backup storage used a self-signed certificate. This issue has been resolved now.


## Known limitations

Backups for PostgreSQL do not work with GCP S3 compatible API.

















