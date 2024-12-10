# What's new in Percona Everest 1.4.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**  |[Helm charts]()||
    | **2.**  |[MongoDB Sharding](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#__tabbed_1_2)|Introducing **sharding** in Percona Everest: Optimize your MongoDB databases with sharding|

    | **5.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.4.0|
    | **6.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.4.0|
    | **7.**|[Deprecated APIs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#deprecated-api-endpoints)|Discover all the Deprecated APIs from Percona Everest 1.4.0|
    | **8.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.4.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.4.0|


## Release highlights


=== "Helm charts"

    ### Capability to configure proxy nodes and define their resource limits

    Starting with Percona Everest 1.3.0, we have introduced a new feature that permits you to customize the number of proxies and their resources, including the allocation of CPU and RAM for each proxy. This feature mirrors the existing capability to customize the number of database engine replicas and allocate resources to them.

    With this feature, you now have more flexibility to customize the resources allocated to proxies according to your needs, thus providing more control over your Percona Everest deployments.


    ![!image](../images/proxies_resources.png)

=== "MongoDB sharding"

    ### Optimize MongoDB with sharding in Percona Everest

    !!! warning
         - Sharding is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and not in production environments.
        -  Check out the [known limitations](#known-limitations) section for important information about the limitations of sharding.

        - If you reshard or unshard a collection, create a new backup to avoid data inconsistency and restore failure.

    We're excited to announce that we've achieved another milestone with the implementation of MongoDB sharding in Percona Everest 1.3.0. You can now harness the benefits of sharding for your MongoDB databases with Percona Everest.

    [Sharding  :octicons-link-external-16:](https://docs.mongodb.com/manual/reference/glossary/#term-sharding) is used for horizontal database scaling. It distributes a database horizontally across multiple nodes or servers, known as **shards**. Each shard manages a portion of the data, forming a sharded cluster, which enables MongoDB to handle large datasets and high user concurrency effectively.

    The key components of MongoDB sharding are:

    - Shard: Each shard has a subset of the data.
    - Mongos: The query router directs the client queries to the proper shard(s).
    - Config servers: The configuration servers store the cluster's metadata and configuration settings.

    Here's how you can enable sharding:

    On the **Create Database** wizard, select **MongoDB** database and turn on the **Sharded Cluster** toggle.

    ![!image](../images/enable_sharding.png)

    If you're looking to dive deeper into MongoDB sharding, check out the [documentation](https://docs.percona.com/everest/use/mongo_sharding.html).


## New features

[EVEREST-908](https://perconadev.atlassian.net/browse/EVEREST-908) Add connection URL to connection details info card

[EVEREST-1511](https://perconadev.atlassian.net/browse/EVEREST-1511) Install/uninstall with helm

[EVEREST-1512](https://perconadev.atlassian.net/browse/EVEREST-1512) Upgrade with helm

[EVEREST-1599](https://perconadev.atlassian.net/browse/EVEREST-1599) Add support for PG operator v2.5.0

[EVEREST-1624](https://perconadev.atlassian.net/browse/EVEREST-1624) Add support for PSMDB Operator v1.18.0

[EVEREST-1673](https://perconadev.atlassian.net/browse/EVEREST-1673) \[CLI\] New command for provisioning DB namespaces

## Improvement

[EVEREST-1065](https://perconadev.atlassian.net/browse/EVEREST-1065) \[UI\] Remove edit button from database list actions

[EVEREST-1066](https://perconadev.atlassian.net/browse/EVEREST-1066) \[UI\] Backups \(widget\)

[EVEREST-1210](https://perconadev.atlassian.net/browse/EVEREST-1210) \[UI\] Edit advanced configuration \(widget \+ logic\)

[EVEREST-1304](https://perconadev.atlassian.net/browse/EVEREST-1304) \[UI\] Select DB type from DB cluster view before opening DB creation wizard

[EVEREST-1458](https://perconadev.atlassian.net/browse/EVEREST-1458) \[UI\] Refactor empty states - tables 

[EVEREST-1546](https://perconadev.atlassian.net/browse/EVEREST-1546) \[UI\] Number of proxies/routers/bouncers and their resources should be displayed in dashboard and database overview

[EVEREST-1554](https://perconadev.atlassian.net/browse/EVEREST-1554) \[UI\] empty space after adding an helper text with error to the DOM

[EVEREST-1556](https://perconadev.atlassian.net/browse/EVEREST-1556) \[UI\] Increase actions buttons in db details to Large size

[EVEREST-1681](https://perconadev.atlassian.net/browse/EVEREST-1681) \[UI\] Edit PITR action

[EVEREST-1683](https://perconadev.atlassian.net/browse/EVEREST-1683) \[UI\] Backups on the database overview page should be sorted in descending order by Started date and time

[EVEREST-1684](https://perconadev.atlassian.net/browse/EVEREST-1684) \[UI\] Remove blue background from expandable card

[EVEREST-1685](https://perconadev.atlassian.net/browse/EVEREST-1685) \[UI\] Increase spacing in shards section

[EVEREST-1686](https://perconadev.atlassian.net/browse/EVEREST-1686) Use 24h format

[EVEREST-1687](https://perconadev.atlassian.net/browse/EVEREST-1687) \[UI\] Update button label - upgrade crd version

[EVEREST-1688](https://perconadev.atlassian.net/browse/EVEREST-1688) \[UI\] Number fields can change value on scrolling the page

[EVEREST-1701](https://perconadev.atlassian.net/browse/EVEREST-1701) \[RBAC\] database-cluster-backups resource name matches DB name instead of backup name

[EVEREST-1702](https://perconadev.atlassian.net/browse/EVEREST-1702) \[RBAC\] database-cluster-restores resource name matches DB name instead of restore name

## Bugs

[EVEREST-1187](https://perconadev.atlassian.net/browse/EVEREST-1187) \[UI\] PITR is not enabled for postgresql database after creating backup schedules on the Backups page

[EVEREST-1191](https://perconadev.atlassian.net/browse/EVEREST-1191) \[CLI\] Incorrect handling of OIDC issuer URL response parsing

[EVEREST-1235](https://perconadev.atlassian.net/browse/EVEREST-1235) \[CLI\] Improve error messages related to k8s connectivity

[EVEREST-1254](https://perconadev.atlassian.net/browse/EVEREST-1254) \[CLI\] Uninstallation displays a strange code in the end

[EVEREST-1294](https://perconadev.atlassian.net/browse/EVEREST-1294) everestctl is not providing error if it cannot connect to k8s cluster

[EVEREST-1301](https://perconadev.atlassian.net/browse/EVEREST-1301) \[UI\] Mongodb backup schedule can't be created if a schedule with a different backup storage is created in db edit

[EVEREST-1320](https://perconadev.atlassian.net/browse/EVEREST-1320) \[UI\] PITR gap message should come on the Backups page instead of Restores page

[EVEREST-1352](https://perconadev.atlassian.net/browse/EVEREST-1352) \[UI\] All database actions should be disabled if the database is in Deleting status

[EVEREST-1399](https://perconadev.atlassian.net/browse/EVEREST-1399) Issue with Resource per Node Selection in Database Creation

[EVEREST-1407](https://perconadev.atlassian.net/browse/EVEREST-1407) \[RBAC\] A user that is not added in the rbac config \(not having permissions\) can access certain information on Everest

[EVEREST-1440](https://perconadev.atlassian.net/browse/EVEREST-1440) \[UI\] Time lag and Add storage displayed on the Backups page if the user does not have backup storage permissions

[EVEREST-1518](https://perconadev.atlassian.net/browse/EVEREST-1518) \[RBAC\] DB clusters visible and editable for users without permissions for the respective db engine\(s\)

[EVEREST-1534](https://perconadev.atlassian.net/browse/EVEREST-1534) \[RBAC\] '/databases' page does not show any individual dbs from the policy

[EVEREST-1565](https://perconadev.atlassian.net/browse/EVEREST-1565) \[UI\] Mongodb versions are not sorted and some versions are skipped

[EVEREST-1593](https://perconadev.atlassian.net/browse/EVEREST-1593) \[UI\] Sometimes the Display name and Database version are not displayed in a fresh cluster

[EVEREST-1594](https://perconadev.atlassian.net/browse/EVEREST-1594) Scheduled backups start failing after some successful backups for mongodb sharded clusters

[EVEREST-1604](https://perconadev.atlassian.net/browse/EVEREST-1604) \[RBAC\] Create a database from a backup is successful if the user does not have database-engines permissions

[EVEREST-1608](https://perconadev.atlassian.net/browse/EVEREST-1608) \[UI\] Error should be displayed on Resources page if the proxies field has no value

[EVEREST-1611](https://perconadev.atlassian.net/browse/EVEREST-1611) Support for installation on existing namespaces

[EVEREST-1613](https://perconadev.atlassian.net/browse/EVEREST-1613) Issue with Topology Settings Reverting to "Custom" in Percona Everest UI

[EVEREST-1615](https://perconadev.atlassian.net/browse/EVEREST-1615) \[CLI\] Uninstall fails if a mongodb sharded cluster is in Deleting state

[EVEREST-1630](https://perconadev.atlassian.net/browse/EVEREST-1630) "Config Servers" Reset to Default Value of 1 in GUI After Editing Resources

[EVEREST-1642](https://perconadev.atlassian.net/browse/EVEREST-1642) \[UI\] Database version can be changed when restoring to a new database

[EVEREST-1649](https://perconadev.atlassian.net/browse/EVEREST-1649) UI - Backup "Add Storage" Button Inactive After Refresh

[EVEREST-1650](https://perconadev.atlassian.net/browse/EVEREST-1650) UI - Unable to Create Backup After Adding Storage

[EVEREST-1655](https://perconadev.atlassian.net/browse/EVEREST-1655) Everest API should use check-dev in dev/RC builds

[EVEREST-1672](https://perconadev.atlassian.net/browse/EVEREST-1672) Use non-strict decoding when reading response from VS

[EVEREST-1680](https://perconadev.atlassian.net/browse/EVEREST-1680) \[UI\] Connection URL is not being displayed properly

[EVEREST-1694](https://perconadev.atlassian.net/browse/EVEREST-1694) \[RBAC\] Backup storages page is empty if user only has access to a single storage

[EVEREST-1695](https://perconadev.atlassian.net/browse/EVEREST-1695) \[RBAC\] Monitoring instances page is empty if user only has access to a single instance

[EVEREST-1700](https://perconadev.atlassian.net/browse/EVEREST-1700) Database clusters restarted on creation when PMM monitoring enabled

[EVEREST-1703](https://perconadev.atlassian.net/browse/EVEREST-1703) \[UI\] MongoDB sharded cluster is stuck after selecting not enough config serbvers

[EVEREST-1712](https://perconadev.atlassian.net/browse/EVEREST-1712) \[UI\] Pages become unresponsive after a while



### Overhead

[EVEREST-1501](https://perconadev.atlassian.net/browse/EVEREST-1501) \[Research\] OpenShift support

[EVEREST-1513](https://perconadev.atlassian.net/browse/EVEREST-1513) Helm release automation

[EVEREST-1514](https://perconadev.atlassian.net/browse/EVEREST-1514) \[CLI\] install using helm

[EVEREST-1516](https://perconadev.atlassian.net/browse/EVEREST-1516) \[Research\] install everest/vm operator without OLM

[EVEREST-1543](https://perconadev.atlassian.net/browse/EVEREST-1543) \[Research\] Helm chart installation requirements and limitations

[EVEREST-1620](https://perconadev.atlassian.net/browse/EVEREST-1620) Tilt dev environment should use Everest Helm chart

[EVEREST-1682](https://perconadev.atlassian.net/browse/EVEREST-1682) \[UI\] update support link

[EVEREST-1704](https://perconadev.atlassian.net/browse/EVEREST-1704) Hide PXC ConnectionURL

### Technical task

[EVEREST-1255](https://perconadev.atlassian.net/browse/EVEREST-1255) \[UI\] Add connection URL to connection details info card

[EVEREST-1582](https://perconadev.atlassian.net/browse/EVEREST-1582) \[UI\] \`/databases\` page should list and show database-clusters without requiring permissions to read all DBCs

[EVEREST-1585](https://perconadev.atlassian.net/browse/EVEREST-1585) DBEngines should not be created in everest-system and everest-monitoring namespaces

[EVEREST-1696](https://perconadev.atlassian.net/browse/EVEREST-1696) \[RBAC\] \[UI\] Request monitoring instances list even if user has access to a single monitoring instance

[EVEREST-1697](https://perconadev.atlassian.net/browse/EVEREST-1697) \[RBAC\] \[UI\] Request backup storages list even if user has access to a single storage

[EVEREST-1698](https://perconadev.atlassian.net/browse/EVEREST-1698) \[RBAC\] \[BE\] Filter monitoring instances list based on RBAC permissions

[EVEREST-1699](https://perconadev.atlassian.net/browse/EVEREST-1699) \[RBAC\] \[BE\] Filter backup storages list based on RBAC permissions

[EVEREST-1705](https://perconadev.atlassian.net/browse/EVEREST-1705) \[RBAC\] \[UI\] Align permissions for backup actions with new resources

[EVEREST-1706](https://perconadev.atlassian.net/browse/EVEREST-1706) \[RBAC\] \[BE\] Restrict database-cluster-backups access based on the database name

[EVEREST-1707](https://perconadev.atlassian.net/browse/EVEREST-1707) \[RBAC\] \[BE\] Restrict database-cluster-restores access based on the database name

[EVEREST-1708](https://perconadev.atlassian.net/browse/EVEREST-1708) \[RBAC\] \[UI\] Align permissions for restore actions with new resources

[EVEREST-1713](https://perconadev.atlassian.net/browse/EVEREST-1713) \[UI\] Create empty state 

### Epic

[EVEREST-550](https://perconadev.atlassian.net/browse/EVEREST-550) Helm chart for installation

[EVEREST-1116](https://perconadev.atlassian.net/browse/EVEREST-1116) Namespace Management \(adding/removing namespaces and operators\)

[EVEREST-1207](https://perconadev.atlassian.net/browse/EVEREST-1207) Improve Editing DB flows