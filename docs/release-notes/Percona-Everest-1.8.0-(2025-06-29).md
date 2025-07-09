# What's new in Percona Everest 1.8.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Expand to unleash the key updates"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Dataimporters in Percona Everest](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_1)|Import external backups into Percona Everest clusters|
    | **2.**|[Operator Upgrades](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_4)|Support for PSMDB operator v1.20.1|
    | **6.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#new-features)|Check out the new features introduced in Percona Everest 1.7.0|
    | **7.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.7.0|
    | **8.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#bug-fixes)|Find out about all the bugs fixed in Percona Everest 1.7.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#known-limitation)|Discover all the known limitations in Percona Everest 1.7.0|


## 🌟 Release highlights

=== ":material-database-import: Import external backups into Percona Everest clusters"

    !!! warning
        The external backup import feature in Percona Everest is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and **not in production environments**.

    Starting with Percona Everest 1.8.0, we are excited to roll out a new feature that enables you to directly import database backups from external object storage into clusters managed by Percona Everest. This feature leverages an extensible framework that simplifies your backup process.

    ### Objectives
    This feature can help you achieve the following objectives:

    - Import backup data from external storage such as Amazon S3 directly into Percona Everest-managed database clusters.

    - Support a wide range of backup formats and tools, including both logical and physical backups created using `pg_dump`, `mysqldump`, `mongodump`, and more.

    - Provide a pluggable and extensible framework that can adapt to different import needs and workflows.

    ### How to import external database backups using the Percona Everest UI

    Here are the steps to import the external backups:
    {.power-number}

    1. From the Percona Everest homepage, click **Import**. Select the database type you want to import(MySQL, PostgreSQL, or MongoDB). The **Basic information** page will be displayed.

    2. Fill in the details on the **Basic information** page and click **Continue**. This will take you to the **Import information** page.

    3. On the Import Information page, enter the following:

        - Choose the data importer from the dropdown on the **Import information** page.

        - Provide S3 details.

            ![!image](../images/mongodb_s3_details_importers.png)

        -  Specify the **File Directory** path within your S3 bucket where the backup files are stored. Click **Save**.

            ![!image](../images/importers_mongo_file_path.png)

        -  Enter the key-value pairs and user secrets (For MongoDB and MySQL) in the **DB credentials** section.

            ![!image](../images/importers_mongodb_db_credentials.png)

    4. Enter the information and click **Continue** until you reach the end of the wizard. Your backup import process will now start. You will be notified once the import is successfully completed.

=== ":simple-mongodb: PSMDB operator"
    
    ### Support for PSMDB operator v1.20.1

    Percona Everest 1.8.0 now includes support for PSMDB operator version 1.20.1.


## New Features

- [EVEREST-1908](https://perconadev.atlassian.net/browse/EVEREST-1908): We have added support for PSMDB operator v1.20.1.

- [EVEREST-2068](https://perconadev.atlassian.net/browse/EVEREST-2068): Percona Everest 1.8.0 now enables users to import external PostgreSQL backups into Everest-managed clusters using a streamlined and extensible DataImporter framework.

- [EVEREST-2069](https://perconadev.atlassian.net/browse/EVEREST-2069) Percona Everest 1.8.0 now enables users to import external MySQL backups into Everest-managed clusters using a streamlined and extensible DataImporter framework.

- [EVEREST-2070](https://perconadev.atlassian.net/browse/EVEREST-2070) Everest 1.8.0 now enables users to import external MongoDB backups into Everest-managed clusters using a streamlined and extensible DataImporter framework.


## Improvements

[EVEREST-1806](https://perconadev.atlassian.net/browse/EVEREST-1806) \[UI\] Improve Visibility of Proxy Validation Message for MySQL Database Creation 

[EVEREST-1909](https://perconadev.atlassian.net/browse/EVEREST-1909) Prevent duplicate IP/Netmask entries for external access in DB clusters

[EVEREST-1946](https://perconadev.atlassian.net/browse/EVEREST-1946) Add confirmation dialog before performing disk size update

[EVEREST-1958](https://perconadev.atlassian.net/browse/EVEREST-1958)  \[UI\] Auto-expand sections containing fields with error when revisiting a wizard step

[EVEREST-1964](https://perconadev.atlassian.net/browse/EVEREST-1964) \[UI\] Change label in basic details widget 

[EVEREST-2002](https://perconadev.atlassian.net/browse/EVEREST-2002) \[Helm Upgrade Flow\] Pre-check and validate CRD compatibility before Helm upgrade to prevent cluster breakage

[EVEREST-2003](https://perconadev.atlassian.net/browse/EVEREST-2003) \[UI\] Remove expandable section in DB overview

[EVEREST-2005](https://perconadev.atlassian.net/browse/EVEREST-2005) \[UI\] Add 'view details' in the actions menu


## Bug Fixes

- [EVEREST-1838](https://perconadev.atlassian.net/browse/EVEREST-1838) The 'Edit' option for PITR is disabled for MySQL and MongoDB clusters, even when PITR is enabled.


- [EVEREST-1890](https://perconadev.atlassian.net/browse/EVEREST-1890) \[UI\] Number of Proxies changes from 'X' to '1' while creating a mysql db cluster

- [EVEREST-1895](https://perconadev.atlassian.net/browse/EVEREST-1895) \[UI\] PITR time can't be changed from the last successful backup

- [EVEREST-1948](https://perconadev.atlassian.net/browse/EVEREST-1948) \[UI\] Component Age isn't displayed properly

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961) \[BE\] Edit monitoring instance does not work

- [EVEREST-2001](https://perconadev.atlassian.net/browse/EVEREST-2001) \[UI\] Resource edit fields \(Disk, CPU, Memory\) behaves inconsistently and becomes difficult to edit when a large value is entered

- [EVEREST-2030](https://perconadev.atlassian.net/browse/EVEREST-2030) \[UI\] User not logged out after deletion - UI stays active even though API token is invalidated

- [EVEREST-2037](https://perconadev.atlassian.net/browse/EVEREST-2037) \[UI\] Policy is being used message is displayed when it is not associated with any db


- [EVEREST-2043](https://perconadev.atlassian.net/browse/EVEREST-2043) \[CLI\] setting pmm.enabled=true results in PMM getting deployed in the \`default\` namespace

- [EVEREST-2052](https://perconadev.atlassian.net/browse/EVEREST-2052) PMM client getting OOM killed


## Known limitation

When integrating Microsoft Entra ID as your OIDC provider for Percona Everest, it's essential to ensure that the access tokens issued are compatible with Percona Everest's token validation logic.

📘 For detailed information, see our [documentation](https://docs.percona.com/everest/reference/known_limitations.html#oidc-integration-with-microsoft-entra).

## 🚀 Upgrade now

Upgrade to **Percona Everest 1.7.0** to access these new features and improvements. 

📘 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.
