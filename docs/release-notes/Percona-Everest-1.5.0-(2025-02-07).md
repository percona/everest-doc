# What's new in Percona Everest 1.5.0

!!! warning
    Google Container Registry (GCR) is scheduled to be deprecated and will officially shut down on March 18, 2025. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date. We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible. If you do not upgrade, Percona Everest will no longer function.

    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Affinity](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_1)||
    | **2.**|[Operators support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_4)|Support for [Percona Operator for MongoDB v1.18.0](https://docs.percona.com/percona-operator-for-mongodb/RN/Kubernetes-Operator-for-PSMONGODB-RN1.18.0.html){:target="_blank"} (PSMDB) and [Percona Operator for PostgreSQL v2.5.0](https://docs.percona.com/percona-operator-for-postgresql/2.0/ReleaseNotes/Kubernetes-Operator-for-PostgreSQL-RN2.5.0.html){:target="_blank"} (PG)|
    | **5.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.4.0|
    | **6.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.4.0|
    | **7.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.4.0|
    | **8.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.4.0|


## Release highlights

### Optimizing workloads with affinity in Percona Everest

We're thrilled to announce the latest enhancement to our offerings—introducing Affinity with Percona Everest 1.5.0.

Affinity provide database administrators with enhanced control over workload distribution in a Kubernetes cluster. By implementing affinity and anti-affinity rules, you can not only optimize performance and enhance system resilience but also ensure that your resources are utilized to their fullest potential.

Kubernetes features three primary types of affinity that play a crucial role in how pods are scheduled and interact within a cluster.

- [Node affinity](https://docs.percona.com/everest/use/affinity.html#node-affinity)
- [Pod affinity](https://docs.percona.com/everest/use/affinity.html#pod-affinity)
- [Pod anti-affinity](https://docs.percona.com/everest/use/affinity.html#pod-anti-affinity)

## Set up affinity rules for your cluster

!!! info "Important"
    We've set up a default affinity rule that applies to all your database engines to ensure optimal performance and reliability.

You can set affinity rules in Percona Everest via the **Advanced Configurations** page within the **Affinity** section.

![!image](../images/create_affinity.png)

![!image](../images/configure_node_affinity.png)

### Secure Access: Validating permissions assignments from Your IDP

Starting with Percona Everest 1.5.0, you can now assign RBAC policies to user groups obtained from the external IDP. This change simplifies permissions management for external users without the need for unique **sub** IDs.

A user will be authorized to perform an operation if either their subject or any of the groups they belong to has the required permission.

### Operators support

We have added support for PXC operator verrsion v1.16.1.


## New features

[EVEREST-1547](https://perconadev.atlassian.net/browse/EVEREST-1547) \[UI\] Notify users that an everest upgrade has been performed and load new UI code

[EVEREST-1549](https://perconadev.atlassian.net/browse/EVEREST-1549) Add support for PXC operator v1.16.1

[EVEREST-1605](https://perconadev.atlassian.net/browse/EVEREST-1605) Set affinity rules in DB creation wizard

[EVEREST-1606](https://perconadev.atlassian.net/browse/EVEREST-1606) Set affinity rules in DB components tab

[EVEREST-1607](https://perconadev.atlassian.net/browse/EVEREST-1607) Navigate to affinity rules from the DB overview tab

[EVEREST-1799](https://perconadev.atlassian.net/browse/EVEREST-1799) \[RBAC\] Validate Permissions Assignment to User Groups from IDP


## Improvements

[EVEREST-970](https://perconadev.atlassian.net/browse/EVEREST-970) \[UI\] Change default schedule to "Daily at 1am"


[EVEREST-1066](https://perconadev.atlassian.net/browse/EVEREST-1066) \[UI\] Backups \(widget\)


[EVEREST-1190](https://perconadev.atlassian.net/browse/EVEREST-1190) \[UI\] Show user detail on the UI


[EVEREST-1579](https://perconadev.atlassian.net/browse/EVEREST-1579) \[UI\] Improve shard topology visibility

[EVEREST-1612](https://perconadev.atlassian.net/browse/EVEREST-1612) \[CLI\] everestctl version command should display the Everest server version \(if installed\)


[EVEREST-1718](https://perconadev.atlassian.net/browse/EVEREST-1718) \[UI\] Add loading bar when operators are being upgraded


[EVEREST-1788](https://perconadev.atlassian.net/browse/EVEREST-1788) \[CLI\] 'Remove Namespace' should prompt for namespace name

[EVEREST-1790](https://perconadev.atlassian.net/browse/EVEREST-1790) \[CLI\] 'Update Namespace' should prompt for namespace name

[EVEREST-1794](https://perconadev.atlassian.net/browse/EVEREST-1794) \[CLI\] Improve description/help-text of --keep-namespace flag for better clarity

[EVEREST-1795](https://perconadev.atlassian.net/browse/EVEREST-1795) \[CLI\] Improve error message when trying to update a namespace with everestctl that is not managed by Everest


## Bugs

[EVEREST-1261](https://perconadev.atlassian.net/browse/EVEREST-1261) Incorrect error when adding backup storage using same credentials

[EVEREST-1401](https://perconadev.atlassian.net/browse/EVEREST-1401) \[UI\] Resources not calculated properly for PSMDB sharding cluster

[EVEREST-1537](https://perconadev.atlassian.net/browse/EVEREST-1537) Everest uninstall fails on trying to delete db clusters due to timeout

[EVEREST-1581](https://perconadev.atlassian.net/browse/EVEREST-1581) \[UI\] Database remains in Deleting status

[EVEREST-1588](https://perconadev.atlassian.net/browse/EVEREST-1588) PG stuck initializing after a restore

[EVEREST-1589](https://perconadev.atlassian.net/browse/EVEREST-1589) MySQL stuck initializing in 1-node cluster

[EVEREST-1590](https://perconadev.atlassian.net/browse/EVEREST-1590) Installation is stuck

[EVEREST-1647](https://perconadev.atlassian.net/browse/EVEREST-1647) \[UI\] Monthly schedule creates an invalid configuration for PSMDB

[EVEREST-1651](https://perconadev.atlassian.net/browse/EVEREST-1651) Creating a new database from backup fails for a mysql database with a long name

[EVEREST-1674](https://perconadev.atlassian.net/browse/EVEREST-1674) Intermittent "Enforce did not pass" Message for Status 403, and Database Disappearance in UI

[EVEREST-1677](https://perconadev.atlassian.net/browse/EVEREST-1677) \[UI\] After upgrade from 1.2.0 to 1.3.0-rc5 all resources of proxies and bouncers are displayed as 0

[EVEREST-1722](https://perconadev.atlassian.net/browse/EVEREST-1722) UI Issues with Config Number Adjustment in DatabaseClusters

[EVEREST-1724](https://perconadev.atlassian.net/browse/EVEREST-1724) \[UI\] Sharding is reset to default when returning to the previous step of the form

[EVEREST-1728](https://perconadev.atlassian.net/browse/EVEREST-1728) \[UI\] Database dashboard is not updated automatically

[EVEREST-1729](https://perconadev.atlassian.net/browse/EVEREST-1729) \[CLI\] Installation fails if 1.3.0 release cli is used to install 1.4.0

[EVEREST-1735](https://perconadev.atlassian.net/browse/EVEREST-1735) \[UI\] Incorrect info on PITR Edit button is visible when PITR is enabled

[EVEREST-1758](https://perconadev.atlassian.net/browse/EVEREST-1758) \[UI\] Percona Everest UI buttons to create namespaces not accessible until page is manually refreshed  after adding a namespace with everestctl namespaces add

[EVEREST-1800](https://perconadev.atlassian.net/browse/EVEREST-1800) \[RBAC\] Unable to create a DB cluster as DB version is not displayed, with specific RBAC policy

[EVEREST-1801](https://perconadev.atlassian.net/browse/EVEREST-1801) \[RBAC\] Create DB cluster option not visible on the UI if user does not have permission for all the DB engines

[EVEREST-1802](https://perconadev.atlassian.net/browse/EVEREST-1802) \[RBAC\] Namespace\(s\) not visible on UI if user does not have permission to all db engines of a namespace

[EVEREST-1803](https://perconadev.atlassian.net/browse/EVEREST-1803) \[RBAC\] Unable to edit/add monitoring to a already created DB cluster, with specific RBAC policy

[EVEREST-1804](https://perconadev.atlassian.net/browse/EVEREST-1804) \[RBAC\] Operator Upgrade option not visible on the UI if user has access to all DB clusters in a namespace \(RBAC for db clusters set individually\)

[EVEREST-1805](https://perconadev.atlassian.net/browse/EVEREST-1805) \[UI\] Shard Cluster Activation State Resets After Clicking "Previous"

[EVEREST-1811](https://perconadev.atlassian.net/browse/EVEREST-1811) everest-operator does not restart when a DB operator is installed for the first time

[EVEREST-1816](https://perconadev.atlassian.net/browse/EVEREST-1816) Installation under OpenShift is failing


[EVEREST-1820](https://perconadev.atlassian.net/browse/EVEREST-1820) Database restores are not reconciled correctly for any DB type


### Technical task

[EVEREST-1616](https://perconadev.atlassian.net/browse/EVEREST-1616) \[UI\] Set affinity rules in DB creation wizard and Components page

[EVEREST-1617](https://perconadev.atlassian.net/browse/EVEREST-1617) \[API\] Set affinity rules

[EVEREST-1618](https://perconadev.atlassian.net/browse/EVEREST-1618) \[Operator\] Set affinity rules

[EVEREST-1654](https://perconadev.atlassian.net/browse/EVEREST-1654) Improve labels handling





## Known limitations







