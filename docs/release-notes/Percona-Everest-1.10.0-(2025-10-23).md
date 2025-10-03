# What's new in Percona Everest 1.10.0

!!! warning "ACTION REQUIRED: Percona Everest and Bitnami Container Catalog changes"
    Bitnami is **restructuring** its container catalog on **September 29, 2025**. To avoid potential failures in Percona Everest operations, follow the steps outlined in this [post](https://github.com/percona/everest/discussions/1663).

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).

??? info "Expand to unleash the key updates"

    ## 📋 Release summary

    |**#**|**Category**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Release highlight: Support for Split-Horizon DNS for MongoDB](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)|     |
    | **2.**|[Release highlight: Support NodePort exposure type](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)|     |
    | **3.**|[Release highlight: Add support for PXC operator v1.18.0](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)|     |
    | **4.**|[Release highlight: Add support for PXC operator v1.18.0](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)|     |
    | **5.**|[Release highlight: Add support for PSMDB operator v1.21.0](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)|     |
    | **6.**|[Release highlight: support for PG operator v2.7.0](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#load-balancer-configuration-in-percona-everest)| |
    | **7.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#new-features)|Check out the new features introduced in Percona Everest 1.9.0|
    | **8.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.9.0|
    | **9.**|[Bug fixes](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#bug-fixes)|Find out about all the bugs fixed in Percona Everest 1.9.0|
    | **10.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.9.0-%282025-09-23%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.9.0|


## 🌟 Release highlights


### Support for Split-Horizon DNS for MongoDB

### Support NodePort exposure type

### Operators support

- Percona Everest now supports Percona PostgreSQL Operator v2.7.0.

- Percona Everest now supports Percona Server for MongoDB Operator v1.21.0.

- Percona Everest now supports Percona XtraDB Cluster Operator v1.18.0.


## New features

- [EVEREST-2239](https://perconadev.atlassian.net/browse/EVEREST-2239): Support for Split-Horizon DNS for MongoDB

- [EVEREST-2179](https://perconadev.atlassian.net/browse/EVEREST-2179) Support NodePort exposure type

- [EVEREST-2009](https://perconadev.atlassian.net/browse/EVEREST-2009): Percona Everest now supports Percona PostgreSQL Operator v2.7.0.
- [EVEREST-2173](https://perconadev.atlassian.net/browse/EVEREST-2173): Percona Everest now supports Percona Server for MongoDB Operator v1.21.0.

- [EVEREST-2174](https://perconadev.atlassian.net/browse/EVEREST-2174): Percona Everest now supports Percona XtraDB Cluster Operator v1.18.0.


## Improvements

- [EVEREST-1853](https://perconadev.atlassian.net/browse/EVEREST-1853): Percona Everest now integrates with Percona Monitoring and Management v3, giving you access to the latest monitoring, alerting, and performance insights. PMM v2 remains supported for backward compatibility.

- [EVEREST-1889](https://perconadev.atlassian.net/browse/EVEREST-1889): The **Overview → Resources** section now displays the number of nodes per shard, providing a clearer understanding of resource allocation in sharded deployments at a glance.


- [EVEREST-2236](https://perconadev.atlassian.net/browse/EVEREST-2236) Expose proxy vars in helm values

- [EVEREST-2302](https://perconadev.atlassian.net/browse/EVEREST-2302): Menu informational sections are now displayed as plain text. They no longer behave like actions (clickable or hoverable), improving clarity and reducing user confusion.

- [EVEREST-2318](https://perconadev.atlassian.net/browse/EVEREST-2318): The dropdown option **LoadBalancer** has been renamed to **LoadBalancer** to align with other service types such as **ClusterIP** and **NodePort**.

- [EVEREST-2323](https://perconadev.atlassian.net/browse/EVEREST-2323): The DB Importers UI now displays credentials in the same order as they appear in Kubernetes secrets and documentation, ensuring a consistent workflow across CLI, docs, and UI.


## Bug fixes

- [EVEREST-1741](https://perconadev.atlassian.net/browse/EVEREST-1741) \[UI\] Deleting a database changes the color of Actions to blue

- [EVEREST-1865](https://perconadev.atlassian.net/browse/EVEREST-1865) \[UI\] PITR edit info not available for PG db cluster

- [EVEREST-1947](https://perconadev.atlassian.net/browse/EVEREST-1947) \[UI\] Copy URL Connection to Clipboard Button Not Working in DB Details View

- [EVEREST-2023](https://perconadev.atlassian.net/browse/EVEREST-2023) Inconsistent logic in everest-operator for creating and updating resources

- [EVEREST-2104](https://perconadev.atlassian.net/browse/EVEREST-2104) Restore gets stuck in Restoring status if the backup is deleted

- [EVEREST-2109](https://perconadev.atlassian.net/browse/EVEREST-2109) PITR remains disabled for PostgreSQL DB cluster after creating on-demand or scheduled backups

- [EVEREST-2121](https://perconadev.atlassian.net/browse/EVEREST-2121) Keep backups storage data during database deletion is not working

- [EVEREST-2135](https://perconadev.atlassian.net/browse/EVEREST-2135) \[Data Importer\] S3 field accepts invalid formats and Verify TLS is unchecked by default

- [EVEREST-2163](https://perconadev.atlassian.net/browse/EVEREST-2163) \[UI\] Pod scheduling policy is not displayed in Edit advanced configuration if it doesn't have any rules

- [EVEREST-2211](https://perconadev.atlassian.net/browse/EVEREST-2211) Postgresql database doesn't come up and crashes after PITR

- [EVEREST-2235](https://perconadev.atlassian.net/browse/EVEREST-2235) \[operator\] specifying an invalid .spec.engine.version in DatabaseCluster CRD crashes Everest Operator

- [EVEREST-2237](https://perconadev.atlassian.net/browse/EVEREST-2237) \[UI\] DB overview page crashes when creation is done via CRD

- [EVEREST-2258](https://perconadev.atlassian.net/browse/EVEREST-2258) \[UI\] Connection URL does not get updated after enabling load balancer

- [EVEREST-2259](https://perconadev.atlassian.net/browse/EVEREST-2259) \[UI\] Auto-update Connection URL field when changing the expose type

- [EVEREST-2278](https://perconadev.atlassian.net/browse/EVEREST-2278) Browser get stuck after SSO token expires until we clear cookies

- [EVEREST-2290](https://perconadev.atlassian.net/browse/EVEREST-2290) Add New button allows multiple empty rows when creating/editing LBC

- [EVEREST-2311](https://perconadev.atlassian.net/browse/EVEREST-2311) \[UI\] Change warning message on deleting a load balancer config

- [EVEREST-2324](https://perconadev.atlassian.net/browse/EVEREST-2324) \[CLI\] cannot perform upgrade to latest patch


## Known limitations


## 🚀 Ready to Upgrade?

Upgrade to **Percona Everest 1..0** to access these new features and improvements.

📖 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.