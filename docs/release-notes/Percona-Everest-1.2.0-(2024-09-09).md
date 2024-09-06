# What's new in Percona Everest 1.2.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


## Release summary

|**Sr. No**|**Release summary**|**Description**|
|---------|---------------------|---------|
| 1.      |- [RBAC](#introducing-rbac-in-percona-everest-ensure-security-and-simplify-database-access-management)|Introducing RBAC in Percona Everest: Ensure security and simplify database access management|
| 2.|[API changes for RBAC](#percona-everest-v120-a-deep-dive-into-breaking-api-changes)|Percona Everest v1.2.0: A deep dive into Breaking API changes|
| 3.|[MongoDB sharding](#sharding-in-percona-everest-optimizing-mongodb-for-enhanced-scalability) |Exploring the Benefits of MongoDB Sharding in Percona Everest|
| 4.|[Operator upgrades](#improved-mulitple-operator-upgrades)|Improved mulitple operator upgrades|
| 5.|[New features](#new-features)|Check out the new features introduced in Percona Everest 1.2.0|
| 6.|[Improvements](#improvements)|Discover all the enhancements featured in Percona Everest 1.2.0|
| 7.|[Bugs](#bugs)|Find out about all the bugs fixed in Percona Everest 1.2.0|


## Release highlights


### Introducing RBAC in Percona Everest: Ensure security and simplify database access management

Starting with Percona Everest 1.2.0, we’ve enhanced our platform by introducing Role-Based Access Control (RBAC), which regulates resource access for better management and security.

With RBAC, only authorized individuals can access specific resources or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.

Here's a breakdown of the key concepts in RBAC:

- [Roles](https://docs.percona.com/everest/administer/rbac.html#default-role) - Roles are a set of permissions that allow users to access and carry out various tasks within Percona Everest.

- [RBAC resources and privileges](https://docs.percona.com/everest/administer/rbac.html#rbac-resources-and-privileges): Resources are the entities or objects within Percona Everest that require controlled access. Privileges specify the particular actions that a role is able to perform on a resource.

- [Policy definition](https://docs.percona.com/everest/administer/rbac.html#policy-definition-in-rbac): RBAC policies are the rules and guidelines that define how roles, permissions, and users are managed within RBAC.


    The policy definition in Percona Everest is:

        ```sh
        p, <subject>, <resource-type>, <action>, <resource-name>
        ```

- [Role assignment](https://docs.percona.com/everest/administer/rbac.html#assigning-roles-to-users): Assigning specific roles to individual users within Percona Everest is crucial for the roles to be effective.

    The syntax for assigning a role is as follows:

    ```sh
    g, username, rolename
    ```

Explore our comprehensive [documentation](https://docs.percona.com/everest/administer/rbac.html) for everything you need to know about RBAC.


#### Percona Everest v1.2.0: A deep dive into Breaking API changes

Beginning with Percona Everest v1.2.0, breaking changes are being introduced to the API for `monitoring-instances` and `backup-storages` resources. These updates include:

- Before the release of Percona Everest 1.2.0, the resources `monitoring-instances` and  `backup-storages` had a global scope. Earlier, Percona Everest used a `.spec.allowedNamespaces` field to control access to these global resources. This field defined the namespaces where the resources could be accessed, thus providing some degree of access control.

- With the upgrade to Percona Everest version 1.2.0, the transition from global scope to the designated namespaces for these resources is an important change in the way access control is managed. This improves security as the resources are only accessible within their designated namespaces. The database clusters can only use `monitoring-instances` and `backup-storages` located within the same namespace as the cluster.

- When upgrading to 1.2.0 using the CLI command `everestctl upgrade`, all your existing `backup-storages` and `monitoring-instances` will be automatically migrated to the namespaces specified in their `.spec.allowedNamespaces` fields.

    !!! note
        After the upgrade to Percona Everest 1.2.0, you will only be able to access these resources through the new API endpoints.

    Check out our [documentation](docs.percona.com/everest//administer/api_rbac.html#changes-in-the-percona-everest-apis) for in-depth details on the Breaking API changes.


### Exploring the benefits of MongoDB sharding in Percona Everest

[Sharding  :octicons-link-external-16:](https://docs.mongodb.com/manual/reference/glossary/#term-sharding) is used for horizontal database scaling. It distributes a database horizontally across multiple nodes or servers, known as **shards**. Each shard manages a portion of the data, forming a sharded cluster, which enables MongoDB to handle large datasets and high user concurrency effectively.

MongoDB sharding has several key components:

- shard: Each shard has a subset of the data.
- mongos: The query router directs the client queries to the proper shard(s).

    !!! note
        With the current Percona Everest release, the number of routers (mongos) is, by default, set to the number of nodes in your replica set. However, in our upcoming releases, you can customize the number of routers and set resource limits for them.

- config servers: The configuration servers store the cluster's metadata and configuration settings.

#### Enable sharding in Percona Everest

To enable sharding:
{.power-number}

1. On the **Create Database **wizard, select **MongoDB** database and turn on the Sharded Cluster toggle.

    ![!image](../images/enable_sharding.png)


2. To check if sharding is enabled, go to the database view page and click on the specific database. Then, check the **Resources** panel to see if sharding is enabled.


    ![!image](../images/sharding_status.png)


### Improved mulitple operator upgrades


Starting with Percona Everest 1.2.0, we have the capability to upgrade all the database operators concurrently with their components across any namespace using our intuitive UI with just a single click.

Before initiating the upgrade process, Everest provides a comprehensive list of tasks that must be completed to ensure a seamless transition of your clusters to the next version of the database operators.


## New features

- [EVEREST-1035](https://perconadev.atlassian.net/browse/EVEREST-1035): Add backup retention option for PG

- [EVEREST-1103](https://perconadev.atlassian.net/browse/EVEREST-1103): Restrict actions based on RBAC

- [EVEREST-1142](https://perconadev.atlassian.net/browse/EVEREST-1142): Add command for validating RBAC policy

- [EVEREST-1240](https://perconadev.atlassian.net/browse/EVEREST-1240): Add support for PG Operator v2.4.1

- [EVEREST-1298](https://perconadev.atlassian.net/browse/EVEREST-1298): Add support for PXC Operator v1.15.0

- [EVEREST-1303](https://perconadev.atlassian.net/browse/EVEREST-1303): Enable MongoDB sharding during DB creation in the wizard

- [EVEREST-981](https://perconadev.atlassian.net/browse/EVEREST-981): Configure everest to run behind a proxy


## Improvements

- [EVEREST-1165](https://perconadev.atlassian.net/browse/EVEREST-1165) Upgrade all operators in a given namespace at the same time

- [EVEREST-1212](https://perconadev.atlassian.net/browse/EVEREST-1212) \[UI\] Edit monitoring \(widget\+logic\)

- [EVEREST-1230](https://perconadev.atlassian.net/browse/EVEREST-1230) \[UI\] Resources \(widget\) \+ common card updation

- [EVEREST-1250](https://perconadev.atlassian.net/browse/EVEREST-1250) Allow enforcing RBAC for monitoring-instances and backup-storages based on namespaces

- [EVEREST-1257](https://perconadev.atlassian.net/browse/EVEREST-1257) Editing backup-schedules should not be allowed if user cannot create backups

- [EVEREST-1369](https://perconadev.atlassian.net/browse/EVEREST-1369) \[docs\] Update the outdated section about disabling telemetry

- [EVEREST-1392](https://perconadev.atlassian.net/browse/EVEREST-1392) Add internal flag to disable telemetry

## Bugs

- [EVEREST-768](https://perconadev.atlassian.net/browse/EVEREST-768) All postgresql pods do not restart on restarting the database

- [EVEREST-1232](https://perconadev.atlassian.net/browse/EVEREST-1232) \[UI\] Inconsistent date formats

- [EVEREST-1253](https://perconadev.atlassian.net/browse/EVEREST-1253) \[UI\] Delete option in the backup menu should be disabled if the backup is in Deleting status

- [EVEREST-1273](https://perconadev.atlassian.net/browse/EVEREST-1273) Backend sends an empty response if the backup storage url is edited to an http address

- [EVEREST-1279](https://perconadev.atlassian.net/browse/EVEREST-1279) \[UI\] Resources page in DB wizard can show different resources in two places

- [EVEREST-1286](https://perconadev.atlassian.net/browse/EVEREST-1286) \[UI\] Backup name should be disabled for editing in backup schedules

- [EVEREST-1287](https://perconadev.atlassian.net/browse/EVEREST-1287) No ability to change antiAffinityTopologyKey or other affinity settings

- [EVEREST-1315](https://perconadev.atlassian.net/browse/EVEREST-1315) Everest shows a successful upgrade message even if the upgrade was not fully successful.

- [EVEREST-1323](https://perconadev.atlassian.net/browse/EVEREST-1323)  Error on "Components" Page in Percona Everest 0.0.0 After Creating Databases

- [EVEREST-1354](https://perconadev.atlassian.net/browse/EVEREST-1354) \[operator\] Resource limits are not respected

- [EVEREST-1371](https://perconadev.atlassian.net/browse/EVEREST-1371) \[UI\] Monitoring endpoint displays 'username' instead of 'endpoint name' plus other related issues

- [EVEREST-1372](https://perconadev.atlassian.net/browse/EVEREST-1372) Unable to delete monitoring endpoint\(s\) that are not being used currently

- [EVEREST-1375](https://perconadev.atlassian.net/browse/EVEREST-1375) Upgrade to PXC operator 1.15.0 restarts DBs

- [EVEREST-1394](https://perconadev.atlassian.net/browse/EVEREST-1394) \[UI\] Backup storage creation is not available from backups page, schedule creation is disabled in postgresql

- [EVEREST-1400](https://perconadev.atlassian.net/browse/EVEREST-1400) Number of shards and configuration servers should be defined based on number of database nodes



### Technical task

[EVEREST-1096](https://perconadev.atlassian.net/browse/EVEREST-1096) \[BE\] Implement casbin RBAC enforcer

[EVEREST-1104](https://perconadev.atlassian.net/browse/EVEREST-1104) \[BE\] Create endpoint that provides the authenticated user's permissions

[EVEREST-1105](https://perconadev.atlassian.net/browse/EVEREST-1105) \[UI\] Restrict actions based on RBAC

[EVEREST-1246](https://perconadev.atlassian.net/browse/EVEREST-1246) \[UI\] Upgrade all operators in a given namespace at the same time

[EVEREST-1247](https://perconadev.atlassian.net/browse/EVEREST-1247) \[API\] Upgrade all operators in a given namespace at the same time

[EVEREST-1264](https://perconadev.atlassian.net/browse/EVEREST-1264) \[operator\] backup-storages and monitoring-instances should be referenced from the same namespace

[EVEREST-1267](https://perconadev.atlassian.net/browse/EVEREST-1267) \[API\] Add ready field to containers in the components endpoint

[EVEREST-1292](https://perconadev.atlassian.net/browse/EVEREST-1292) \[backend\] Add new APIs for backup-storages and monitoring-instances

[EVEREST-1296](https://perconadev.atlassian.net/browse/EVEREST-1296) \[UI\] Integration with new backup-storages and monitoring-instances APIs

[EVEREST-1305](https://perconadev.atlassian.net/browse/EVEREST-1305) \[API\] expose MongoDB sharding/config server options

[EVEREST-1306](https://perconadev.atlassian.net/browse/EVEREST-1306) \[UI\] Add MongoDB sharding/config server inputs and toggle

[EVEREST-1381](https://perconadev.atlassian.net/browse/EVEREST-1381) \[UI\] Display 'DB status details' under actions menu 

[EVEREST-1382](https://perconadev.atlassian.net/browse/EVEREST-1382) \[UI\] Change the sorting on a table so the "pending" nodes are shown first

[EVEREST-1391](https://perconadev.atlassian.net/browse/EVEREST-1391) \[API\] Add DatabaseCluster Details 

[EVEREST-1404](https://perconadev.atlassian.net/browse/EVEREST-1404) \[API\] Update sharding feature

[EVEREST-1405](https://perconadev.atlassian.net/browse/EVEREST-1405) \[UI\] Update sharding wizard