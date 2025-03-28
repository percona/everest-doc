# What's new in Percona Everest 1.6.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Updates at a glance"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Manual storage scaling](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)|Increase the storage capacity of your S3-compatible storage through manual storage scaling|
    | **2.**|[MongoDB updates](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)||


## Release highlights

=== "Manual storage scaling"

    ### Maximizing Efficiency with manual storage scaling

    Starting with Percona Everest 1.6.0, you can leverage manual storage scaling to increase the capacity of your **S3-compatible storage**. This is particularly useful for handling unexpected workload growth and ensures you can manage increasing database demands while maintaining data security and system stability.
    
    **Prerequisites for storage scaling**

    - **PersistentVolumeClaim (PVC) volume expansion** - Ensure that the `StorageClass` used by the database’s PersistentVolumeClaim (PVC) supports volume expansion.  Refer to the [Kubernetes documentation on Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/){:target="_blank"} for more details.

    - **Resource quota check** - Verify that your resource quotas allow for the requested storage capacity. See the Kubernetes documentation on [Storage Resource Quota](https://kubernetes.io/docs/concepts/policy/resource-quotas/#storage-resource-quota){:target="_blank"} for more information.

    **How to modify storage capacity**

    To increase the DISK for a database, go to the Percona Everest home page and select your desired database. Then, navigate to **Overview > Resources > Edit** and enter the new value for **DISK** (in Gi).


=== "Major database upgrades"

    ### Seamless major version upgrades for MongoDB

    Percona Everest 1.6.0 introduces support for major version upgrades of MongoDB, enabling you to upgrade your databases with **minimal downtime and disruption**. This enhancement ensures your applications remain secure, performant, and compliant with the latest MongoDB features.

    To upgrade your MongoDB databases, visit the Percona Everest homepage and select the database you want to upgrade. Go to the **Overview** page, click on **Edit**, choose the desired version, and then click **Upgrade**.

    ![!image](../images/database_upgrade.png)
    
    ![!image](../images/upgrade_database_versions.png)

=== "Topology diagram"

    ### Topology diagram view for your DB clusters

    Starting with the release of Percona Everest 1.6.0, we have introduced a topology diagram view for your database clusters. This feature provides a visual representation of the configuration of various components within your database cluster, helping you to understand how your services connect and interact. The diagram helps you identify potential bottlenecks and points of failure, enabling you to make more informed decisions and effectively manage your database clusters.

    You can access this view from the **Overview > Components** tab.    The diagram displays the following:

    - **Nodes**: Displays all the nodes within the cluster.
    - **Pods**: Shows the pods running on each node.
    - **Status**: Shows the health of components, such as whether the pods are running or failing.
    - **Uptime**: Shows how long a component (like a pod or node) has been running since its last start or restart.

=== "Operators support"

    ### Support for Percona Operator for PostgreSQL 2.6.0

    Percona Everest 1.6.0 includes support for Percona Operator for PostgreSQL 2.6.0.


## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    GCR is set to be **deprecated**, with its official shutdown scheduled for **May 20, 2025**.

    All Percona Everest versions prior to 1.4.0 depend on images hosted on Google Container Registry (GCR). These images will become unavailable after the shutdown date: **May 20, 2025**.

### Impact of GCR deprecation

Percona Everest versions older than 1.4.0 will cease to function after this date.

### Action required

We strongly recommend upgrading to Percona Everest version 1.4.0 or later as soon as possible. If you do not upgrade, Percona Everest will no longer function.
    
For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


## New features

- [EVEREST-1870](https://perconadev.atlassian.net/browse/EVEREST-1870), [EVEREST-1871](https://perconadev.atlassian.net/browse/EVEREST-1871), [EVEREST-1872](https://perconadev.atlassian.net/browse/EVEREST-1872): Starting with Percona Everest 1.6.0, you can leverage manual storage scaling to increase the capacity of your **S3-compatible storage** for MySQL, MongoDB, and PostgreSQL databases respectively.

- [EVEREST-1841](https://perconadev.atlassian.net/browse/EVEREST-1841): Percona Everest 1.6.0 introduces support for major version upgrades of MongoDB, enabling you to upgrade your databases with **minimal downtime and disruption**.

- [EVEREST-1843](https://perconadev.atlassian.net/browse/EVEREST-1843) : Percona Everest 1.6.0 includes support for Percona Operator for PostgreSQL 2.6.0.

- [EVEREST-1862](https://perconadev.atlassian.net/browse/EVEREST-1862): Starting with Percona Everest 1.6.0, we have introduced a topology diagram view for your database clusters. This feature provides a visual representation of the configuration of various components within your database cluster, helping you to understand how your services connect and interact.

## Improvements

- [EVEREST-1202](https://perconadev.atlassian.net/browse/EVEREST-1202): We’ve refined the table header icons by removing the focus state when users click outside for an enhanced UX.

- [EVEREST-1280](https://perconadev.atlassian.net/browse/EVEREST-1280): We've moved the **Storage class** field to the **Advanced Configurations** page for better organization and usability."

- [EVEREST-1312](https://perconadev.atlassian.net/browse/EVEREST-1312): The installation log now displays the same operator names as selected in the wizard for consistency and clarity.

- [EVEREST-1711](https://perconadev.atlassian.net/browse/EVEREST-1711): We've enhanced the database creation wizard by removing the final confirmation step, which improves user flow and decreases the number of clicks needed to create a database.

- [EVEREST-1921](https://perconadev.atlassian.net/browse/EVEREST-1921): Updated the database version upgrade modal to prevent selection of the current version, ensuring only valid upgrade options are available.

- [EVEREST-1930](https://perconadev.atlassian.net/browse/EVEREST-1930): We have introduced a distinct **Upgrading** state that provides a clear indication of when a database upgrade is taking place.


## Bugs

- [EVEREST-765](https://perconadev.atlassian.net/browse/EVEREST-765): We have fixed an issue that caused Point-In-Time Recovery (PITR) to be disabled after the database was suspended and then resumed.

- [EVEREST-1350](https://perconadev.atlassian.net/browse/EVEREST-1350): The UI now displays the IP address along with the netmask, ensuring consistency with the backend format.


- [EVEREST-1374](https://perconadev.atlassian.net/browse/EVEREST-1374): We have identified and addressed an inconsistency in the logic governing the naming restrictions for backup storage and monitoring endpoints.

- [EVEREST-1625](https://perconadev.atlassian.net/browse/EVEREST-1625): Point-In-Time Recovery (PITR) options were not visible in the UI when no scheduled backups were in place. This occurred even if the most recent backup completed successfully and PITR was enabled. This issue has been resolved now.

- [EVEREST-1763](https://perconadev.atlassian.net/browse/EVEREST-1763): When modifying the network topology by reducing the configuration from three nodes to a single node, no error message was displayed. This issue has now been resolved, and an error message now appears, indicating that downscaling is not possible.

- [EVEREST-1798](https://perconadev.atlassian.net/browse/EVEREST-1798): Resolved an issue where the PostgreSQL cluster was repeatedly been initialized, leading to backup failures in specific scenarios.

- [EVEREST-1911](https://perconadev.atlassian.net/browse/EVEREST-1911): Fixed an issue where an empty state briefly appeared before the first DB cluster was dispalyed.

- [EVEREST-1920](https://perconadev.atlassian.net/browse/EVEREST-1920): [UI]: Fixed a UI issue where the custom number of nodes for PG was not displaying correctly in the cluster overview.
