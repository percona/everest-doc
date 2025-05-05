# What's new in Percona Everest 1.7.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Expand to unleash the key updates"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Affinity](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_1)|Increase the capacity of your storage through manual storage scaling|
    | **2.**|[MongoDB: Major DB updates](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_2)|Support for major version upgrades of MongoDB|
    | **3.**|[Operator Upgrades](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_3)|Support for Percona Operator for PostgreSQL 2.6.0 and PostgreSQL 17|
    | **4.**|[Removed support for PostgreSQL 12](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#removed-support-for-postgresql-12)|Percona Everest 1.6.0 discontinues support for PostgreSQL 12|
    | **5.**|[Google Container Registry (GCR) deprecation](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#google-container-registry-gcr)|Deprecation of GCR starting **May 20, 2025**|
    | **6.**|[New features](Percona-Everest-1.6.0-%282025-04-16%29.html#new-features)|Check out the new features introduced in Percona Everest 1.6.0|
    | **7.**|[Improvements](Percona-Everest-1.6.0-%282025-04-16%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.6.0|
    | **8.**|[Bugs](Percona-Everest-1.6.0-%282025-04-16%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.6.0|
    | **9.**|[Known limitation](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#known-limitation)|Discover all the known limitations in Percona Everest 1.6.0|


## 🌟 Release highlights

===  "⎈ Affinity"


    ### Database Affinity rules for optimized Kubernetes scheduling
    
    The DB Affinity Rules feature provides database administrators with enhanced control over the distribution of database workloads within a Kubernetes cluster. By configuring Kubernetes affinity and anti-affinity rules, you can optimize performance, improve resilience, and utilize resources more efficiently—customized to the architecture and components of each database.

    This feature covers three key areas of affinity rule management throughout the database lifecycle:

    - **Reusable Affinity Policies:** Create shared policies that can be reused by many DB clusters.
    - **Policy selection during database deployment:** Select the appropriate policy during the database creation process.
    - **Affinity management and status monitoring:** Modify affinity settings for specific components in existing cluster, as well as quickly monitor the status from the database overview page.
    
    These capabilities offer a robust toolkit for defining and maintaining workload distribution strategies across all supported database engines: MySQL, MongoDB, and PostgreSQL.

=== "🔐 TLS support"

    ### Improved Security with TLS support

    Starting with version 1.7.0, Percona Everest can be configured to use Transport Layer Security (TLS) for all incoming connections to the Everest API server. TLS ensures that client and API server communication is encrypted, protecting data from interception or tampering.
 
    
    Administrators can configure server certificates and private keys to enable **secure HTTPS access**, enhancing the overall security posture for production environments.


=== "🕒 Session management"

    ### Percona Everest 1.7.0: Secure user access with session management

    Starting with Percona Everest 1.7.0, we've introduced session management,  which handles user sessions to keep them secure, efficient, and continuous.

    This feature is valuable for applications that handle user authentication and authorization, including web services, databases, and Database as a Service (DBaaS) platforms.


=== " :simple-mysql: PXC Operator"
    
    ### Support for Percona XtraBackup Operator 1.17.0

    Percona Everest 1.7.0 now includes support for PXC Operator version 1.17.0.


## 🛑 Google Container Registry (GCR)

!!! warning "GCR deprecation"
    GCR is set to be **deprecated**, with its official shutdown scheduled for **May 20, 2025**.

    All Percona Everest versions prior to 1.4.0 depend on images hosted on the Google Container Registry (GCR). These images will become unavailable after the shutdown date: **May 20, 2025**.

### Impact

Percona Everest versions older than 1.4.0 will cease to function after this date.

### Action required

We strongly recommend upgrading to Percona Everest version 1.4.0 or later as soon as possible. If you do not upgrade, Percona Everest will no longer function.
    
For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.

## New Feature

- [EVEREST-1605](https://perconadev.atlassian.net/browse/EVEREST-1605): We've introduced a **Pod Scheduling Policy** panel in the **Advanced Configuration** step of the DB cluster creation wizard. 

    This feature allows you to define custom Affinity rules while creating a new DB cluster, providing greater control over pod placement and workload distribution.


- [EVEREST-1606](https://perconadev.atlassian.net/browse/EVEREST-1606): You can now apply Affinity rules to existing DB clusters via a new **Pod Scheduling Policy** panel, which is available in the **Advanced Configuration** section of the DB cluster overview page.

    - This feature allows users to enable the Pod Scheduling Policy for an individual DB cluster after its creation.
    - Once enabled, users can select one of the predefined scheduling policies to influence pod placement according to their workload distribution or fault-tolerance needs.

- [EVEREST-1607](https://perconadev.atlassian.net/browse/EVEREST-1607) Navigate to Pod Scheduling Policy from the DB overview tab

- [EVEREST-1862](https://perconadev.atlassian.net/browse/EVEREST-1862): The **Components** tab now features a new **Topology View **to improve the visibility and management of DB clusters deployed in Percona Everest. This interactive view visually represents the components of the cluster, including pods, services, status, and their relationships.

- [EVEREST-1987](https://perconadev.atlassian.net/browse/EVEREST-1987): We have added support for PXC operator v1.17.0.

- [EVEREST-1998](https://perconadev.atlassian.net/browse/EVEREST-1998) Manage Pod Scheduling Policies


## Improvements

- [EVEREST-1106](https://perconadev.atlassian.net/browse/EVEREST-1106): Percona Everest administrators can now delete users created with `everestctl`. Once a user is removed, they can no longer use their access tokens to make requests to the Everest API. This improves security by preventing unauthorized access from former users and allows for better management of user permissions within Percona Everest.

- [EVEREST-1180](https://perconadev.atlassian.net/browse/EVEREST-1180): Percona Everest can now be configured to use Transport Layer Security (TLS) for all incoming connections to the Everest API server.

- [EVEREST-1806](https://perconadev.atlassian.net/browse/EVEREST-1806): The validation message **The number of proxies must be greater than 1** was previously hidden within the expandable **Proxies** panel, making it difficult for users to see. This improvement enhances visibility, ensuring that users receive the correct message when the **Continue** button is disabled.

- [EVEREST-1923](https://perconadev.atlassian.net/browse/EVEREST-1923): The Everest API access token now becomes invalid immediately upon logout, preventing unauthorized access to your account.


- [EVEREST-1931](https://perconadev.atlassian.net/browse/EVEREST-1931): We have improved the diagram view for the default zoom and search functionality of DB cluster components in the following ways:

    - **Default Zoom Level**: A predefined zoom level is now set to ensure that all components are visible upon loading.
    - **Reset View Button**: This button allows you to reset the zoom level and reposition the view to its default settings.
    - **Search Functionality**: A search bar has been added to the diagram view, similar to the one in the table view, making it easier to locate components.


## Bugs

- [EVEREST-741](https://perconadev.atlassian.net/browse/EVEREST-741): Enabling PITR sometimes displays the database as down

- [EVEREST-1012](https://perconadev.atlassian.net/browse/EVEREST-1012) Creating a new postgresql database using backup has no restore information


- [EVEREST-1623](https://perconadev.atlassian.net/browse/EVEREST-1623) Haproxy restarts continuously in 5 node mysql database

- [EVEREST-1651](https://perconadev.atlassian.net/browse/EVEREST-1651): Fixed an issue where creating a new MySQL database from a backup would fail if the database name was too long.

- [EVEREST-1700](https://perconadev.atlassian.net/browse/EVEREST-1700): When PMM monitoring was enabled, the database clusters underwent multiple reconciliation cycles upon creation, which caused unnecessary restarts of all pods. This significantly slowed down the startup times. 

    A similar problem arose during the cluster deletion process—before the termination could begin, all pods went through a restart cycle, which delayed the shutdown. We have resolved this issue now.

- [EVEREST-1754](https://perconadev.atlassian.net/browse/EVEREST-1754): The **storage is (re)initializing** error message was displayed on the UI intermittently . We have now resolved the issue.

- [EVEREST-1785](https://perconadev.atlassian.net/browse/EVEREST-1785) \[BE\] PITR pod gets restarted many times

- [EVEREST-1838](https://perconadev.atlassian.net/browse/EVEREST-1838): 
Resolved an issue where users were unable to edit Point-in-Time Recovery (PITR) settings due to the **Edit** button being disabled. A message stated, **Create a schedule first to enable PITR**," even though PITR was already enabled.

- [EVEREST-1865](https://perconadev.atlassian.net/browse/EVEREST-1865): When you hover over the **Edit** option for PostgreSQL schedules in Percona Everest, a tooltip now appears that states, **Point-in-time recovery (PITR) is always enabled for all PostgreSQL schedules and cannot be disabled**. Previously, tooltips were only shown for MySQL and MongoDB schedules.

- [EVEREST-1890](https://perconadev.atlassian.net/browse/EVEREST-1890): During the MySQL DB cluster creation process, the number of proxies changed incorrectly from the user-defined value `(X)` to `1` instead of keeping the specified configuration. We have resolved the issue now.

- [EVEREST-1895](https://perconadev.atlassian.net/browse/EVEREST-1895) \[UI\] PITR time can't be changed from the last successful backup

- [EVEREST-1948](https://perconadev.atlassian.net/browse/EVEREST-1948) \[UI\] Component Age isn't displayed properly

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961) \[BE\] Edit monitoring instance does not work

- [EVEREST-2011](https://perconadev.atlassian.net/browse/EVEREST-2011) Restore to a mysql database is not working in pxc v1.17.0

- [EVEREST-2018](https://perconadev.atlassian.net/browse/EVEREST-2018) Incorrect Everest installation instructions when TLS is enabled


## :rocket: Upgrade now

Upgrade to **Percona Everest 1.6.0** to access these new features and improvements. 

:mag: Explore our [documentation](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.
