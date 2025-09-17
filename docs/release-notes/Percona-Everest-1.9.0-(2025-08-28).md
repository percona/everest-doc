# What's new in Percona Everest 1.9.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "Expand to unleash the key updates"

    ## 📋 Release summary

    |**#**|**Category**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Release highlight: Load Balancer configuration in Percona Everest](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#import-external-backups-into-percona-everest-clusters)|Define reusable LoadBalancer configurations in Percona Everest.
    | **2.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#new-features)|Check out the new features introduced in Percona Everest 1.9.0|
    | **3.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.8.0|
    | **4.**|[Bug fixes](Percona-Everest-1.8.0-%282025-07-16%29.html#bug-fixes)|Find out about all the bugs fixed in Percona Everest 1.9.0|
    | **5.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.8.0-%282025-07-16%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.9.0|


## 🌟 Release highlights

### 🌐 Load Balancer configuration in Percona Everest

Provisioning external access to Kubernetes clusters can be challenging, since cloud providers like AWS, GCP, and Azure each have their own annotations and configurations for LoadBalancers. As a result, users often have to manually adjust settings for each environment, leading to a lack of a unified approach.

Percona Everest simplifies the process by enabling administrators to define **reusable LoadBalancer configurations**. This includes cloud provider-specific settings that can be applied consistently across clusters, ensuring:

- ✅ Consistency across cloud and on-prem environments

- 🔄 Reduced manual effort when provisioning external access

- 🌍 Flexibility to support multiple cloud providers with a unified approach

#### How to create a load balancer configuration

Here’s how you can create a load balancer configuration:
{.power-number}

1. Open **Policies** 

    - Navigate to the Percona Everest home page, go to <i class="uil uil-cog"></i> **Settings > Policies**, and open the **Load Balancer Configuration** section.

    ![!image](../images/load_balancer_config_page.png)

2. Create configuration

    - Click **Create configuration**.

    - Enter a **Configuration name** and click **Create**.

    ![!image](../images/create_config_load_balancer.png)

3. Add Annotations

    - Click **Add new,** then enter the required annotations (key-value pairs).

    ![!image](../images/loadbalancer_add_new_config.png)

    ![!image](../images/key_value_load_balancer.png)

    !!! note
        The **key** and **value** in a Load Balancer configuration for Percona Everest are derived from your Kubernetes environment and the load balancer implementation by your cloud provider.

    ??? example "Examples of keys and values used for Load balancer configuration"

        ```sh
        service.beta.kubernetes.io/aws-load-balancer-type: "nlb"                    # Use Network Load Balancer (NLB)
        service.beta.kubernetes.io/aws-load-balancer-scheme: "internet-facing"        # Internet-facing vs. internal
        service.beta.kubernetes.io/aws-load-balancer-internal: "true"                   # Internal LB
        service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:..."        # Attach ACM SSL cert
        service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "443"                   # SSL termination ports
        service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"        # Protocol between LB and pods
        ```

4. Save configuration

    - Click **Save configuration**, then go **Back** to view the newly created load balancer configuration.

    ![!image](../images/new_created_load_balancer_configurations.png)

## New features

- [EVEREST-548](https://perconadev.atlassian.net/browse/EVEREST-548): Starting with Percona Everest 1.9.0, we have added support for managing `LoadBalancerConfigs`, simplifying how service annotations are applied to database clusters.

## Improvements

- [EVEREST-2002](https://perconadev.atlassian.net/browse/EVEREST-2002): Percona Everest now includes a pre-check mechanism to validate the compatibility of **Custom Resource Definitions (CRDs)** before upgrading. This enhancement helps prevent upgrade failures due to CRD mismatches, ensuring a smoother upgrade process.

- [EVEREST-2101](https://perconadev.atlassian.net/browse/EVEREST-2101): The behavior of the **Add New** button in the **External Access** section has been improved. Now, you can only add a new field after filling in the previously created field with a value.

    This enhancement ensures users complete the required information before adding more entries, reducing unnecessary blank fields and improving the overall user experience.

- [EVEREST-2114](https://perconadev.atlassian.net/browse/EVEREST-2114): The search and filter options now always remain visible on the left side, ensuring a consistent layout and easier navigation.

- [EVEREST-2165](https://perconadev.atlassian.net/browse/EVEREST-2165): We have added a s**how password** toggle in the **PMM monitoring endpoint** form. This feature helps us verify if we have entered the correct password.

- [EVEREST-2244](https://perconadev.atlassian.net/browse/EVEREST-2244): Load balancer config field changes


## Bug fixes

- [EVEREST-1012](https://perconadev.atlassian.net/browse/EVEREST-1012): When creating a new PostgreSQL database using Point-in-Time Recovery (PITR), the restore page previously displayed no information after the database was restored. This issue has been resolved, and the restore page now correctly shows the restore details

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961): We have fixed an issue that allowed users to enter invalid monitoring endpoint URLs when editing a monitoring instance, due to a lack of proper validation. This caused databases (MySQL, MongoDB, and PostgreSQL) with scheduled backups and Point-in-Time Recovery (PITR) enabled to restart unexpectedly. Also, it failed to verify the username and password, even for valid URLs.

- [EVEREST-2017](https://perconadev.atlassian.net/browse/EVEREST-2017): Previously, restoring a backup from one cluster to a new cluster using MinIO storage with Percona XtraDB Cluster (PXC) failed. This issue has been fixed. Backups stored in MinIO can now be successfully restored to new clusters.

- [EVEREST-2031](https://perconadev.atlassian.net/browse/EVEREST-2031): The **Create Policy** page previously expanded when an error message was shown. We've resolved the issue now, and it displays errors without affecting the page layout.

- [EVEREST-2092](https://perconadev.atlassian.net/browse/EVEREST-2092): Upgrades using `everestctl` failed when the initial installation was older than version 1.4.0 and had been successively upgraded to version 1.7.0. The issue has now been resolved.

- [EVEREST-2097](https://perconadev.atlassian.net/browse/EVEREST-2097): In the **Topology Diagram** view, the restart information on database cluster cards was misaligned and appeared outside the component card, disrupting the visual layout. This issue has been resolved, and the information now displays correctly within the card.

- [EVEREST-2105](https://perconadev.atlassian.net/browse/EVEREST-2105): When creating a database from a backup, no error message was displayed on the **Basic Information** page if the original database name was too long. Now, a clear message will appear on the **Basic Information** page if the name exceeds the allowed length.

- [EVEREST-2142](https://perconadev.atlassian.net/browse/EVEREST-2142): When creating a PostgreSQL database, the **Host** field was updating automatically, but the **Username**, **Password**, and **Connection URL** fields remained empty until the page was manually refreshed. This issue has now been resolved, and all connection details automatically populate once the database is created.

- [EVEREST-2148](https://perconadev.atlassian.net/browse/EVEREST-2148): [Operator] Fixed an issue where creating a database from a backup failed if the original database's user secret did not conform to the required naming convention.

- [EVEREST-2153](https://perconadev.atlassian.net/browse/EVEREST-2153): Fixed a bug where imported secrets were not deleted if the database was removed during the import process.

- [EVEREST-2202](https://perconadev.atlassian.net/browse/EVEREST-2202): Previously, database imports failed if the database name exceeded 16 characters. The issue has been resolved now.

- [EVEREST-2206](https://perconadev.atlassian.net/browse/EVEREST-2206): Resolved an issue that caused Single Sign-On (SSO) to be disabled after upgrading from version 1.6.0 to 1.7.0.


- [EVEREST-2207](https://perconadev.atlassian.net/browse/EVEREST-2207): Resolved an issue that prevented the successful upgrade of Percona Everest.


- [EVEREST-2211](https://perconadev.atlassian.net/browse/EVEREST-2211): Previously, PostgreSQL databases would fail to start and crash after performing a Point-in-Time Recovery (PITR). This issue has been resolved, and PostgreSQL now starts up and operates normally after a PITR restoration.

- [EVEREST-2212](https://perconadev.atlassian.net/browse/EVEREST-2212): The PMM Client previously consumed excessive memory when monitoring was enabled for any database instance. The issue has been resolved now.

- [EVEREST-2214](https://perconadev.atlassian.net/browse/EVEREST-2214): Percona Everest upgrades previously failed if the `everest-system` and `everest-monitoring` namespaces had the label `app.kubernetes.io/managed-by=everest`. The issue has been resolved now.

- [EVEREST-2216](https://perconadev.atlassian.net/browse/EVEREST-2216): Fixed an issue that caused the Pod Scheduling Policy field to reset to enabled after clicking the **Continue** or **Previous** buttons.


- [EVEREST-2100](https://perconadev.atlassian.net/browse/EVEREST-2100): After upgrading Everest, editing a cluster with a duplicate IP/Netmask disabled the Save button without displaying an error message. The issue has been resolved now.

- [EVEREST-2096](https://perconadev.atlassian.net/browse/EVEREST-2096): Addressed multiple issues with the External Access field's behavior, validation, and usability during cluster creation and editing.

- [EVEREST-2228](https://perconadev.atlassian.net/browse/EVEREST-2228): Previously, installing Everest on OpenShift caused the Operator Lifecycle Manager (OLM) CRDs from the Helm chart to overwrite existing OLM CRDs on the cluster, leading to unexpected behavior and compatibility issues. The issue has been resolved now.


## 🚀 Ready to Upgrade?

Upgrade to **Percona Everest 1.9.0** to access these new features and improvements.

📖 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.