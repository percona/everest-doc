# What's new in Percona Everest 1.5.0

!!! warning
    Google Container Registry (GCR) is scheduled to be deprecated and will officially shut down on March 18, 2025. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date. We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible. If you do not upgrade, Percona Everest will no longer function.

    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|RBAC: Integration with IdP groups|Assign RBAC policies to user groups obtained from an external IdP.|
    | **2.**|[Operators support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_4)|Support for PXC operator 1.16.1|
    | **3.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.5.0|
    | **4.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.5.0|
    | **5.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.5.0|
    | **6.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.5.0|


## Release highlights

### Streamlining Role-Based Access Control with IdP group integration

Starting with Percona Everest 1.5.0, you can now assign RBAC policies to user groups obtained from the external IDP. This enhancement simplifies permissions management for external users without the need for unique **sub** IDs.

A user will be authorized to perform an operation if either their subject or any of the groups they belong to has the required permission. To use IdP groups in Percona Everest RBAC, you would need to set up the groups claim in your IdP provider configuration.

During the SSO authentication, if the group’s scope is requested but the Identity Provider (IdP) lacks the necessary groups claim configuration or does not support it by default, SSO could fail or not function as expected.

To retrieve the OIDC groups, you need to include the scope by specifying the following fields:

`--scopes openid,profile,email,groups`

Take a look at the descriptions of the various fields in the table below:

 **Field**|**Description**|
 |--------|---------------|
 |**scopes openid**|Grants access to the user’s identity, necessary for OIDC flows to issue an ID token with the unique identifier (subject sub).|
  |**profile**|Grants access basic profile information.|
  |**email**|Grants access to the user’s email address and its verification status.|
    |**groups**|Grants access to obtain information about the user’s group memberships.|

### Operators support

We have added support for PXC operator v1.16.1.

## New features

