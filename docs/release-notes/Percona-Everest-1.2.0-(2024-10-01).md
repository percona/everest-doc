# What's new in Percona Everest 1.2.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


!!! warning
     Percona Everest v1.2.0 introduces breaking changes to the API. Once you upgrade to version 1.2.0, the process cannot be reversed.


## Release summary

|**Sr. No**|**Release summary**|**Description**|
|---------|---------------------|---------|
| **1.**  |[Role-based access control (RBAC)](#release-highlights)|Introducing RBAC in Percona Everest: Ensure security and simplify database access management|
| **2.**|[Breaking API changes](#release-highlights)|Percona Everest v1.2.0: A deep dive into Breaking API changes|
| **3.**|[Operator upgrades](#release-highlights)|Improved multiple operator upgrades|
| **4.**|[New features](#new-features)|Check out the new features introduced in Percona Everest 1.2.0|
| **5.**|[Improvements](#improvements)|Discover all the enhancements featured in Percona Everest 1.2.0|
| **6.**|[New and deprecated API's](#the-latest-in-apis-whats-new-and-whats-deprecated)|Discover all the new APIs that have been added to Percona Everest 1.2.0, as well as any deprecated APIs|
| **7.**|[Bugs](#bugs)|Find out about all the bugs fixed in Percona Everest 1.2.0|
| **8.**|[Known limitations](#known-limitations)|Discover all the known limitations in Percona Everest 1.2.0|


## Release highlights

=== "Breaking API changes"

    ### Percona Everest 1.2.0: A deep dive into Breaking API changes

    Beginning with Percona Everest v1.2.0, breaking changes are being introduced to the API for `monitoring-instances` and `backup-storages` resources. These updates include:

    - Before the launch of Percona Everest 1.2.0, the resources `monitoring-instances` and `backup-storages` had a global scope. Percona Everest used a `.spec.allowedNamespaces` field to control access to these global resources. This field defined the namespaces where the resources could be accessed, thus providing some degree of access control.

    - With the upgrade to Percona Everest version 1.2.0, the transition from global scope to the designated namespaces for these resources is an important change in the way access control is managed. This improves security as the resources are only accessible within their designated namespaces. The database clusters can only use `monitoring-instances` and `backup-storages` located within the same namespace as the cluster.

    - When upgrading to 1.2.0 using the CLI command `everestctl upgrade`, all your existing `backup-storages` and `monitoring-instances` will be automatically migrated to the namespaces specified in their `.spec.allowedNamespaces` fields.

        !!! note
            After the upgrade to Percona Everest 1.2.0, you will only be able to access these resources through the new API endpoints.

        Check out our [documentation](../api_rbac.md) for in-depth details on the Breaking API changes.


=== "RBAC"

    ### Introducing RBAC in Percona Everest: Ensure security and simplify database access management

    !!! warning 
        - RBAC is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and not in production environments.
        -  Check out the [known limitations](#known-limitations) section for important information about the limitations of RBAC.

    Starting with Percona Everest 1.2.0, we’ve enhanced our platform by introducing Role-Based Access Control (RBAC), which regulates resource access for better management and security.

    With RBAC, only authorized individuals can access specific resources or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.


    To enable or disable RBAC in Percona Everest, you can use a configuration flag that allows switching between RBAC-enabled and RBAC-disabled modes. By default, RBAC is disabled.

    Here's a breakdown of the key concepts in RBAC:

    - [Roles](https://docs.percona.com/everest/administer/rbac.html#default-role) - Roles are a set of permissions that allow users to access and carry out various tasks within Percona Everest.

    - [RBAC resources and privileges](https://docs.percona.com/everest/administer/rbac.html#rbac-resources-and-permissions): Resources are the entities or objects within Percona Everest that require controlled access. Privileges specify the particular actions that a role is able to perform on a resource.

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

- [EVEREST-1212](https://perconadev.atlassian.net/browse/EVEREST-1212) - Starting with Percona Everest 1.2.0, you can now directly edit the monitoring endpoint from the database overview page instead of having to use the Edit database wizard.


- [EVEREST-1230](https://perconadev.atlassian.net/browse/EVEREST-1230): We've updated the **Resources** panel on the **Database overview** page to be independent instead of part of the **DB Details** panel and improved the overall look and feel of this page.


## The latest in APIs: What’s new and what’s deprecated


=== "Newly added API endpoints"

    Check out the new API endpoints we've added in Percona Everest 1.2.0:

    |**No**|**API endpoints**|**Method**|
    |---------|---------------------|---------|
    |**1.**|`/namespaces/{namespace}/monitoring-instances`|a.`GET`</br> b.`POST`|
    |**2.**|`/namespaces/{namespace}/monitoring-instances/{name}`|a.`GET`</br>b. `PATCH`</br>c.`DELETE`|
    |**3.**|`/namespaces/{namespace}/backup-storages`|a.`GET`</br> b. `POST`|
    |**4.**|`/namespaces/{namespace}/backup-storages/{name}`|a.`GET`</br> b.`POST`|
    |**5.**|``/permissions``|a.`GET`|



=== "Deprecated API endpoints"

    This is the list of the API endpoints deprecated from Percona Everest:

    |**No**|**API endpoints**|**Method**|
    |---------|---------------------|---------|
    |**1.** |**Endpoints deprecated in Percona Everest v1.1.0 and removed in v1.2.0:**|
    |**a.**|`/namespaces/{namespace}/database-engines/{name}/operator-version/preflight`|1.`GET`|
    |**b.**|`/namespaces/{namespace}/database-engines/{name}/operator-version`|1.`GET`</br>2.`PUT`|
    |**2.** |**Endpoints deprecated in v1.2.0:**|
    |**c.**|`/monitoring-instances`|1.`GET`</br> 2.`POST`|
    |**d.**|`/monitoring-instances/{name}`|1.`GET`</br>2. `PATCH`</br>3.`DELETE`|
    |**e.**|`/backup-storages`|1.`GET`</br> 2.`POST`|
    |**f.**|`/backup-storages/{name}`|1.`GET`</br>2. `PATCH`</br>3.`DELETE`|

## Bugs

- [EVEREST-768](https://perconadev.atlassian.net/browse/EVEREST-768): The PostgreSQL pods now demonstrate the intended behavior by not getting stuck, as they automatically restart when the database is restarted.

- [EVEREST-1287](https://perconadev.atlassian.net/browse/EVEREST-1287) - Before Percona Everest 1.2.0, every database node had to be scheduled on a separate K8s node within an EKS distribution. Otherwise, the database would fail to start if it didn't have a separate K8s node available. Now, it is preferable, but the databases will still come up even if no separate K8s node is available, and this setting is applied regardless of the distribution being used.


- [EVEREST-1232](https://perconadev.atlassian.net/browse/EVEREST-1232): The backups and restore pages have been updated to show consistent date formats.

- [EVEREST-1273](https://perconadev.atlassian.net/browse/EVEREST-1273): We have fixed an issue to display an error message when the user edits the backup storage URL to an invalid one.

- [EVEREST-1286](https://perconadev.atlassian.net/browse/EVEREST-1286): When editing a backup schedule, the option to change the backup name is now disabled.

- [EVEREST-1253](https://perconadev.atlassian.net/browse/EVEREST-1253): The **Delete** option in the backup menu is properly now disabled if the backup is in the **Deleting** status.

- [EVEREST-1279](https://perconadev.atlassian.net/browse/EVEREST-1279): The CPU value displayed on the **Resources page** and the **Database Summary** panel is now consistent.

- [EVEREST-1315](https://perconadev.atlassian.net/browse/EVEREST-1315): Despite Percona Everest showing a successful upgrade message, the upgrade actually didn't go as planned. The issue has been resolved now.

- [EVEREST-1323](https://perconadev.atlassian.net/browse/EVEREST-1323):We've resolved the issue that was causing an error to appear on the **Components** page after creating databases, especially when the status was either **initializing** or **up**.

- [EVEREST-1354](https://perconadev.atlassian.net/browse/EVEREST-1354): We've resolved an issue related to an incorrect allocation of CPU and memory resources for PXC clusters. To apply these new settings, a database restart is required.

- [EVEREST-1371](https://perconadev.atlassian.net/browse/EVEREST-1371): We've addressed a couple of issues pertaining to the **Monitoring** page, one of them being the monitoring endpoint displaying the **username** instead of the **endpoint** name.


- [EVEREST-1372](https://perconadev.atlassian.net/browse/EVEREST-1372): We’ve resolved the issue that prevented us from deleting the monitoring endpoint that is not currently in use.

- [EVEREST-1427](https://perconadev.atlassian.net/browse/EVEREST-1427) - PostgreSQL no longer gets stuck in an unknown state despite having duplicate backup storage in different namespaces.




## Known limitations

- RBAC will not work if you have configured Single sign-on (SSO) and your identity provider (IdP) is **Microsoft Entra**.

- If you remove permissions for a resource, some permissions will still be valid even after they have been removed. The new set of permissions will only take effect when you refresh the page.

- When you upgrade PostgreSQL operators to version 2.4.1, the database transitions to the initializing state as part of the upgrade process. However, this initializing state does not cause any downtime.

- When you upgrade PXC operators to version 1.15.0, single node MySQL databases will be restarted, resulting in downtime. However, it is worth noting that single node databases should not be used in production environments.




