# What's new in OpenEverest 1.11.0

➡️ **New to OpenEverest?** Get started with our [Quickstart Guide](../quick-install.html).

??? info "Expand to unleash the key updates"

    ## 📋 Release summary

    |**#**|**Category**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[NodePort Service Type for DatabaseClusters](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#__tabbed_1_1)|Expose DatabaseClusters via NodePort service type, allowing external access to database clusters through specific node ports.|
    | **2.**|[PostgreSQL 18.1](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#__tabbed_1_2)|OpenEverest 1.11.0 now supports PostgreSQL 18.1.|
    | **3.**|[Operator upgrades](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#__tabbed_1_3)|Support for Percona PostgreSQL Operator v2.8.2.|
    | **4.**|[New features](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#new-features)|Check out the new features introduced in OpenEverest 1.11.0|
    | **5.**|[Improvements](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#improvements)|Discover all the enhancements featured in OpenEverest 1.11.0|
    | **6.**|[Bug fixes](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#bug-fixes)|Find out about all the bugs fixed in OpenEverest 1.11.0|
    | **7.**|[Known limitations](../release-notes/OpenEverest-1.11.0-%282026-01-12%29.html#known-limitations)|Discover all the known limitations in OpenEverest 1.11.0|


## 🌟 Release highlights

=== "🌐 NodePort Service Type for DatabaseClusters"
    ### Expose DatabaseClusters via NodePort Service Type
    OpenEverest now supports exposing DatabaseClusters via the NodePort service type, allowing external access when LoadBalancer services aren't available. Use NodePort with appropriate network controls and avoid exposing clusters directly to the public internet.

    📘 For detailed instructions and best practices, refer to our [documentation](../networking/nodeport_support.html).

=== "🐘 PostgreSQL 18.1"
    ### Support for PostgreSQL 18.1
    OpenEverest 1.11.0 now supports the deployment of PostgreSQL 18.1 clusters. This update allows you to benefit from the latest PostgreSQL version, including enhanced performance, security updates, and an extended lifecycle.


=== "⚙️ Operators"
    ### Operator updates

    OpenEverest now supports:

    - Percona PostgreSQL Operator v2.8.2.
        
## New features

- [EVEREST-2179](https://perconadev.atlassian.net/browse/EVEREST-2179): OpenEverest now supports exposing DatabaseClusters via NodePort service type, allowing external access to database clusters through specific node ports.

- [EVEREST-2359](https://perconadev.atlassian.net/browse/EVEREST-2359): OpenEverest now supports Percona PostgreSQL Operator v2.8.2.

## Bug fixes

- [EVEREST-2367](https://perconadev.atlassian.net/browse/EVEREST-2367): Fixed an issue where restoring a MongoDB backup to a new cluster failed because the backup version field was missing; restores now detect and use the backup version.

- [EVEREST-2104](https://perconadev.atlassian.net/browse/EVEREST-2104): Added deletion protection for backups and restore resources. If a backup or restore object is being used by a database cluster, attempts to delete it will now be blocked to prevent failure of ongoing operations.

- [EVEREST-2353](https://perconadev.atlassian.net/browse/EVEREST-2353): Deleting a PostgreSQL backup resource no longer shows an error — the backup is now deleted successfully.

- [EVEREST-2290](https://perconadev.atlassian.net/browse/EVEREST-2290): Fixed an issue where the "Add New" button for key/value annotations in Load Balancer Configs could be clicked multiple times without filling in the previous row. Users must now complete the current row before adding another.


## Known limitations

### PostgreSQL backup conflict with first storage

When adding the first backup storage to a PostgreSQL cluster that was created without any backup schedules, the first backup requested may show as failed due to a conflict with an automatic backup that is taken when the storage is initially added. Despite the failed status, a successful backup is actually created and available in the backup storage.

## 🚀 Ready to Upgrade?

Upgrade to **OpenEverest 1.11.0** to access these new features and improvements.

📖 Explore our [Upgrade section](../upgrade/upgrade_with_helm.html) for the upgrade steps.
