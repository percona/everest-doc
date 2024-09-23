# Role Based Access Control

Role-based access control (RBAC) restricts access to resources within Percona Everest. It establishes a framework that defines access permissions and privileges according to individual users' roles. With RBAC, only authorized individuals can access specific information or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.

## How to enable RBAC

To enable or disable RBAC in Percona Everest, you can use a configuration flag that allows switching between RBAC-enabled and RBAC-disabled modes. By default, RBAC is disabled.

!!! info "Important"
    The RBAC configuration is stored in a `ConfigMap` named `everest-rbac` within the `everest-system` namespace.

Here's how you can enable RBAC:

```sh
apiVersion: v1
data:
  enabled: "true"
  policy.csv: |
    g, admin, role:admin
kind: ConfigMap
metadata:
  name: everest-rbac
  namespace: everest-system
```

## Policy definition in RBAC

RBAC policies are the rules and guidelines that define how roles, permissions, and users are managed within RBAC. These policies ensure that users have appropriate access to resources based on their roles within Percona Everest.


The policy definition in Percona Everest is:


```sh
p, <subject>, <resource-type>, <action>, <resource-name>
```

Where:

**subject**: Refers to the name of the role or user. For example, `role:admin` or `admin`

**resource-type**: Refers to the type of Everest resource, such as `namespaces`, `database-clusters`, `database-engines`, etc.

