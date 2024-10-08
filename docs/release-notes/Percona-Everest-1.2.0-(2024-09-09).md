# What's new in Percona Everest 1.2.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


!!! warning
     Percona Everest v1.2.0 introduces breaking changes to the API. Once you upgrade to version 1.2.0, the process cannot be reversed.


## Release summary

|**Sr. No**|**Release summary**|**Description**|
|---------|---------------------|---------|
| **1.**  |[Role-based access control (RBAC)](#introducing-rbac-in-percona-everest-ensure-security-and-simplify-database-access-management)|Introducing RBAC in Percona Everest: Ensure security and simplify database access management|
| **2.**|[Breaking API changes](#percona-everest-120-a-deep-dive-into-breaking-api-changes)|Percona Everest v1.2.0: A deep dive into Breaking API changes|
| **3.**|[Operator upgrades](#improved-mulitple-operator-upgrades)|Improved multiple operator upgrades|
| **4.**|[New features](#new-features)|Check out the new features introduced in Percona Everest 1.2.0|
| **5.**|[Improvements](#improvements)|Discover all the enhancements featured in Percona Everest 1.2.0|
| **6.**|[New and deprecated API's](#the-latest-in-apis-whats-new-and-whats-deprecated)|Discover all the new APIs that have been added to Percona Everest 1.2.0, as well as any deprecated APIs|
| **7.**|[Bugs](#bugs)|Find out about all the bugs fixed in Percona Everest 1.2.0|



## Release highlights


=== "Breaking API changes"

    ### Percona Everest 1.2.0: A deep dive into Breaking API changes

    Beginning with Percona Everest v1.2.0, breaking changes are being introduced to the API for `monitoring-instances` and `backup-storages` resources. These updates include:

    - Before the launch of Percona Everest 1.2.0, the resources `monitoring-instances` and `backup-storages` had a global scope. Percona Everest used a `.spec.allowedNamespaces` field to control access to these global resources. This field defined the namespaces where the resources could be accessed, thus providing some degree of access control.

    - With the upgrade to Percona Everest version 1.2.0, the transition from global scope to the designated namespaces for these resources is an important change in the way access control is managed. This improves security as the resources are only accessible within their designated namespaces. The database clusters can only use `monitoring-instances` and `backup-storages` located within the same namespace as the cluster.

    - When upgrading to 1.2.0 using the CLI command `everestctl upgrade`, all your existing `backup-storages` and `monitoring-instances` will be automatically migrated to the namespaces specified in their `.spec.allowedNamespaces` fields.

        !!! note
            After the upgrade to Percona Everest 1.2.0, you will only be able to access these resources through the new API endpoints.

        Check out our [documentation](docs.percona.com/everest//administer/api_rbac.html#changes-in-the-percona-everest-apis) for in-depth details on the Breaking API changes.


=== "RBAC"

    ### Introducing RBAC in Percona Everest: Ensure security and simplify database access management

    !!! warning "Disclaimer"
        RBAC is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and not in production environments.

    Starting with Percona Everest 1.2.0, we’ve enhanced our platform by introducing Role-Based Access Control (RBAC), which regulates resource access for better management and security.

    With RBAC, only authorized individuals can access specific resources or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.

    To enable or disable RBAC in Percona Everest, you can use a configuration flag that allows switching between RBAC-enabled and RBAC-disabled modes. By default, RBAC is disabled.

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

=== "Operator upgrades"

    ### Improved multiple operator upgrades

    Starting with Percona Everest 1.2.0, it's important to note that due to limitations with the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/), it is now required to upgrade all database operators concurrently with their components across any namespace. The upgrade process can be accomplished using our intuitive UI.

    Before initiating the upgrade process, Percona Everest provides a comprehensive list of tasks that must be completed to ensure a seamless transition of your clusters to the next version of the database operators.


## New features

- [EVEREST-1103](https://perconadev.atlassian.net/browse/EVEREST-1103): Starting with Percona Everest 1.2.0, we've restricted actions based on RBAC roles, ensuring that users are explicitly granted access to the resources required for their specific roles. This enhances security and simplifies access control processes.

- [EVEREST-1142](https://perconadev.atlassian.net/browse/EVEREST-1142): We have now added a [new command](../administer/rbac.md#validate-your-rbac-policy) for validating your RBAC policy to ensure that your RBAC policies are working as expected.

- [EVEREST-1240](https://perconadev.atlassian.net/browse/EVEREST-1240): We have added support for PostgreSQL operator version 2.4.1. 

- [EVEREST-1298](https://perconadev.atlassian.net/browse/EVEREST-1298): We have added support for MySQL operator version 1.15.0.

- [EVEREST-1035](https://perconadev.atlassian.net/browse/EVEREST-1035): We've now included **Retention copies** for PostgreSQL as well when setting up backup schedules.


## Improvements

- [EVEREST-1165](https://perconadev.atlassian.net/browse/EVEREST-1165)- Due to limitations with the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/), it is now required to upgrade all database operators concurrently with their components across any namespace.

- [EVEREST-1212](https://perconadev.atlassian.net/browse/EVEREST-1212) - Starting with Percona Everest 1.2.0, you can now directly edit the monitoring endpoint from the database overview page, instead of having to use the Edit database wizard.


- [EVEREST-1230](https://perconadev.atlassian.net/browse/EVEREST-1230): We've updated the **Resources** panel on the **Database overview** page to be independent instead of part of the **DB Details** panel and improved the overall look and feel of this page.


- [EVEREST-1369](https://perconadev.atlassian.net/browse/EVEREST-1369): We've updated the documentation for the section on turning off telemetry.


## The latest in APIs: What’s new and what’s deprecated


### Newly added API endpoints

Check out the new API endpoints we've added in Percona Everest 1.2.0:
{.power-number}

1. `/namespaces/{namespace}/monitoring-instances`  

    ```{.bash .no-copy}
    a. GET
    b. POST
    ```


2. `/namespaces/{namespace}/monitoring-instances/{name}`

    ```{.bash .no-copy}   
    a. GET
    b. PATCH
    c. DELETE
    ```

3. `/namespaces/{namespace}/backup-storages`

    ```{.bash .no-copy} 
    a. GET
    b. POST
    ```

4. `/namespaces/{namespace}/backup-storages/{name}`

    ```{.bash .no-copy} 
    a. GET
    b. PATCH
    c. DELETE
    ```

5. `/permissions`

    
    ```{.bash .no-copy}
    a. GET
    ```


### Deprecated API endpoints

This is the list of the API endpoints deprecated:
{.power-number}

1. Check out the endpoints/methods that had been deprecated from Percona Everest v1.1.0:


    a. `/namespaces/{namespace}/database-engines/{name}/operator-version/preflight`

    ```{.bash .no-copy}
    1. GET
    ```

    b. `/namespaces/{namespace}/database-engines/{name}/operator-version`

    ```{.bash .no-copy}
    1. GET
    2. PUT
    ```

2. Deprecated the following endpoints/methods:

    c. `/monitoring-instances`

    ```{.bash .no-copy}
    1. GET
    2. POST
    ```
    
    d. `/monitoring-instances/{name}`

    ```{.bash .no-copy}
    1. GET
    2. PATCH
    3. DELETE
    ```

    e. `/backup-storages`

    ```{.bash .no-copy}
    1. GET
    2. POST
    ```

    f. `/backup-storages/{name}`

    ```{.bash .no-copy}
    1. GET
    2. PATCH
    3. DELETE
    ```

## Bugs

- [EVEREST-768](https://perconadev.atlassian.net/browse/EVEREST-768): The PostgreSQL pods now demonstrate the intended behavior by not getting stuck, as they automatically restart when the database is restarted.


- [EVEREST-1232](https://perconadev.atlassian.net/browse/EVEREST-1232): The backups and restore pages have been updated to show consistent date formats.

- [EVEREST-1253](https://perconadev.atlassian.net/browse/EVEREST-1253): The **Delete** option in the backup menu is properly now disabled if the backup is in the **Deleting** status.

- [EVEREST-1273](https://perconadev.atlassian.net/browse/EVEREST-1273) Backend sends an empty response if the backup storage URL is edited to an HTTP address.

- [EVEREST-1279](https://perconadev.atlassian.net/browse/EVEREST-1279): The CPU value displayed on the **Resources page** and the **Database Summary** panel is now consistent.

- [EVEREST-1286](https://perconadev.atlassian.net/browse/EVEREST-1286): When editing a backup schedule, the option to change the backup name is now disabled.

- [EVEREST-1287](https://perconadev.atlassian.net/browse/EVEREST-1287) Updated the default affinity settings for the database cluster pods. A database restart is required in order to apply these new settings.

- [EVEREST-1315](https://perconadev.atlassian.net/browse/EVEREST-1315): Despite Percona Everest showing a successful upgrade message, the upgrade actually didn't go as planned. The issue has been resolved now.

- [EVEREST-1323](https://perconadev.atlassian.net/browse/EVEREST-1323):We've resolved the issue that was causing an error to appear on the **Components** page after creating databases, especially when the status was either **initializing** or **up**.

- [EVEREST-1354](https://perconadev.atlassian.net/browse/EVEREST-1354): We've resolved an issue related to an incorrect allocation of CPU and memory resources for PXC clusters. To apply these new settings, a database restart is required.

- [EVEREST-1371](https://perconadev.atlassian.net/browse/EVEREST-1371): We've addressed a couple of issues pertaining to the **Monitoring** page, one of them being the monitoring endpoint displaying the **username** instead of the **endpoint** name.


- [EVEREST-1372](https://perconadev.atlassian.net/browse/EVEREST-1372): We’ve resolved the issue that prevented us from deleting the monitoring endpoint that is not currently in use.

- [EVEREST-1375](https://perconadev.atlassian.net/browse/EVEREST-1375): The upgrade to PXC operator 1.15.0 caused a restart of the databases. We have resolved the issue now.

- [EVEREST-1427](https://perconadev.atlassian.net/browse/EVEREST-1427) - 
PostgreSQL no longer gets stuck in an unknown state despite having duplicate backup storage in different namespaces.
 
