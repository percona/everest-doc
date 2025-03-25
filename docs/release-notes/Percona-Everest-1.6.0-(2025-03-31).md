# What's new in Percona Everest 1.6.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Updates at a glance"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Manual storage scaling](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)|Increase the storage capacity of your S3-compatible storage through manual storage scaling|
    | **2.**|[MongoDB updates](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)||


## Release highlights

=== "Manual Storage scaling"


=== "MongoDB: Major DB upgrades"


## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    GCR is set to be **deprecated**, with its official shutdown scheduled for **March 18, 2025**.

    All Percona Everest versions prior to 1.4.0 depend on images hosted on Google Container Registry (GCR). These images will become unavailable after the shutdown date: **March 18, 2025**.

### Impact of GCR deprecation

Percona Everest versions older than 1.4.0 will cease to function after this date.

### Action required

We strongly recommend upgrading to Percona Everest version 1.4.0 or later as soon as possible. If you do not upgrade, Percona Everest will no longer function.
    
For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


## New features

- [EVEREST-1870](https://perconadev.atlassian.net/browse/EVEREST-1870), [EVEREST-1871](https://perconadev.atlassian.net/browse/EVEREST-1871), [EVEREST-1872](https://perconadev.atlassian.net/browse/EVEREST-1872): Manual storage scaling for MySQL, MongoDB, and PostgreSQL databases respectively.

- [EVEREST-1841](https://perconadev.atlassian.net/browse/EVEREST-1841): DB major version upgrades for MongoDB

- [EVEREST-1841](https://perconadev.atlassian.net/browse/EVEREST-1841) DB major version upgrades for MongoDB

- [EVEREST-1843]: (https://perconadev.atlassian.net/browse/EVEREST-1843) Add support for PG operator v2.6.0

- [EVEREST-1862](https://perconadev.atlassian.net/browse/EVEREST-1862): \[UI\] Topology diagram view.

## Improvements

- [EVEREST-1202](https://perconadev.atlassian.net/browse/EVEREST-1202): Remove focus state after the user clicks out \(table header icons\)

- [EVEREST-1280](https://perconadev.atlassian.net/browse/EVEREST-1280): Move 'storage class' field to advanced configurations step

- [EVEREST-1312](https://perconadev.atlassian.net/browse/EVEREST-1312): Installation log should display the same operator names as selected in the wizard

- [EVEREST-1711](https://perconadev.atlassian.net/browse/EVEREST-1711): Remove final confirmation step from the wizard

- [EVEREST-1921](https://perconadev.atlassian.net/browse/EVEREST-1921): DB version upgrade modal should not allow to select the current version

- [EVEREST-1930](https://perconadev.atlassian.net/browse/EVEREST-1930): Add upgrading state


## Bugs

- [EVEREST-765](https://perconadev.atlassian.net/browse/EVEREST-765): PITR gets disabled after the database is Suspended and Resumed

- [EVEREST-1350](https://perconadev.atlassian.net/browse/EVEREST-1350): Display IP address with netmask same as backend

- [EVEREST-1374](https://perconadev.atlassian.net/browse/EVEREST-1374): Backup storage and monitoring ednpoint name restriction logic is not consistent

- [EVEREST-1625](https://perconadev.atlassian.net/browse/EVEREST-1625): PITR options are not available on UI if there are no schedules

- [EVEREST-1763](https://perconadev.atlassian.net/browse/EVEREST-1763):  Editing the topology from 3 nodes to 1 node does not display any error

- [EVEREST-1798](https://perconadev.atlassian.net/browse/EVEREST-1798): PG cluster initializing again and again \+ backups are failing, for a certain scenario

- [EVEREST-1911](https://perconadev.atlassian.net/browse/EVEREST-1911): Empty state briefly appears before first DB cluster is displayed

- [EVEREST-1920](https://perconadev.atlassian.net/browse/EVEREST-1920): [UI] Custom number of nodes for PG is not visible properly in cluster overview