For in-depth information on the actions that a subject can perform, see the [resources and permissions](#rbac-resources-and-permissions) section.

**action**: Refers to the action the subject can perform. For example, `read`, `update`, `delete`, `create`, or `*`


**resource-name**: Refers to a specific instance of the given resource-type. The argument should be prefixed with the namespace in which the resource is present `<namespace>/<resource-name>`. For example, `my-namespace/my-cluster-1`, `my-namespace-2/my-backup-1`, etc. You may also use a wildcard, such as `*`, `*/*`, or `my-namespace/*`

!!! info "Important"
    If you have permission for specific namespaces or resources, you can perform read, update, create, or delete actions **only** on those resources or **only** within those namespaces. However, if you have permission for **all** the resources or namespaces, you can carry out these actions across all the resources and namespaces.

## RBAC resources and permissions

Below is a comprehensive table outlining the permissions available for various **resources**:

??? info "Permissions for resources"


    !!! warning "Important"
        :x: Represents an action that's not supported by the Percona Everest API.


    **Table: Permissions for the various resources in Percona Everest**

    |**Resource**| **Read**| **Create**| **Update**|**Delete**|
    |------------|---------|-----------|-----------|----------|
    | namespaces|You can view namespaces| :x:|:x: | :x:|
    | database-engines </br> (MySQL, MongoDB, PostreSQL)|You view can database engines when you create databases</br>  </br>**Note**: This policy must at least be **read all** so the users can create databases.| :x: |Modify database engines| :x:|
    | database-clusters|You can view databases| You can create databases|You can modify databases| You can delete databases|
    | database-cluster-backups|You can view database cluster backups| You can create database cluster backups|:x:| You can delete database cluster backups|
    | database-cluster-restores|You can view database cluster restores| You can create database cluster restores|You can modify database cluster restores| You can delete database cluster restores|
    | backup-storages and monitoring-instances |You can view backups and monitroing endpoints| You can create backups and monitroing endpoints|You can modify backups and monitroing endpoints| You can delete backups and monitroing endpoints|
    | database-cluster-credentials|View database data (credentials) </br> </br>**Note**: If no policy is defined:</br> * You cannot see the credentials and the connection string.</br> * You also cannot create a database from any backup.| :x: |:x:| :x:|


    ### Key considerations for RBAC

    Before you start defining the different roles, there are some important things to consider when it comes to Role-Based Access Control (RBAC).
    {.power-number}

    === "Namespaces"

        Read `namespaces` permissions are required for **all** the **roles**. 

    === " DB clusters"
    
        To create, update and delete database clusters, backups, schedules, monitoring instances, and restores it is recommended to **explicitly** grant `read` permissions as well for the `database clusters`. Without these permissions, you would not be able to view these resources, which would not be practical.

    === "Resources"
    
        To create, update and delete the resources, it is recommended to **explicitly** grant `read` permissions for these resources as well. Without these permissions, you would not be able to view these resources, which would not be practical.

        Example: To manage `backup schedules` (create, update, delete a schedule), it is recommended to **explicitly** grant `read` permissions for the `backup schedules` as well as `backup storages`.

    === "Backups"
    
        For on-demand backups and schedules, you should grant `read` permissions for `backup storages` as well.


    === "Restores"

        For restores, to new and existing databases, you should grant the following permisssions as well:

        - Read `backups` (of the old DB)
        - Read `MonitoringConfig` (if the old DB has monitoring enabled)
        - Read `database cluster credentials` (of the old DB)
        - Create `backups` (if backup schedules are enabled)
   
    === "Upgrades"

        For upgrades, the following permissions must be granted:

        - Read Namespaces
        - Read all `database engines` in that namespace
        - Read all `database clusters` in that namespace
        - Update `database clusters` in that namespace


## Roles in RBAC

In Role-Based Access Control (RBAC), a Role is a set of permissions that define what actions (like read, write, update, delete) can be performed on specific resources within Percona Everest. In RBAC, roles are assigned to users, allowing them to interact with the resources according to the permissions defined by their roles.

!!! note
    It is recommended to prefix role names with "role:" to prevent confusion between role names and user names.

### Built-in role

In Percona Everest, the only predefined role is **adminrole:role**, which is assigned to the **admin** user. Hence, this **admin** user has unrestricted access to Percona Everest. However, the RBAC (Role-Based Access Control) configuration can define and allocate specific roles based on individual requirements and access privileges.

This default built-in role definition can be seen in [policy.csv](https://github.com/percona/everest/blob/main/deploy/quickstart-k8s.yaml#L94-L102).


## RBAC examples

In this section, we will explore some examples that demonstrate how to create policy definitions for the required roles.

??? Example "Examples"

    Let's dive into some role definitions for RBAC:
    {.power-number}

    ### Role with unrestricted privileges to database clusters

     Let's set up a role for `example-user` with unrestricted access to database clusters and `read` access to database cluster backups. 
     
    This means that the user won't be able to `create` or `delete` any backups.

    ```sh
    p, example-user, database-clusters, *, */*
    p, example-user, database-cluster-backups, read, */*
    ```

    ### Admin role for a single namepsace

    Let's set up an admin role with unrestricted privileges to all the resources in a single namespace called `namespaceA`.

    ```sh
    p, role:namespaceAadmin, namespaces, *, namespaceA
    p, role:namespaceAadmin, database-engines, *, namespaceA/*
    p, role:namespaceAadmin, database-clusters, *, namespaceA/*
    p, role:namespaceAadmin, database-cluster-backups, *, namespaceA/*
    p, role:namespaceAadmin, database-cluster-restores, *, namespaceA/*
    p, role:namespaceAadmin, database-cluster-credentials, *, namespaceA/*
    p, role:namespaceAadmin, backup-storages, *, namespaceA/*
    p, role:namespaceAadmin, monitoring-instances, *, namespaceA/*
    ```

    ??? info "Let's dive into decoding this!"

        The `namespaceAadmin` role has the following privileges within the `namespaceA` namespace:

        - **namespace**: `Read` access to the `namespaceA`
        - **Database engines**: `Read` and `update` access
        - **Database clusters**: `All` access (read, create, update, delete)
        - **Database cluster backups**: `All` access (read, create, update, delete) 
        - **Database cluster rstores**: `All` access (read, create, update, delete) 
        - **Database clusters credentials**: `Read` acccess
        - **Backup storages**: `All` access (read, create, update, delete)
        - **Monitoring instances**: `All` access (read, create, update, delete)

    ### Admin role for a single namespace

    Let's set up a role for just one namespace called `the-dark-side`.

    ```sh
    p, role:admin-darkside, namespaces, *, the-dark-side
    p, role:admin-darkside, database-engines, *, the-dark-side/*
    p, role:admin-darkside, database-clusters, *, the-dark-side/*
    p, role:admin-darkside, database-cluster-credentials, *, the-dark-side/*
    p, role:admin-darkside, backup-storages, *, the-dark-side/*
    p, role:admin-darkside, monitoring-instances, *, the-dark-side/*
    ```

    ??? info "Let's dive into decoding this!"

        The `admin-darkside` role has the following privileges **only** within `the-dark-side` namespace:

        - **namespace**:  `Read` access to the `the-dark-side`  .
        - **Database engines**: `Read` and `update` access
        - **Database clusters**: `All` access (read, create, update, delete)
        - **Database clusters credentials**: `Read` acccess
        - **Backup storages**: `All` access (read, create, update, delete)
        - **Monitoring instances**: `All` access (read, create, update, delete)
            

    ### Read only role for all the namespaces

        Let's set up a read ony role for all the namespaces.

    ```sh
        p, role:readonly, namespaces, read, *
        p, role:readonly, database-engines, read, */*
        p, role:readonly, database-clusters, read, */*
        p, role:readonly, database-cluster-backups, *, */*
        p, role:readonly, database-cluster-restores, *, */*
        p, role:readonly, database-cluster-credentials, read, */*
        p, role:readonly, backup-storages, read, */*
        p, role:readonly, monitoring-instances, read, */*
    ```    

    ??? info "Let's dive into decoding this!"

        The `readonly`role has the following privileges in all the namespaces:

        - **namespace**:  `Read` access to all the namespaces
        - **Database engines**: `Read` access
        - **Database clusters**: Read` access
        - **Database cluster backups**: `Read` 
        - **Database cluster rstores**: `Read`
        - **Database clusters credentials**: `Read` acccess
        - **Backup storages**: `Read` access
        - **Monitoring instances**: `Read` access


    ### Read only role without access to the database credentials

    Lets set up a read only role with access to all resources in all namespaces with the **exception** of database credentials:

    ```sh
    p, readonly:role, namespaces, read, *
    p, readonly:role, database-engines, read, */*
    p, readonly:role, database-clusters, read, */*
    p, readonly:role, database-cluster-backups, read, */*
    p, readonly:role, database-cluster-restores, read, */*
    p, readonly:role, backup-storages, read, */*
    p, readonly:role, monitoring-instances, read, */*
    ```
    
    ??? info "Let's dive into decoding this!"

        The `readonly`role has the following privileges in all the namespaces:

        - **namespace**:  `Read` access to all the namespaces
        - **Database engines**: `Read` access
        - **Database clusters**: Read` access
        - **Database cluster backups**: `Read` access
        - **Database cluster restores**: `Read` access
        - **Backup storages**: `Read` access
        - **Monitoring instances**: `Read` access
        
        
    ### Read only role with access to the database credentials

    Let's set up a read only role that has read-only access to all resources in all namespaces, **including** access to the database credentials.

    ```sh
    p, role:readonlywithcreds:, namespaces, read, *
    p, role:readonlywithcreds:, database-engines, read, */*
    p, role:readonlywithcreds:, database-clusters, read, */*
    p, role:readonlywithcreds:, database-cluster-backups, read, */*
    p, role:readonlywithcreds:, database-cluster-restores, read, */*
    p, role:readonlywithcreds:, backup-storages, read, */*
    p, role:readonlywithcreds:, monitoring-instances, read, */*
    p, role:readonlywithcreds:, database-cluster-credentials, read, */*
    ```

    ??? info "Let's dive into decoding this!"

        The `readonlywithcreds` role has the following privileges in all the namespaces:

        - **namespace**: `Read` access to all the namespaces
        - **Database engines**: `Read` access
        - **Database clusters**: Read` access
        - **Database cluster backups**: `Read` access
        - **Database cluster restores**: `Read` access
        - **Backup storages**: `Read` access
        - **Monitoring instances**: `Read` access
        - **Database clusters credentials**: `Read` acccess


    ### Dev role with full access to a single database

    Let's set up a dev group role with **full** access for just one database called `banana` within `the-dark-side`:

    ```sh
    p, role:team-darkside-banana, namespaces, read, the-dark-side
    p, role:team-darkside-banana, database-engines, read, the-dark-side/*
    p, role:team-darkside-banana, database-clusters, read, the-dark-side/*
    p, role:team-darkside-banana, database-clusters, update, the-dark-side/banana
    p, role:team-darkside-banana, database-cluster-backups, *, the-dark-side/*
    p, role:team-darkside-banana, database-cluster-restores, *, the-dark-side/*
    p, role:team-darkside-banana, database-clusters-credentials, read, the-dark-side/banana
    p, role:team-darkside-banana, backup-storages, read, the-dark-side/*
    p, role:team-darkside-banana, monitoring-instances, read, the-dark-side/*
    ```

    ??? info "Let's dive into decoding this!"

        The `team-darkside-banana` role has the following privileges for **single** database `banana' within `the-dark-side` namespace:

        - **namespace**:  `Read` access to the `the-dark-side`  .
        - **Database engines**: `Read` access to all the database engines
        - **Database clusters**: `Read` and `update` access
        - **Database cluster backups**: `All` access (read, create, update, delete)
        - **Database cluster restores**: `All` access (read, create, update, delete)
        - **Database clusters credentials**: `Read` acccess for **only** the `banana` database
        - **Backup storages**: Read access to all the backup storages
        - **Monitoring instances**: Read access to all the monitoring instances


    ### Dev role with read/update/create access to all the namespaces
    
    Let's set up a dev group role with **read/update/create** access to **all** the namespaces:

    ```sh
    p, role:team-darkside, namespaces, read, */*
    p, role:team-darkside, database-engines, read, */*
    p, role:team-darkside, database-clusters, read, */*
    p, role:team-darkside, database-clusters, update, */*
    p, role:team-darkside, database-clusters-credentials, read, */*
    p, role:team-darkside, backup-storages, read, */*
    p, role:team-darkside, monitoring-instances, read, */*
    ```

    ??? info "Let's dive into decoding this!"

        The `team-darkside` role has the following privileges in **all** the namespaces:

        - **namespace**: `Read` access in all the namespaces.
        - **Database engines**: `Read` access to all the database engines
        - **Database clusters**:  `Read` and `update` access for all the database clusters
        - **Database clusters credentials**: `Read` acccess for **all** the databases
        - **Backup storages**: `Read` access to all the backup storages
        - **Monitoring instances**: `Read` access to all the monitoring instances

    ### Database admin role 

    Let's set up a role that has read only access to the `database-engines`, `backup-storages` and `monitoring-instances`. This means that users assigned to this role *can manage the databases* without any restriction but *cannot manage the database Kubernetes operators' versions*. They also cannot create, update, or delete `backup-storages` and `monitoring-instances`.

    ```sh
    p, roleA:role, namespaces, *, *
    p, roleA:role, database-engines, read, */*
    p, roleA:role, database-clusters, *, */*
    p, roleA:role, database-cluster-backups, *, */*
    p, roleA:role, database-cluster-restores, *, */*
    p, roleA:role, database-cluster-credentials, *, */*
    p, roleA:role, backup-storages, read, */*
    p, roleA:role, monitoring-instances, read, */*
    ```

    ??? info "Let's dive into decoding this!"

        The `roleA` role has the following privileges in **all** the namespaces:

        - **namespace**: `Read` access in all the namespaces.
        - **Database engines**: `Read` access to all the database engines
        - **Database clusters**: `All` access (read, create, update, delete)
        - **Database cluster backups**: `All` access (read, create, update, delete)
        - **Database cluster restores**: `All` access (read, create, update, delete)
        - **Database clusters credentials**: `Read` acccess for **all** the databases       
        - **Backup storages**: `Read` access to all the backup storages
        - **Monitoring instances**: `Read` access to all the monitoring instances

## Assigning roles to users

In order for roles to take effect, they need to be assigned to users. The syntax for this is as follows:

```sh
g, username, rolename
```

A new user in Percona Everest will initially have **no** permissions. To grant permissions, you must edit your RBAC configuration stored in the `everest-rbac` `ConfigMap` in the `everest-system` namespace:


```sh
kubectl edit configmap-rbac -n everest-system
```

A text editor will open, and you can edit the `ConfigMap` as follows. You just have to add the new user and assign it the desired role.


```sh
apiVersion: v1
kind: ConfigMap
metadata:
  name: everest-rbac
data:
  policy.csv: |
    g, admin, role:admin
    g, <newuser>, role:admin
```

For example, let's assign the role `team-dev` to a new user named `john`:

```sh       
p, role:team-dev, namespaces, read, dev
p, role:team-dev, database-engines, read, dev/*
p, role:team-dev, database-clusters, read, dev/*
p, role:team-dev, database-clusters, update, dev/*
p, role:team-dev, database-clusters, create, dev/*
p, role:team-dev, database-clusters, delete, dev/*
p, role:team-dev, database-cluster-credentials, read, dev/*
g, john, role:team-dev
```

The `team-dev` role has the following privileges **only** within the `dev` namespace:

- **namespace**:  `Read` access to `dev`
- **Database engines**: `Read` access
- **Database clusters**: `Read` access
- **Database clusters**: `Update` access
- **Database clusters**: `Create` access
- **Database clusters**: `Delete` access
- **Database cluster credentials**: `Read` access

## Validate your RBAC policy

You can verify whether your Role-based access control (RBAC) policies are functioning correctly by executing the following command:

```sh
everestctl settings rbac validate --policy-file
```

Where:

`policy-file` is an optional flag that takes the **policy file** path. If you do not specify the path to this file, it will look for the configuration file inside your existing Percona Everest installation, that is, under RBAC `ConfigMap`.

??? Example "Policy validation"

    The following example demonstrates that this is a valid policy.

    ```sh
    everestctl settings rbac validate --policy-file ./pkg/rbac/testdata/policy-1-good.csv
    ```
    Output:

    ```{.text .no-copy}
    ✓ Valid
    ```

    The following example demonstrates that this is an invalid policy.


    ```sh
    everestctl settings rbac validate --policy-file ./pkg/rbac/testdata/policy-bad.csv
    ```

    output:

    ```{.text .no-copy}
    × Invalid
    policy syntax error - unknown resource name 'non-existent-resource'
    ```


## Test your RBAC policy

You can verify if a role or individual (such as a group or a local user) has the necessary privileges to perform particular operations on designated resources. 

We have a straightforward command that can be used to test the RBAC (Role-Based Access Control) policies:


```sh
everestctl settings rbac can --policy-file <file_path>
```

Where:

`policy-file` is an optional flag that takes the **policy file** path. If you do not specify the path to this file, it will look for the configuration file inside your existing Percona Everest installation, that is, under RBAC `ConfigMap`.


??? Example "Test your policy"

    The following example tests whether a user, **Alice**, can create database clusters:

    ```sh
    everestctl settings rbac can alice create database-clusters '*' --policy-file ./pkg/rbac/testdata/policy-1-bad.csv
    ```
    Output

    ```{.text .no-copy}
    No
    ```


    The following example tests whether an **Admin** user can create database clusters:
    
    ```sh
    everestctl settings rbac can admin create database-clusters '*' --policy-file ./pkg/rbac/testdata/policy-1-good.csv
    ```

    Output:

    ```{.text .no-copy}
    Yes
    ```

## Breaking API changes for RBAC

Starting from Percona Everest v1.2.0, breaking changes are being implemented to the API for `monitoring-instances` and `backup-storages `resources. Explore further by checking out the section on [Breaking API changes](../api_rbac.md) for a deep dive into this topic.


















    
    
  