- [EVEREST-1547](https://perconadev.atlassian.net/browse/EVEREST-1547): After performing an Everest upgrade, you will now receive a notification indicating that the upgrade has been completed. You can then access all the new features by clicking the **Reload** button.

- [EVEREST-1549](https://perconadev.atlassian.net/browse/EVEREST-1549): We have added support for PXC operator v1.16.1.

- [EVEREST-1605](https://perconadev.atlassian.net/browse/EVEREST-1605): Starting with Percona Everest 1.5.0, you have the ability to configure Kubernetes affinity rules for specific database components in the **Advanced Configuration** section of the database creation wizard. This enables you to manage workload distribution across your Kubernetes cluster, optimize resource utilization and boosting the high availability of each component.

- [EVEREST-1606](https://perconadev.atlassian.net/browse/EVEREST-1606): You can now configure Kubernetes affinity rules for specific database components in the **Components** tab of an existing database.


- [EVEREST-1607](https://perconadev.atlassian.net/browse/EVEREST-1607): You can now view the current status of your affinity configuration from the DB Overview tab. From there, you can directly navigate to the Affinity section in the Components tab to modify the rules. This will enable you to monitor and adjust the Kubernetes affinity settings for your database components.

- [EVEREST-1799](https://perconadev.atlassian.net/browse/EVEREST-1799): Starting with Percona Everest 1.5.0, you can now assign RBAC policies to user groups obtained from an external IDP. This change simplifies permissions management for external users without the need for unique **sub** IDs. 


## Improvements

- [EVEREST-970](https://perconadev.atlassian.net/browse/EVEREST-970): Our default schedule has been updated from **Hourly** to **Daily**, starting at 1:00 AM.


- [EVEREST-1066](https://perconadev.atlassian.net/browse/EVEREST-1066) \[UI\] Backups \(widget\)


- [EVEREST-1190](https://perconadev.atlassian.net/browse/EVEREST-1190): You can now easily find out which account you’re using to log into Everest by clicking the Profile button. This button shows the email ID used to log into Percona Everest.


- [EVEREST-1579](https://perconadev.atlassian.net/browse/EVEREST-1579): We have enhanced the shard **Topology** by modifying the label from **Nodes** to **Nodes per shard**. This change provides greater clarity on the distribution of nodes across each shard. Additionally, we now display the total number of nodes within the **Database summary** panel, giving you a more complete and insightful overview of your database.

- [EVEREST-1612](https://perconadev.atlassian.net/browse/EVEREST-1612): 
The `everestctl version` command has been updated to provide  information about the version of the Everest server that is currently installed on your system, if applicable. This enhancement enables you to easily verify the server version in use.


- [EVEREST-1718](https://perconadev.atlassian.net/browse/EVEREST-1718) \[UI\] Add loading bar when operators are being upgraded


- [EVEREST-1788](https://perconadev.atlassian.net/browse/EVEREST-1788),[EVEREST-1790](https://perconadev.atlassian.net/browse/EVEREST-1790): The `everestctl namespaces remove` and `everestctl namespaces update` commands now show a help message that guides you on how to use them.


- [EVEREST-1794](https://perconadev.atlassian.net/browse/EVEREST-1794): We have improved the description of the help text for the `--keep-namespace` flag in the `everestctl namespaces remove` command. Previously, the flag did not clearly explain that it retains the namespace in Kubernetes while only removing `everest-managed` resources, which led to confusion.

- [EVEREST-1795](https://perconadev.atlassian.net/browse/EVEREST-1795): When attempting to update a namespace using `everestctl` that was created with `kubectl` (not managed by Percona Everest), the error message was unclear. It did not provide actionable steps for the user to resolve the issue. We have improved the error message to give more insights into the issue.


## Bugs

- [EVEREST-1261](https://perconadev.atlassian.net/browse/EVEREST-1261): We fixed an issue where a user who had already added a backup storage location received an incorrect error message when trying to add another one with the same bucket name and URL.


- [EVEREST-1401](https://perconadev.atlassian.net/browse/EVEREST-1401):
Now, when you create/edit the database cluster with sharding enabled for PSMDB, it will display the correct resources required for the specified number of shards.

- [EVEREST-1537](https://perconadev.atlassian.net/browse/EVEREST-1537):
We have resolved an issue that caused Percona Everest uninstallation to fail when attempting to delete database clusters due to a timeout.


- [EVEREST-1581](https://perconadev.atlassian.net/browse/EVEREST-1581): The database remained in a **Deleting** state, despite all components being deleted. The issue has now been resolved.

- [EVEREST-1588](https://perconadev.atlassian.net/browse/EVEREST-1588): We have fixed an issue where the PostgreSQL database was stuck in an **initializing** state after a restore.

- [EVEREST-1589](https://perconadev.atlassian.net/browse/EVEREST-1589): We have fixed an issue where the MySQL database reamined stuck in an **initializing** state for 1-node cluster.

- [EVEREST-1590](https://perconadev.atlassian.net/browse/EVEREST-1590) Installation is stuck

- [EVEREST-1647](https://perconadev.atlassian.net/browse/EVEREST-1647): When creating a monthly schedule on day 1 at 12:00 AM (the default option when choosing **Monthly**), it led to an error for PSMDB. The issue has been resolved now.

- [EVEREST-1674](https://perconadev.atlassian.net/browse/EVEREST-1674): The message **Enforce did not pass** appeared randomly in the UI. Additionally, databases in the UI sometimes disappeared and then reappeared after a few seconds. We have now resolved the issue.


- [EVEREST-1724](https://perconadev.atlassian.net/browse/EVEREST-1724): Sharding no longer resets to its default setting (disabled) when navigating back in the database creation wizard.


- [EVEREST-1728](https://perconadev.atlassian.net/browse/EVEREST-1728): The database dashboard now updates automatically when you create databases in different namespaces across various browser sessions.


- [EVEREST-1729](https://perconadev.atlassian.net/browse/EVEREST-1729): Installation fails if 1.3.0 release cli is used to install 1.4.0

- [EVEREST-1735](https://perconadev.atlassian.net/browse/EVEREST-1735): We have fixed an issue where incorrect information appeared on the **PITR Edit** button when PITR was enabled.


- [EVEREST-1758](https://perconadev.atlassian.net/browse/EVEREST-1758): The **Create Database** button on the UI was inaccessible until the page was manually refreshed after adding a namespace using the `everestctl namespaces add` command. The issue has been resolved now.


- [EVEREST-1800](https://perconadev.atlassian.net/browse/EVEREST-1800): We fixed an issue where users could not create a DB cluster because the DB version was not displayed with a specific RBAC policy.

- [EVEREST-1801](https://perconadev.atlassian.net/browse/EVEREST-1801): Create DB cluster option was not visible on the UI if user did not have the permissions for all the database engines. The issue has been resolved now.

- [EVEREST-1802](https://perconadev.atlassian.net/browse/EVEREST-1802): Create DB cluster option was not visible on the UI if the user lacked permissions for all database engines. This issue has now been resolved.


- [EVEREST-1803](https://perconadev.atlassian.net/browse/EVEREST-1803): 
We have fixed an issue that prevented users from editing or adding monitoring to an existing DB cluster with a specific RBAC policy.

- [EVEREST-1804](https://perconadev.atlassian.net/browse/EVEREST-1804): The Operator Upgrade option was previously not visible on the UI when users had access to all DB clusters in a namespace. This issue has now been resolved.

- [EVEREST-1811](https://perconadev.atlassian.net/browse/EVEREST-1811) The everest-operator now restarts seamlessly when a DB operator is installed for the first time.







