# 📦 What's new in Percona Everest 1.7.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Expand to unleash the key updates"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Pod Scheduling policies](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_1)|Pod Scheduling for optimized Kubernetes scheduling¶|
    | **2.**|[TLS support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_2)|Improved Security with TLS support|
    | **3.**|[Session Management](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_2)|Secure user access with session management|
    | **4.**|[Operator Upgrades](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#__tabbed_1_3)|Support for Percona XtraBackup Operator 1.17.0|
    | **5.**|[Google Container Registry (GCR) deprecation](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#google-container-registry-gcr)|Deprecation of GCR starting **May 20, 2025**|
    | **6.**|[New features](Percona-Everest-1.6.0-%282025-04-16%29.html#new-features)|Check out the new features introduced in Percona Everest 1.7.0|
    | **7.**|[Improvements](Percona-Everest-1.6.0-%282025-04-16%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.7.0|
    | **8.**|[Bugs](Percona-Everest-1.6.0-%282025-04-16%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.7.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.6.0-%282025-04-16%29.html#known-limitation)|Discover all the known limitations in Percona Everest 1.7.0|


## 🌟 Release highlights

=== "☁️ GKE Autopilot clusters"

    ### Deploy Percona Everest on GKE Autopilot

     You can now install Percona Everest on Google Kubernetes Engine (GKE) Autopilot clusters. GKE Autopilot provides a fully managed Kubernetes environment, where Google automatically handles node provisioning, scaling, and security. 

    Here are the benefits of this enhancement:

    - Optimized resource allocation
    - Streamlined operations
    - Reduced operational overhead
    - Simplified cluster management
    - Automated scaling and built-in security policies—leveraging Percona Everest’s database management capabilities.


    📚 Learn more about GKE Autopilot in the official [documentation](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview){:target="_blank"}.

===  "⎈ Pod scheduling policies"

    ### Optimized Pod scheduling policies in Percona Everest
    
    We are thrilled to introduce Pod scheduling policies for Percona Everest. This feature supports database workload scheduling on Kubernetes by allowing users to define Pod scheduling policies, including Kubernetes Affinity and Anti-Affinity rules. These policies optimize performance and enhance system resilience and ensure that your resources are utilized to their fullest potential.
    
    Pod scheduling policy is a **preset** that includes a set of Kubernetes Affinity rules that are applied to the appropriate DB cluster components.


    Kubernetes features three primary types of affinity that play a crucial role in how pods are scheduled and interact within a DB cluster:

    - [Pod affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity){:target="_blank"}: Co-locates pods on the same node or topology domain.

    - [Pod anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity){:target="_blank"}: Ensures pods are scheduled on different nodes or domains.

    - [Node affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity){:target="_blank"}: Schedules pods based on node labels and conditions.

    #### Default configuration for Pod scheduling policies

    In Percona Everest, the default pod scheduling policies are **preset** rules that help ensure optimal placement of database components across a Kubernetes cluster. Administrators create the default Affinity rules. Thus, Percona Everest users can utilize these predefined settings without the need to create custom rules for every database cluster they set up.

    ![!image](../images/default_mongo_policy.png)

    📘 To dive deep into this topic, see our [documentation](https://docs.percona.com/everest/administer/default_policies.html).

    #### Custom Pod scheduling policies
    If you need more control, you can define custom Pod Scheduling Policies to manage how database pods are placed across Kubernetes nodes. These policies offer fine-grained control over pod distribution using Kubernetes affinity and anti-affinity rules.

    To create a custom policy, simply configure the scheduling rules via the Everest UI, as shown below:

    ![!image](../images/affinity_add_rules.png)

    📘 To explore this topic in detail, see our [documentation](https://docs.percona.com/everest/administer/custom_policies.html).

=== "🔐 TLS support"

    ### Improved Security with TLS support

    Starting with version 1.7.0, Percona Everest can be configured to use Transport Layer Security (TLS) for all incoming connections to the Everest API server. TLS ensures that client and API server communication is encrypted, protecting data from interception or tampering.
 
    
    Administrators can configure server certificates and private keys to enable **secure HTTPS access**, enhancing the overall security posture for production environments.

    📘 To explore this topic in detail, see our [documentation](https://docs.percona.com/everest/security/tls_setup.html).

=== " :simple-mysql: PXC Operator"
    
    ### Support for Percona XtraBackup Operator 1.17.0

    Percona Everest 1.7.0 now includes support for PXC Operator version 1.17.0.


## 🛑 Google Container Registry (GCR)

!!! warning "GCR deprecation"
    GCR is set to be **deprecated**, with its official shutdown scheduled for **May 20, 2025**.

    All Percona Everest versions prior to 1.4.0 depend on images hosted on the Google Container Registry (GCR). These images will become unavailable after the shutdown date: **May 20, 2025**.

### Impact

Percona Everest versions older than 1.4.0 will cease to function after this date.

### ✅ Action required

We strongly recommend upgrading to Percona Everest version **1.4.0 or later** as soon as possible. If you do not upgrade, Percona Everest will no longer function.
    
📚 For more information, see the [Container Registry Deprecation Docs](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.

## New Feature

- [EVEREST-1605](https://perconadev.atlassian.net/browse/EVEREST-1605): We've introduced a **Pod Scheduling Policy** panel in the **Advanced Configuration** step of the DB cluster creation wizard. 

    This feature allows you to define custom Affinity rules while creating a new DB cluster, providing greater control over pod placement and workload distribution.


- [EVEREST-1606](https://perconadev.atlassian.net/browse/EVEREST-1606): You can now apply Affinity rules to existing DB clusters via a new **Pod Scheduling Policy** panel, which is available in the **Advanced Configuration** section of the DB cluster overview page.

    - This feature allows users to enable the Pod Scheduling Policy for an individual DB cluster after its creation.
    - Once enabled, users can select one of the predefined scheduling policies to influence pod placement according to their workload distribution or fault-tolerance needs.

- [EVEREST-1607](https://perconadev.atlassian.net/browse/EVEREST-1607): Database administrators can now quickly view the current affinity configuration status directly from the DB Overview tab. Additionally, a direct navigation link to the **Affinity** section in the **Components** tab has been added, allowing administrators to access and modify Kubernetes affinity rules for the database components. 

- [EVEREST-1862](https://perconadev.atlassian.net/browse/EVEREST-1862): The **Components** tab now features a new **Topology View **to improve the visibility and management of DB clusters deployed in Percona Everest. This interactive view visually represents the components of the cluster, including pods, services, status, and their relationships.

- [EVEREST-1987](https://perconadev.atlassian.net/browse/EVEREST-1987): We have added support for PXC operator v1.17.0.

- [EVEREST-1998](https://perconadev.atlassian.net/browse/EVEREST-1998) Database administrators now have more intuitive control over creating, updating, and deleting **Pod Scheduling Policies**, making workload distribution in Percona Everest more seamless. This enhancement helps optimize resource utilization and efficiency, ensuring smoother operations and better scheduling flexibility.



## Improvements

- [EVEREST-1106](https://perconadev.atlassian.net/browse/EVEREST-1106): Percona Everest administrators can now delete users created with `everestctl`. Once a user is removed, they can no longer use their access tokens to make requests to the Everest API. This improves security by preventing unauthorized access from former users and allows for better management of user permissions within Percona Everest.

- [EVEREST-1180](https://perconadev.atlassian.net/browse/EVEREST-1180): Percona Everest can now be configured to use Transport Layer Security (TLS) for all incoming connections to the Everest API server.

- [EVEREST-1806](https://perconadev.atlassian.net/browse/EVEREST-1806): The validation message **The number of proxies must be greater than 1** was previously hidden within the expandable **Proxies** panel, making it difficult for users to see. This improvement enhances visibility, ensuring users receive the correct message when the **Continue** button is disabled.

- [EVEREST-1901](https://perconadev.atlassian.net/browse/EVEREST-1901): When adding a **Backup Bucket**, trailing spaces at the end of the bucket name prevented it from being added. This issue often occurred when copying names, leading to confusion. We have improved this by trimming trailing spaces.

- [EVEREST-1902](https://perconadev.atlassian.net/browse/EVEREST-1902): When adding a **Monitoring Endpoint URLs**, trailing spaces at the end of the URL prevented it from being added. This issue often occurred when copying URL's, leading to confusion. We have improved this by trimming trailing spaces.

- [EVEREST-1974](https://perconadev.atlassian.net/browse/EVEREST-1974): The The **Storage Class** field was previously non-editable when modifying a DB cluster in the Percona Everest UI, but the message stated that it could be changed based on performance needs. The UI now clearly indicates that the Storage Class can only be selected during the creation of a cluster.

[EVEREST-1914](https://perconadev.atlassian.net/browse/EVEREST-1914): Focus state is now correctly removed when users click outside of an input field on the UI. This enhances usability by ensuring that input fields no longer appear active after focus is lost.

- [EVEREST-1923](https://perconadev.atlassian.net/browse/EVEREST-1923): The Everest API access token now becomes invalid immediately upon logout, preventing unauthorized access to your account.


- [EVEREST-1931](https://perconadev.atlassian.net/browse/EVEREST-1931): We have improved the diagram view for the default zoom and search functionality of DB cluster components in the following ways:

    - **Default Zoom Level**: A predefined zoom level is now set to ensure that all components are visible upon loading.
    - **Reset View Button**: This button allows you to reset the zoom level and reposition the view to its default settings.
    - **Search Functionality**: A search bar has been added to the diagram view, similar to the one in the table view, making it easier to locate components.


## Bugs

- [EVEREST-741](https://perconadev.atlassian.net/browse/EVEREST-741): Resolved an issue where enabling PITR would sometimes incorrectly display the database as down.

- [EVEREST-1012](https://perconadev.atlassian.net/browse/EVEREST-1012): When creating a new PostgreSQL database from an existing backup, the resulting database did not include any associated restore information. We have resolved the issue now.


- [EVEREST-1623](https://perconadev.atlassian.net/browse/EVEREST-1623): We have resolved an issue where HAProxy kept restarting in a 5-node MySQL cluster, which caused connection instability and made the database unavailable.


- [EVEREST-1651](https://perconadev.atlassian.net/browse/EVEREST-1651): Fixed a problem where creating a new MySQL database from a backup would fail if the database name exceeded a certain length.

- [EVEREST-1700](https://perconadev.atlassian.net/browse/EVEREST-1700): 
Fixed an issue where enabling PMM monitoring led to multiple unnecessary reconciliation cycles and pod restarts during database cluster creation, which significantly slowed down startup times. A similar issue that occurred during cluster deletion, causing pod restarts before termination, has also been resolved.

- [EVEREST-1754](https://perconadev.atlassian.net/browse/EVEREST-1754): Fixed an issue where the error message **storage is (re)initializing** was displayed on the UI intermittently.

- [EVEREST-1785](https://perconadev.atlassian.net/browse/EVEREST-1785): Resolved an issue with the PITR pod for a one-node MySQL database that restarted multiple times.

- [EVEREST-1838](https://perconadev.atlassian.net/browse/EVEREST-1838): 
Resolved an issue where users could not edit Point-in-Time Recovery (PITR) settings due to the **Edit** button being disabled. A message stated, **Create a schedule first to enable PITR**, even though PITR was already enabled.

- [EVEREST-1865](https://perconadev.atlassian.net/browse/EVEREST-1865): When you hover over the **Edit** option for PostgreSQL schedules in Percona Everest, a tooltip now appears stating that **Point-in-time recovery (PITR) is always enabled for all PostgreSQL schedules and cannot be disabled**. Previously, tooltips were only shown for MySQL and MongoDB schedules.

- [EVEREST-1890](https://perconadev.atlassian.net/browse/EVEREST-1890): During the MySQL DB cluster creation process, the number of proxies changed incorrectly from the user-defined value `(X)` to `1` instead of keeping the specified configuration. We have resolved the issue now.

- [EVEREST-1895](https://perconadev.atlassian.net/browse/EVEREST-1895): We have fixed an issue where changes to the time range between the last successful backup and the latest Point-in-Time Recovery (PITR) did not save. The system automatically reverted the selection to the latest PITR.

- [EVEREST-1948](https://perconadev.atlassian.net/browse/EVEREST-1948): The **Age** of the components is now accurately shown on the **Components** panel, ensuring that users can easily view and assess the information they need.

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961): While editing a monitoring instance, the UI accepted invalid endpoint URLs. This led to frequent restarts for MySQL, MongoDB, and PostgreSQL databases that had scheduled backups and Point-In-Time Recovery (PITR) enabled. We have resolved the issue now.

- [EVEREST-2011](https://perconadev.atlassian.net/browse/EVEREST-2011): The restore function for the MySQL database is now working correctly in PXC version 1.17.0.


- [EVEREST-2018](https://perconadev.atlassian.net/browse/EVEREST-2018): The TLS installation instructions now accurately guide users on accessing the user interface (UI).

- [EVEREST-1891](https://perconadev.atlassian.net/browse/EVEREST-1891): When trying to create a database from a backup that had the same name as an existing database, there was no validation message or warning. The **Continue** button became unresponsive and did not provide any error message to the user. We have now resolved this issue.

- [EVEREST-1984](https://perconadev.atlassian.net/browse/EVEREST-1984): Resolved an issue where creating multiple backup schedules in PostgreSQL led to an error.

- [EVEREST-2025](https://perconadev.atlassian.net/browse/EVEREST-2025): Resolved an issue where the **Content-Security-Policy** header included an invalid `connect-src` value if the OIDC issuer URL ended with a trailing slash. The policy is now correctly generated.

    Thanks to @(https://github.com/aurimasniekis) for reporting this issue!

- [EVEREST-343](https://perconadev.atlassian.net/browse/EVEREST-343): Resolved an issue that caused Percona Everest installation to fail on Google Kubernetes Engine (GKE) Autopilot clusters.


## 🚀 Upgrade now

Upgrade to **Percona Everest 1.7.0** to access these new features and improvements. 

📘 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.
