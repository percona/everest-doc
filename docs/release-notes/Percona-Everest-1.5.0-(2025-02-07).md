# What's new in Percona Everest 1.5.0

!!! warning
    Google Container Registry (GCR) is scheduled to be deprecated and will officially shut down on March 18, 2025. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date. We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible. If you do not upgrade, Percona Everest will no longer function.

    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Role-based access control (RBAC) Generally Available (GA)](#role-based-access-control-rbac-now-generally-available-ga-in-percona-everest)|RBAC is now GA with Percona Everest 1.5.0 |
    | **2.**|[RBAC: Integration with IdP groups](#streamlining-role-based-access-control-with-enhanced-idp-group-integration)|Assign RBAC policies to user groups obtained from an external IdP|
    | **3.**|[Operators support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282025-01-07%29.html#__tabbed_1_4)|Support for PXC operator 1.16.1 and PSMDB operator 1.19.1|
    | **4.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.5.0|
    | **5.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.5.0|
    | **6.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.5.0|
    | **7.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.5.0|


## Release highlights

### Role-based access control (RBAC) now Generally Available (GA) in Percona Everest

We’re delighted to unlock the GA of RBAC in Percona Everest 1.5.0!

With RBAC, only authorized individuals can access specific resources or perform certain actions based on their assigned roles. This update introduces:

- [Granular access management](https://docs.percona.com/everest/administer/rbac.html): Allocate roles with detailed permissions to ensure precise access control.

- [Enhanced security](https://docs.percona.com/everest/administer/Idp_integration.html): Restrict access to authorized users and teams only.

- [Enhanced IdP integration](https://docs.percona.com/everest/administer/Idp_groups_integration.html): Integrate with your Identity Provider to streamline the authentication process and effectively manage the assignment of user roles.

**Upgrade to Percona Everest today** to unlock RBAC for improved security and a more streamlined experience!

### Streamlining Role-Based Access Control with enhanced IdP group integration

Starting with Percona Everest 1.5.0, you can now assign RBAC policies to user groups obtained from the external IDP. This enhancement simplifies permissions management for external users without the need for unique **sub IDs**. To use IdP groups in Percona Everest RBAC, you must set up the **groups** claim in your IdP provider configuration.


Configure your Identity Provider (IdP) to provide the user's groups claim by following our [documentation](https://docs.percona.com/everest/administer/Idp_groups_integration.html)

To retrieve the IdP groups, you need to include the `groups` scope by specifying the following fields:

       everestctl settings oidc configure --issuer-url=http://url.com --client-id=<your-app-client-id> --scopes openid,profile,email,groups

Take a look at the descriptions of the various fields in the table below:

 **Field**|**Description**|
 |--------|---------------|
 |**openid**|Grants access to the user’s identity, which is necessary for OIDC flows to issue an ID token with a unique identifier (subject **sub**).|
  |**profile**|Grants access to basic profile information.|
  |**email**|Grants access to the user’s email address and its verification status.|
    |**groups**|Grants access to obtain information about the user’s group memberships.|

To explore further, dive into our [documentation](https://docs.percona.com/everest/administer/Idp_groups_integration.html).


### Operators support

We have added support for the operators PXC v1.16.1 and PSMDB 1.19.1.

## New features

- [EVEREST-1799](https://perconadev.atlassian.net/browse/EVEREST-1799): Starting with Percona Everest 1.5.0, you can now assign RBAC policies to user groups obtained from an external IDP. This change simplifies permissions management for external users without the need for unique **sub IDs**. 

- [EVEREST-1547](https://perconadev.atlassian.net/browse/EVEREST-1547): After performing an Everest upgrade, you will now receive a notification indicating that the upgrade has been completed. You can then access all the new features by clicking the **Reload** button.

- [EVEREST-1549](https://perconadev.atlassian.net/browse/EVEREST-1549): We have added support for PXC operator v1.16.1.

- [EVEREST-1884](https://perconadev.atlassian.net/browse/EVEREST-1884): We have added support for PSMDB operator v1.19.1.

- (EVEREST-689)[https://perconadev.atlassian.net/browse/EVEREST-689]: We have added a new option to hide and unhide the password in the password form field on the login page.


## Improvements

- [EVEREST-970](https://perconadev.atlassian.net/browse/EVEREST-970): Our default backup schedule has been updated from **Hourly** to **Daily**, starting at 1:00 AM.

- [EVEREST-1796](https://perconadev.atlassian.net/browse/EVEREST-1796): You can now see a more precise and informative message on the **Backups & PITR** widget if no active schedules exist.


- [EVEREST-1579](https://perconadev.atlassian.net/browse/EVEREST-1579): We have enhanced the shard **Topology** by modifying the label from **Nodes** to **Nodes per shard**. This change provides greater clarity on the distribution of nodes across each shard. Additionally, we now display the total number of nodes within the **Database summary** panel, giving you a more complete and insightful overview of your database.

- [EVEREST-1612](https://perconadev.atlassian.net/browse/EVEREST-1612): 
The `everestctl version` command has been updated to provide  information about the version of the Everest server currently installed on your system, if applicable. This enhancement enables you to quickly verify the server version that is in use.


- [EVEREST-1788](https://perconadev.atlassian.net/browse/EVEREST-1788),[EVEREST-1790](https://perconadev.atlassian.net/browse/EVEREST-1790): The `everestctl namespaces remove`, and `everestctl namespaces update` commands now show a help message that guides you on how to use them.


- [EVEREST-1794](https://perconadev.atlassian.net/browse/EVEREST-1794): We have improved the description of the help text for the `--keep-namespace` flag in the `everestctl namespaces remove` command. Previously, the flag did not clearly explain that it retains the namespace in Kubernetes while only removing `everest-managed` resources, which led to confusion.

- [EVEREST-1795](https://perconadev.atlassian.net/browse/EVEREST-1795): When attempting to update a namespace using `everestctl` that was created with `kubectl` (not managed by Percona Everest), the error message was unclear. It did not provide actionable steps for the user to resolve the issue. We have improved the error message to give more insights into the issue.


- [EVEREST-1190](https://perconadev.atlassian.net/browse/EVEREST-1190): You can now easily find out which account you’re using to log into Everest by clicking the Profile button. This button shows the user's name or email address used to log into Percona Everest.


## Bugs

- [EVEREST-1261](https://perconadev.atlassian.net/browse/EVEREST-1261): We fixed an issue where a user who had already added a backup storage location received an incorrect error message when trying to add another one with the same bucket name and URL.


- [EVEREST-1401](https://perconadev.atlassian.net/browse/EVEREST-1401):
Now, when you create/edit the database cluster with sharding enabled for PSMDB, it will display the correct resources required for the specified number of shards.

- [EVEREST-1537](https://perconadev.atlassian.net/browse/EVEREST-1537):
We have resolved an issue that caused Percona Everest uninstallation to fail when attempting to delete database clusters due to a timeout.


- [EVEREST-1581](https://perconadev.atlassian.net/browse/EVEREST-1581): The database remained in a **Deleting** state despite all components being deleted. The issue has now been resolved.

- [EVEREST-1588](https://perconadev.atlassian.net/browse/EVEREST-1588): We have fixed an issue where the PostgreSQL database was stuck in an **initializing** state after a restore.

- [EVEREST-1589](https://perconadev.atlassian.net/browse/EVEREST-1589): We have fixed an issue in which the MySQL database remained stuck in an **initializing** state for a 1-node cluster.

- [EVEREST-1647](https://perconadev.atlassian.net/browse/EVEREST-1647): Creating a monthly schedule on day 1 at 12:00 AM (the default option when **choosing Monthly**) led to an error for PSMDB. The issue has been resolved now.

- [EVEREST-1674](https://perconadev.atlassian.net/browse/EVEREST-1674): The message **Enforce did not pass** appeared randomly in the UI. Additionally, databases in the UI occasionally disappeared and then reappeared after a few seconds. We have now resolved the issue.


- [EVEREST-1724](https://perconadev.atlassian.net/browse/EVEREST-1724): Sharding no longer resets to its default setting (disabled) when navigating back in the database creation wizard.


- [EVEREST-1728](https://perconadev.atlassian.net/browse/EVEREST-1728): The database list now refreshes automatically whenever new databases are deployed in recently created namespaces, and this update is reflected across various browser sessions.

- [EVEREST-1758](https://perconadev.atlassian.net/browse/EVEREST-1758): The **Create Database** button on the UI was inaccessible until the page was manually refreshed after adding a namespace using the `everestctl namespaces add` command. The issue has been resolved now.

- [EVEREST-1729](https://perconadev.atlassian.net/browse/EVEREST-1729): Installation fails if Percona Everest 1.3.0 release CLI is used to install 1.4.0.

- [EVEREST-1735](https://perconadev.atlassian.net/browse/EVEREST-1735): We have fixed an issue where incorrect information appeared on the **PITR Edit** button when PITR was enabled.


- [EVEREST-1800](https://perconadev.atlassian.net/browse/EVEREST-1800): We fixed an issue where users could not create a DB cluster because the DB version was not displayed with a specific RBAC policy.

- [EVEREST-1801](https://perconadev.atlassian.net/browse/EVEREST-1801): The **Create DB cluster** option was not visible on the UI if the user did not have the permissions for all the database engines. The issue has been resolved now.

- [EVEREST-1802](https://perconadev.atlassian.net/browse/EVEREST-1802): A given namespace was not visible on the UI if the user lacked permissions for all database engines in that namespace. This issue has now been resolved.


- [EVEREST-1803](https://perconadev.atlassian.net/browse/EVEREST-1803): 
We have fixed an issue that prevented users from editing or adding monitoring to an existing DB cluster with a specific RBAC policy.

- [EVEREST-1804](https://perconadev.atlassian.net/browse/EVEREST-1804): The Operator Upgrade option was previously not visible on the UI when users didn't have access to all DB clusters in a namespace. This issue has now been resolved.

- [EVEREST-1811](https://perconadev.atlassian.net/browse/EVEREST-1811): `everest-operator` now restarts seamlessly when a DB operator is installed for the first time.


- [EVEREST-688](https://perconadev.atlassian.net/browse/EVEREST-688): You will be logged out from all tabs when you log out from one tab or attempt to perform any action, as per the expected behavior.

- [EVEREST-864](https://perconadev.atlassian.net/browse/EVEREST-864): When a user created a database cluster and changed the namespace from A—which had backup storage configured—to a different namespace that did not have a backup storage location, the user interface only reset the values related to Basic Cluster Information and Resources. However, it failed to reset other values in the form, including those related to Backups, Point-in-Time Recovery (PITR), Advanced Configurations, and Monitoring. The issue has been resolved now.

- [EVEREST-1787](https://perconadev.atlassian.net/browse/EVEREST-1787): After clicking **Create Database** and returning to the database view page, there was a short delay with a **Loading** button before the **Create Database** button appeared. This issue has been resolved now.

- [EVEREST-1792](https://perconadev.atlassian.net/browse/EVEREST-1792): We have significantly reduced the delay between the loading of fields and their labels.

- [EVEREST-1053](https://perconadev.atlassian.net/browse/EVEREST-1053): Restores now have different names for different database clusters. We have also implemented a standard naming convention for the restored databases that contains the database name/backup name with time.

- [EVEREST-1808](https://perconadev.atlassian.net/browse/EVEREST-1808): The content within the textbox was not fully visible when no backups had been created. The issue has been resolved now.


## Known limitations

- PSMDB Operator version 1.19.1 added support for MongoDB version 8.0. However, due to potential issues with point-in-time recovery on MongoDB 8.0 when sharding is enabled, the recommended MongoDB version is still 7.0.

- When restoring a database with Point-in-Time Recovery (PITR), it does not allow changes to the time between the most recent successful backup and the latest PITR. The time is automatically reset to align with the latest PITR.





