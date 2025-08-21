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

- [EVEREST-1521](https://perconadev.atlassian.net/browse/EVEREST-1521) Network configuration changes

- [EVEREST-548](https://perconadev.atlassian.net/browse/EVEREST-548) Customize service annotations

## Improvements

- [EVEREST-2002](https://perconadev.atlassian.net/browse/EVEREST-2002) \[Helm Upgrade Flow\] Pre-check and validate CRD compatibility before Helm upgrade to prevent cluster breakage

- [EVEREST-2101](https://perconadev.atlassian.net/browse/EVEREST-2101) \[UI\] Limit "Add New" button functionality on External Access to prevent blank fields

- [EVEREST-2114](https://perconadev.atlassian.net/browse/EVEREST-2114) \[UI\] Move table actions to the left when disabled

- [EVEREST-2165](https://perconadev.atlassian.net/browse/EVEREST-2165) \[UI\] Add "show password" toggle in PMM monitoring endpoint form

## Bug fixes

- [EVEREST-1012](https://perconadev.atlassian.net/browse/EVEREST-1012) Creating a new postgresql database using backup has no restore information

- [EVEREST-1865](https://perconadev.atlassian.net/browse/EVEREST-1865) \[UI\] PITR edit info not available for PG db cluster

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961) \[BE\] Edit monitoring instance does not work

- [EVEREST-2017](https://perconadev.atlassian.net/browse/EVEREST-2017) Restore to a new PXC cluster is failing when using MinIO storage

- [EVEREST-2031](https://perconadev.atlassian.net/browse/EVEREST-2031) \[UI\] Create policy page becomes bigger when displaying an error message

- [EVEREST-2092](https://perconadev.atlassian.net/browse/EVEREST-2092) Failed to upgrade to 1.7.0 if first installation was older than 1.4.0

- [EVEREST-2097](https://perconadev.atlassian.net/browse/EVEREST-2097) \[UI\] Topology Diagram View - Misaligned text in DB cluster component cards \(Restart info appears outside the box\)

- [EVEREST-2105](https://perconadev.atlassian.net/browse/EVEREST-2105) \[UI\] Creating a db from backup does not display an error on Basic Information page if the original db name has a long name

- [EVEREST-2109](https://perconadev.atlassian.net/browse/EVEREST-2109) PITR remains disabled for PostgreSQL DB cluster after creating on-demand or scheduled backups

- [EVEREST-2135](https://perconadev.atlassian.net/browse/EVEREST-2135) \[Data Importer\] S3 field accepts invalid formats and Verify TLS is unchecked by default

- [EVEREST-2142](https://perconadev.atlassian.net/browse/EVEREST-2142) \[UI\] DB Credentials Not Auto-Updated After Creation \(PostgreSQL\)

- [EVEREST-2148](https://perconadev.atlassian.net/browse/EVEREST-2148) \[operator\] can't create a DB from a backup if the users secret of the original DB doesn't follow the naming convention

- [EVEREST-2150](https://perconadev.atlassian.net/browse/EVEREST-2150) \[RBAC\] 'Restore from a backup' option is visible and functional even with read-only permissions for DB clusters

- [EVEREST-2153](https://perconadev.atlassian.net/browse/EVEREST-2153) Import secrets do not get deleted if database is deleted during import

- [EVEREST-2191](https://perconadev.atlassian.net/browse/EVEREST-2191) \[UI\] Active schedules and Create backup button are displayed on the left side

- [EVEREST-2202](https://perconadev.atlassian.net/browse/EVEREST-2202) Import fails when the instance name is more than 16 characters

- [EVEREST-2206](https://perconadev.atlassian.net/browse/EVEREST-2206) SSO is disabled as soon as we upgrade from 1.6.0 to 1.7.0

- [EVEREST-2207](https://perconadev.atlassian.net/browse/EVEREST-2207) Strange behaviour noted while upgrading Everest.

- [EVEREST-2211](https://perconadev.atlassian.net/browse/EVEREST-2211) Postgresql database doesn't come up and crashes after PITR

- [EVEREST-2212](https://perconadev.atlassian.net/browse/EVEREST-2212) PMM-Client request a lot of memory when enabling the monitoring for any instance.

- [EVEREST-2214](https://perconadev.atlassian.net/browse/EVEREST-2214) everestctl upgrade error

- [EVEREST-2158](https://perconadev.atlassian.net/browse/EVEREST-2158) \[UI\] \[RBAC\] 'Restore from a backup' option is visible and functional even with read-only permissions for DB clusters

- [EVEREST-2159](https://perconadev.atlassian.net/browse/EVEREST-2159) \[BE\] \[RBAC\] 'Restore from a backup' option is visible and functional even with read-only permissions for DB clusters


## 🚀 Ready to Upgrade?

Upgrade to **Percona Everest 1.9.0** to access these new features and improvements.

📖 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.