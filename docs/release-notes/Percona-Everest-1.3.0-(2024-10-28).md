# What's new in Percona Everest 1.3.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


## Release summary

|**Sr. No**|**Release summary**|**Description**|
|---------|---------------------|---------|
| **1.**  |[MongoDB Sharding](#sharding)|Introducing **sharding** in Percona Everest: Optimize your MongoDB databases with sharding|
| **2.**  |[Configure proxy nodes](#capability-to-configure-proxy-nodes-and-define-their-resource-limits)|Configure proxy nodes and define their resource limits|
| **3.**  |[PSMDB Operator v1.17.0 support](#support-for-psmdb-operator-v1170)|Support for PSMDB Operator v1.17.0 in Percona Everest|
| **4.**|[New features](#new-features)|Check out the new features introduced in Percona Everest 1.3.0|
| **5.**|[Improvements](#improvements)|Discover all the enhancements featured in Percona Everest 1.3.0|
| **6.**|[New and deprecated API's](#the-latest-in-apis-whats-new-and-whats-deprecated)|Discover all the new APIs that have been added to Percona Everest 1.3.0, as well as any deprecated APIs|
| **7.**|[Bugs](#bugs)|Find out about all the bugs fixed in Percona Everest 1.3.0|
| **8.**|[Known limitations](#known-limitations)|Discover all the known limitations in Percona Everest 1.3.0|


## Release highlights


=== "Configure proxy nodes"

    ### Capability to configure proxy nodes and define their resource limits

    Starting with Percona Everest 1.3.0, we have introduced a new feature that permits you to customize the number of proxies and their resources, including the allocation of CPU and RAM for each proxy. This feature mirrors the existing capability to customize the number of database engine replicas and allocate resources to them.

    With this feature, you now have more flexibility to customize the resources allocated to proxies according to your needs, thus providing more control over your Percona Everest deployments.


    ![!image](../images/proxies_resources.png)

=== "MongoDB sharding"

    ### Optimize MongoDB with sharding in Percona Everest


    We're excited to announce that we've achieved another milestone with the implementation of MongoDB sharding in Percona Everest 1.3.0. You can now harness the benefits of sharding for your MongoDB databases with Percona Everest.

    [Sharding  :octicons-link-external-16:](https://docs.mongodb.com/manual/reference/glossary/#term-sharding) is used for horizontal database scaling. It distributes a database horizontally across multiple nodes or servers, known as **shards**. Each shard manages a portion of the data, forming a sharded cluster, which enables MongoDB to handle large datasets and high user concurrency effectively.

    The key components of MongoDB sharding are:

    - Shard: Each shard has a subset of the data.
    - Mongos: The query router directs the client queries to the proper shard(s).
    - Config servers: The configuration servers store the cluster's metadata and configuration settings.

    Here's how you can enable sharding:

    On the **Create Database** wizard, select **MongoDB** database and turn on the **Sharded Cluster** toggle.

    ![!image](../images/enable_sharding.png)


=== "Database status details

    ## Display database status details


    Starting with the latest Percona Everest version 1.3.0, you can now quickly monitor the status of your databases right from the database details page for your specific database. This feature saves you time by enabling you to keep an eye on your databases without having to switch to the **database view ** page.


    ![!image](../images/display_db_details.png)


=== "PSMDB Operator v1.17.0"

    ### Support for PSMDB Operator v1.17.0

    Percona Everest now fully supports PSMDB Operator v1.17.0.

## New features

- [EVEREST-1303](https://perconadev.atlassian.net/browse/EVEREST-1303): We have introduced MongoDB sharding in Percona Everest 1.3.0. Now, you can benefit from sharding for your MongoDB databases with Percona Everest. 

- [EVEREST-777](https://perconadev.atlassian.net/browse/EVEREST-777): Previously, you could only customize the database engine replicas and their resources. Now, you have the ability to customize the number of proxy replicas and their resources, including CPU and RAM, during the database creation.


- [EVEREST-1310](https://perconadev.atlassian.net/browse/EVEREST-1310): Previously, you could only customize the database engine replicas and their resources. Now, you have the ability to customize the number of proxy replicas and their resources, including CPU and RAM, while editing the database.


- [EVEREST-1239](https://perconadev.atlassian.net/browse/EVEREST-1239): We've now added support for PSMDB Operator v1.17.0.


### Improvement

[EVEREST-1006](https://perconadev.atlassian.net/browse/EVEREST-1006) \[UI\] Display DB status in DB details

[EVEREST-1208](https://perconadev.atlassian.net/browse/EVEREST-1208) \[UI\] Upgrade DB version \(db detailes widget \+ logic\)

[EVEREST-1211](https://perconadev.atlassian.net/browse/EVEREST-1211) \[UI\] Edit resources \(logic\)

[EVEREST-1459](https://perconadev.atlassian.net/browse/EVEREST-1459) \[UI\] Add 'contact Percona support' action to support menu 

[EVEREST-1460](https://perconadev.atlassian.net/browse/EVEREST-1460) \[UI\] Update login page side container

[EVEREST-1469](https://perconadev.atlassian.net/browse/EVEREST-1469) \[BE\]\[RBAC\] Use globMatch matcher instead of keyMatch

[EVEREST-1470](https://perconadev.atlassian.net/browse/EVEREST-1470) \[CLI\] rbac validate command should be able to accept ConfigMap YAML file

[EVEREST-1533](https://perconadev.atlassian.net/browse/EVEREST-1533) \[UI\] Make the "Upgrade" option clickable for read-only roles to view operator upgrade plan and prerequisites

### Bug

[EVEREST-886](https://perconadev.atlassian.net/browse/EVEREST-886) Postgresql database could not be restored using PITR

[EVEREST-1187](https://perconadev.atlassian.net/browse/EVEREST-1187) \[UI\] PITR is not enabled for postgresql database after creating backup schedules on the Backups page

[EVEREST-1197](https://perconadev.atlassian.net/browse/EVEREST-1197) Mongodb database is not able to come up

[EVEREST-1266](https://perconadev.atlassian.net/browse/EVEREST-1266) \[UI\] Components are shown as green while there are containers that are not ready

[EVEREST-1384](https://perconadev.atlassian.net/browse/EVEREST-1384) \[UI\] Database overview page should display resources more clearly

[EVEREST-1390](https://perconadev.atlassian.net/browse/EVEREST-1390) \[UI\] Components page is refreshed continuously if a database is suspended

[EVEREST-1398](https://perconadev.atlassian.net/browse/EVEREST-1398) \[UI\] Inconsistent time format for backups and restore

[EVEREST-1399](https://perconadev.atlassian.net/browse/EVEREST-1399) Issue with Resource per Node Selection in Database Creation

[EVEREST-1400](https://perconadev.atlassian.net/browse/EVEREST-1400) \[UI\] Number of shards and configuration servers should be defined based on number of database nodes

[EVEREST-1407](https://perconadev.atlassian.net/browse/EVEREST-1407) \[RBAC\] A user that is not added in the rbac config \(not having permissions\) can access certain information on Everest

[EVEREST-1414](https://perconadev.atlassian.net/browse/EVEREST-1414) \[operator\] Do not modify labels not handled by the everest-operator

[EVEREST-1422](https://perconadev.atlassian.net/browse/EVEREST-1422) Restore of a mongodb sharded backup to a new database failed

[EVEREST-1430](https://perconadev.atlassian.net/browse/EVEREST-1430) Unable to return to the namespace settings page after upgrading the database operator in the Percona Everest GUI.

[EVEREST-1444](https://perconadev.atlassian.net/browse/EVEREST-1444) \[UI\] Create database wizard does not display any error if the user does not have database-engines permissions

[EVEREST-1447](https://perconadev.atlassian.net/browse/EVEREST-1447) \[UI\] Edit and delete options for backup schedules should be disabled if the user does not have the permission

[EVEREST-1454](https://perconadev.atlassian.net/browse/EVEREST-1454) \[RBAC\] Add backup storage option is visible while creating a DB cluster, when user does not have permission

[EVEREST-1455](https://perconadev.atlassian.net/browse/EVEREST-1455) \[RBAC\] Monitoring endpoint information not consistent while editing db cluster

[EVEREST-1457](https://perconadev.atlassian.net/browse/EVEREST-1457) \[RBAC\] Add monitoring endpoint option is visible while creating a DB cluster, when user does not have permission

[EVEREST-1464](https://perconadev.atlassian.net/browse/EVEREST-1464) \[UI\] Restore page keeps on getting refreshed if the user does not have restore permissions

[EVEREST-1506](https://perconadev.atlassian.net/browse/EVEREST-1506) \[RBAC\] Unable to edit DB cluster despite having the required permissions

[EVEREST-1510](https://perconadev.atlassian.net/browse/EVEREST-1510) \[UI\] Add storage button is displayed for postgresql database when backup schedules have already been added

[EVEREST-1517](https://perconadev.atlassian.net/browse/EVEREST-1517) No permissions error being displayed on the UI for user lacking permissions

[EVEREST-1524](https://perconadev.atlassian.net/browse/EVEREST-1524) \[UI\] CRD version upgrade becomes inaccessible if the user navigates away from the operator upgrade page

[EVEREST-1525](https://perconadev.atlassian.net/browse/EVEREST-1525) \[UI\] Error message "Monitoring instance <name> is used" not showing on the UI

[EVEREST-1526](https://perconadev.atlassian.net/browse/EVEREST-1526) \[RBAC\] User having no permissions for backup storages able to create a DB cluster with backup schedule using a storage location

[EVEREST-1532](https://perconadev.atlassian.net/browse/EVEREST-1532) \[UI\] Upgrade option missing on the UI when database engine name is passed in RBAC policy 

[EVEREST-1539](https://perconadev.atlassian.net/browse/EVEREST-1539) Mysql and mongodb database does not come up with 2, 4 and 6 nodes

[EVEREST-1541](https://perconadev.atlassian.net/browse/EVEREST-1541) \[UI\] Custom number of nodes do not work for mysql databases

[EVEREST-1544](https://perconadev.atlassian.net/browse/EVEREST-1544) Mysql database does not come up with 3/5 nodes and 1 proxy node

[EVEREST-1545](https://perconadev.atlassian.net/browse/EVEREST-1545) \[UI\] Incorrect number of nodes are displayed during database edit

[EVEREST-1550](https://perconadev.atlassian.net/browse/EVEREST-1550) \[UI\] Dashboard menu for database displays an empty small box

[EVEREST-1551](https://perconadev.atlassian.net/browse/EVEREST-1551) \[UI\] Upgrade button is being displayed when there are no new operator versions available for upgrade

[EVEREST-1555](https://perconadev.atlassian.net/browse/EVEREST-1555) MySQL cluster stuck in initializing state

[EVEREST-1557](https://perconadev.atlassian.net/browse/EVEREST-1557) \[UI\] Incorrect resource values set for proxies when editing the DB

### New Feature


[EVEREST-1239](https://perconadev.atlassian.net/browse/EVEREST-1239) Add support for PSMDB Operator v1.17.0

[EVEREST-1303](https://perconadev.atlassian.net/browse/EVEREST-1303) Enable MongoDB sharding during DB creation in the wizard

[EVEREST-1310](https://perconadev.atlassian.net/browse/EVEREST-1310) \[UI\] Customize proxy replicas and resources during editing from the DB details view

### Overhead

[EVEREST-1353](https://perconadev.atlassian.net/browse/EVEREST-1353) Use PG backup name in dbb 

[EVEREST-1462](https://perconadev.atlassian.net/browse/EVEREST-1462) PXC: use LatestRestorableTime

[EVEREST-1463](https://perconadev.atlassian.net/browse/EVEREST-1463) PSMDB: use LatestRestorableTime

[EVEREST-1490](https://perconadev.atlassian.net/browse/EVEREST-1490) \[UI\] \[Refactoring\] Combine actions menu into one function

[EVEREST-1498](https://perconadev.atlassian.net/browse/EVEREST-1498) \[API\] Remove deprecated API endpoints

[EVEREST-1499](https://perconadev.atlassian.net/browse/EVEREST-1499) \[docs\] Everest 1.3.0

### Technical task

[EVEREST-995](https://perconadev.atlassian.net/browse/EVEREST-995) \[UI\] \[Storybook\] \[S\] Select

[EVEREST-1044](https://perconadev.atlassian.net/browse/EVEREST-1044) \[UI\] \[Storybook\] \[S\] Typography

[EVEREST-1256](https://perconadev.atlassian.net/browse/EVEREST-1256) \[API\] Add connection URL to database-cluster-credentials endpoint

[EVEREST-1268](https://perconadev.atlassian.net/browse/EVEREST-1268) \[UI\] Add ready status to the containers in the components view

[EVEREST-1305](https://perconadev.atlassian.net/browse/EVEREST-1305) \[API\] expose MongoDB sharding/config server options

[EVEREST-1306](https://perconadev.atlassian.net/browse/EVEREST-1306) \[UI\] Add MongoDB sharding/config server inputs and toggle

[EVEREST-1405](https://perconadev.atlassian.net/browse/EVEREST-1405) \[UI\] Update sharding wizard

[EVEREST-1522](https://perconadev.atlassian.net/browse/EVEREST-1522) \[UI\] Integrated progress loader to dialog

### Epic

[EVEREST-353](https://perconadev.atlassian.net/browse/EVEREST-353) MongoDB sharded cluster




