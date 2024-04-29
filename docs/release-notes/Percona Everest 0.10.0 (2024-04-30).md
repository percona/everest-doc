# What's new in Percona Everest 0.10.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.10.0 introduces the following changes:


## Release highlights

### Percona Everest upgrade

!!! important
     - You need to download CLI version >=0.10.0 for the upgrade command to work. You can only upgrade to one version at a time. For instance, you can upgrade from version 0.9.0 to version 0.10.0, but not directly from version 0.8 to version 0.10. 

We're thrilled to announce that you can now upgrade your Percona Everest instance using our new Command Line Interface (CLI). The CLI upgrade process is simple and straightforward, enabling you to quickly upgrade your database to the latest version.

For more information on upgrading Percona Everest, see our [documentation](https://docs.percona.com/everest/upgrade_with_cli.html).


### API rate limiting

Starting with Percona Everest 0.10.0 version, we have introduced a new feature called **API rate limiting**. 

API rate limiting is one of the key aspects of managing API's. With this you can set a threshold for the number of requests your API can receive within a specific period. This means you can take control and regulate the incoming traffic, mitigating the risk of server overload or abuse. 

The default rate limit for Percona Everest is 100 requests per second. However, you can customize these limits according to your usage patterns and requirements. To dive deep into this feature, see our comprehensive [documentation](https://docs.percona.com/everest/use/API_rate_limit.html)


### Skipping TLS certificate validation

With the release of Percona Everest 0.10.0, you can add backup storage without verifying the Transport Layer Security (TLS) certificate. TLS certificate verifies the server's certificate chain and hostname, ensuring its authenticity.

Skipping the TLS certificate validation is necessary when using a self-signed certificate because the certificate validation of TLS fails when using a self-signed certificate, as it hasn't been issued by a trusted authority. You can skip TLS certificate validation when there is no need to ensure the authenticity of the server holding the certificate. For instance, if you have a private network with complete control over everything within it, this identity check may not be needed.


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
















