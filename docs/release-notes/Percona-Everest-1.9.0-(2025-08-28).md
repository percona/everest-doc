# What's new in Percona Everest 1.9.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "Expand to unleash the key updates"

    ## 📋 Release summary

    |**#**|**Category**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Release highlight: Dataimporters in Percona Everest](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#import-external-backups-into-percona-everest-clusters)|Import external database backups directly into clusters managed by Percona Everest|
    | **2.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#new-features)|Check out the new features introduced in Percona Everest 1.9.0|
    | **3.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.8.0|
    | **4.**|[Bug fixes](Percona-Everest-1.8.0-%282025-07-16%29.html#bug-fixes)|Find out about all the bugs fixed in Percona Everest 1.9.0|
    | **5.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.9.0|


## 🌟 Release highlights

### 🌐 Load Balancer configuration in Percona Everest


## New features


- [EVEREST-548](https://perconadev.atlassian.net/browse/EVEREST-548): Starting with Percona Everest 1.9.0, we have added support for managing `LoadBalancerConfigs`, which simplifies how service annotations are applied to database clusters.

## Improvements

- [EVEREST-2002](https://perconadev.atlassian.net/browse/EVEREST-2002): Percona Everest now includes a pre-check mechanism to validate the compatibility of **Custom Resource Definitions (CRDs)** before upgrading. This enhancement helps prevent upgrade failures due to CRD mismatches, ensuring a smoother upgrade process.

- [EVEREST-2101](https://perconadev.atlassian.net/browse/EVEREST-2101): The behavior of the **Add New** button in the **External Access** section has been improved. Now, you can only add a new field after filling in the previously created field with a value.

    This enhancement ensures users complete the required information before adding more entries, reducing unnecessary blank fields and improving the overall user experience.

- [EVEREST-2114](https://perconadev.atlassian.net/browse/EVEREST-2114): The search and filter options now always remain visible on the left side, ensuring a consistent layout and easier navigation.

- [EVEREST-2165](https://perconadev.atlassian.net/browse/EVEREST-2165): We have added a s**how password** toggle in the **PMM monitoring endpoint** form. This feature helps us verify if we have entered the correct password.



## Bug fixes

- [EVEREST-1012](https://perconadev.atlassian.net/browse/EVEREST-1012): When creating a new PostgreSQL database using Point-in-Time Recovery (PITR), the restore page previously displayed no information after the database was restored. This issue has been resolved, and the restore page now correctly shows the restore details

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961): We have fixed an issue that allowed users to enter invalid monitoring endpoint URLs when editing a monitoring instance, due to a lack of proper validation. This caused databases (MySQL, MongoDB, and PostgreSQL) with scheduled backups and Point-in-Time Recovery (PITR) enabled to restart unexpectedly. Also, it failed to verify the username and password, even for valid URLs.

- [EVEREST-2017](https://perconadev.atlassian.net/browse/EVEREST-2017): Previously, restoring a backup from one cluster to a new cluster using MinIO storage with Percona XtraDB Cluster (PXC) failed. This issue has been fixed. Backups stored in MinIO can now be successfully restored to new clusters.

- [EVEREST-2031](https://perconadev.atlassian.net/browse/EVEREST-2031): The **Create Policy** page previously expanded when an error message was shown. We've resolved the issue now, and it displays errors without affecting the page layout.

- [EVEREST-2092](https://perconadev.atlassian.net/browse/EVEREST-2092): Upgrades using `everestctl` failed when the initial installation was older than version 1.4.0 and had been successively upgraded to version 1.7.0. The issue has now been resolved.


- [EVEREST-2097](https://perconadev.atlassian.net/browse/EVEREST-2097): In the **Topology Diagram** view, the restart information on database cluster cards was misaligned and appeared outside the component card, disrupting the visual layout. This issue has been resolved, and the information now displays correctly within the card.

- [EVEREST-2105](https://perconadev.atlassian.net/browse/EVEREST-2105): When creating a database from a backup, if the original database name was too long, no error message was displayed on the Basic Information page. Now, a clear message will appear on the Basic Information page if the name exceeds the allowed length.

- [EVEREST-2142](https://perconadev.atlassian.net/browse/EVEREST-2142): When creating a PostgreSQL database, the **Host** field was updating automatically, but the **Username**, **Password**, and **Connection URL** fields remained empty until the page was manually refreshed. This issue has now been resolved, and all connection details automatically populate once the database is created.

- [EVEREST-2148](https://perconadev.atlassian.net/browse/EVEREST-2148) \[operator\] can't create a DB from a backup if the users secret of the original DB doesn't follow the naming convention

- [EVEREST-2153](https://perconadev.atlassian.net/browse/EVEREST-2153) Import secrets do not get deleted if database is deleted during import

- [EVEREST-2202](https://perconadev.atlassian.net/browse/EVEREST-2202) Import fails when the instance name is more than 16 characters

- [EVEREST-2206](https://perconadev.atlassian.net/browse/EVEREST-2206) SSO is disabled as soon as we upgrade from 1.6.0 to 1.7.0

- [EVEREST-2207](https://perconadev.atlassian.net/browse/EVEREST-2207) Strange behaviour noted while upgrading Everest.

- [EVEREST-2211](https://perconadev.atlassian.net/browse/EVEREST-2211) Postgresql database doesn't come up and crashes after PITR

- [EVEREST-2212](https://perconadev.atlassian.net/browse/EVEREST-2212) PMM-Client request a lot of memory when enabling the monitoring for any instance.

- [EVEREST-2214](https://perconadev.atlassian.net/browse/EVEREST-2214) everestctl upgrade error

- [EVEREST-2216](https://perconadev.atlassian.net/browse/EVEREST-2216) [UI] Pod Scheduling Policy field resets to enabled after clicking Continue or Previous

- [EVEREST-2100](https://perconadev.atlassian.net/browse/EVEREST-2100) [UI] Save button disabled with no error when editing cluster with duplicate IP/Netmask after Everest upgrade

- [EVEREST-2096](https://perconadev.atlassian.net/browse/EVEREST-2096) Multiple issues with External Access field behavior, validation, and usability during cluster creation and editing



## 🚀 Ready to Upgrade?

Upgrade to **Percona Everest 1.9.0** to access these new features and improvements.

📖 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.