# What's new in Percona Everest 0.10.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.10.0 introduces the following changes:


## Release highlights

### Percona Everest upgrade







### Skipping TLS

!!! warning
    It is not recommended to skip TLS. If it is necessary to skip TLS, it should be used with self-signed certificates only.

With the introduction of Percona Everest 0.10.0, it is now possible to skip Transport Layer Security (TLS) while adding backup storage. 

TLS verifies the server's certificate chain and host name, ensuring its authenticity. However, TLS can add overhead to data transmission, especially in high-throughput backup scenarios. Skipping TLS may improve backup performance by reducing this overhead, allowing backups to complete faster.




## New features and improvements

[EVEREST-396](https://perconadev.atlassian.net/browse/EVEREST-396) Allow monitoring instance connection to skip TLS checks

[EVEREST-793](https://perconadev.atlassian.net/browse/EVEREST-793) everestctl upgrade

[EVEREST-895](https://perconadev.atlassian.net/browse/EVEREST-895) Allow backup storage to skip TLS checks, \(like use of minio with self-signed certs\)

[EVEREST-919](https://perconadev.atlassian.net/browse/EVEREST-919) Support backup storages with path-style URL access

[EVEREST-668](https://perconadev.atlassian.net/browse/EVEREST-668) Number Retention copies for backups

[EVEREST-819](https://perconadev.atlassian.net/browse/EVEREST-819) \[UI\] Limit number of PG backup schedules to three

[EVEREST-911](https://perconadev.atlassian.net/browse/EVEREST-911) \[UI\] Add backups info column to main DB view

[EVEREST-912](https://perconadev.atlassian.net/browse/EVEREST-912) \[UI\] Add icon and tooltip to backups column


[EVEREST-928](https://perconadev.atlassian.net/browse/EVEREST-928) \[UI\] Update all buttons to sentence case

[EVEREST-935](https://perconadev.atlassian.net/browse/EVEREST-935) \[UI\] Enable 'cancel' button in the wizard when the user is editing a step

[EVEREST-938](https://perconadev.atlassian.net/browse/EVEREST-938) \[UI\] Add storage name to PITR info alert when restoring

[EVEREST-946](https://perconadev.atlassian.net/browse/EVEREST-946) \[UI\] Add retention copies to 'create backup schedule' dialog

[EVEREST-962](https://perconadev.atlassian.net/browse/EVEREST-962) Bucket name sanitation HD-23050

[EVEREST-964](https://perconadev.atlassian.net/browse/EVEREST-964) Add API rate limiting

## Bugs fixed

[EVEREST-385](https://perconadev.atlassian.net/browse/EVEREST-385) Backup and pods are not deleted if the db cluster is deleted

[EVEREST-846](https://perconadev.atlassian.net/browse/EVEREST-846) New database contains the backups of the old database with the same name

[EVEREST-921](https://perconadev.atlassian.net/browse/EVEREST-921) \[UI\] Login doesn't work immediately after logout

[EVEREST-940](https://perconadev.atlassian.net/browse/EVEREST-940) \[UI\] Documentation link on PITR option for PG opening on the same tab

[EVEREST-947](https://perconadev.atlassian.net/browse/EVEREST-947) everestctl uninstall fails to complete

[EVEREST-948](https://perconadev.atlassian.net/browse/EVEREST-948) Actionable Alert button is not visible in dark theme

[EVEREST-967](https://perconadev.atlassian.net/browse/EVEREST-967) Last Backup information is incorrect
















