# Role Based Access Control

Role-based access control (RBAC) restricts access to resources within Percona Everest. It establishes a framework that defines access permissions and privileges according to individual users' roles. With RBAC, only authorized individuals can access specific information or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.


## Default role

In Percona Everest, the only predefined default role is **admin**. The **admin** user is a superuser and it has unrestricted access to Percona Everest. However, the RBAC (Role-Based Access Control) configuration can define and allocate specific roles based on individual requirements and access privileges.

- `role:admin` - unrestricted access to all resources

This default built-in role definition can be seen in [policy.csv](https://github.com/percona/everest/blob/main/deploy/quickstart-k8s.yaml#L91)



## Policy definition in RBAC

RBAC policies are the rules and guidelines that define how roles, permissions, and users are managed within RBAC. These policies ensure that users have appropriate access to resources based on their roles within Percona Everest.


The policy definiiton in Percona Everest is:


```sh
    p, adminrole:role, <resource>, <action>, <namespace>/<objectname>`
```
    
Where:

 adminrole:role: refers to the subject. It can also be name of the user.

 resource: could be `namespaces, database engines,` etc.

 action: such `read, create, update, delete`

namespace>/objectname: `*` refers to the object (it means **all**). Alternatively it can be of the format `<namespace>/<objectname>`.


### Super Admin policy

Check out the policy for a `Super Admin` role:

```sh
{* Super Admin role definition *}
    p, adminrole:role, namespaces, read, *
    p, adminrole:role, database-engines, *, */*
    p, adminrole:role, database-clusters, *, */*
    p, adminrole:role, database-clusters-credentials, read, */*
    p, adminrole:role, backup-storages, *, */*
    p, adminrole:role, monitoring-instances, *, */*
```

### Read only policy

Check out the policy for a `readonly` role:

```sh
{* Read Only role definition *}
    p, readonly:role, namespaces, read, *
    p, readonly:role, database-engines, read, */*
    p, readonly:role, database-clusters, read, */*
    p, readonly:role, backup-storages, read, */*
    p, readonly:role, monitoring-instances, read, */*
```

### Examples

#### Admin group role for a single namespace

Let's set up an Admin Group role definition for just one namespace called **the-dark-side**.

```sh
 p, admin-darkside:role, namespaces, read, the-dark-side
 p, admin-darkside:role, database-engines, *, the-dark-side/*
 p, admin-darkside:role, database-clusters, *, the-dark-side/*
 p, admin-darkside:role, database-clusters-credentials, read, the-dark-side/*
 p, admin-darkside:role, backup-storages, *, the-dark-side/*
 p, admin-darkside:role, monitoring-instances, *, the-dark-side/*
```

???+ Example "Interpretation"

    The `admin-darkside` role has the following privileges `only` within `the-dark-side` namespace:

    - **namespace**:  `Read` access to the `the-dark-side`  .
    - **Database engines**: `Read` and `update` access
    - **Database clusters**: `All` access (read, create, update, delete)
    - **Database clusters credentials**: `Read` acccess
    - **Backup storages**: `All` access (read, create, update, delete)
    - **Monitoring instances**: `All` access (read, create, update, delete)


#### Dev group role with read/update/create access to single namepsace

Let's set up a dev group role definition with **read/update/create** access within the namespace called as `the-dark-side`:

```sh
 p, team-darkside:role, namespaces, read, the-dark-side
 p, team-darkside:role, database-engines, read, the-dark-side/*
 p, team-darkside:role, database-clusters, read, the-dark-side/*
 p, team-darkside:role, database-clusters, update, the-dark-side/*
 p, team-darkside:role, database-clusters, create, the-dark-side/*
 p, team-darkside:role, database-clusters-credentials, read, the-dark-side/*
 p, team-darkside:role, backup-storages, read, the-dark-side/*
 p, team-darkside:role, monitoring-instances, read, the-dark-side/*
```

???+ Example "Interpretation"

    The `team-darkside` role has the following privileges `only` within `the-dark-side` namespace:

    - **namespace**:  `Read` access to `the-dark-side`  .
    - **Database engines**: `Read` access
    - **Database clusters**: `Read` access
    - **Database clusters**: `Update` acccess
    - **Database clusters**: `Create` acccess
    - **Database clusters credentials**: `Read` acccess
    - **Backup storages**: `Read` access
    - **Monitoring instances**: `Read` access

#### Dev group role with full access to a single datbase

Let's set up a dev group role definition with **full** access for just one database called `banana` within `the-dark-side`:

```sh
 p, team-darkside-banana:role, namespaces, read, the-dark-side
 p, team-darkside-banana:role, database-engines, read, the-dark-side/*
 p, team-darkside-banana:role, database-clusters, read, the-dark-side/banana
 p, team-darkside-banana:role, database-clusters, update, the-dark-side/banana
 p, team-darkside-banana:role, database-clusters-credentials, read, the-dark-side/banana
 p, team-darkside-banana:role, backup-storages, read, the-dark-side/*
 p, team-darkside-banana:role, monitoring-instances, read, the-dark-side/*
 ```

???+ Example "Interpretation"

    The `team-darkside-banana` role has the following privileges for **single** database `banana' within `the-dark-side` namespace:

    - **namespace**:  `Read` access to the `the-dark-side`  .
    - **Database engines**: `Read` access to all the database engines
    - **Database clusters**:  Read and update access for **only** the `banana` database
    - **Database clusters credentials**: `Read` acccess for **only** the `banana` database
    - **Backup storages**: Read access to all the backup storages
    - **Monitoring instances**: Read access to all the monitoring instances

## RBAC resources and privileges

Below is a comprehensive table outlining the permissions granted for various **resources**:

??? info "Permissions for resources"


    !!! info "Important"
        If you have permission for specific namespaces or resources, you can perform read, update, create, or delete actions only on those resources or only within those namespaces. However, if you have permission for **all** the resources or namespaces, you can carry out these actions across all the resources and namespaces.

    </br> </br>

    **Table: Privileges for the various resources in Percona Everest**

    |**Resource**| **Read**| **Create**| **Update**|**Delete**|
    |------------|---------|-----------|-----------|----------|
    | Namespaces|You can view namespaces| :x:  |:x: | :x:|
    | Database engines</br> MySQL, MongoDB, PostreSQL|You view can database engines when you create databases</br></br>**Note**: This policy must at least be **read all** so the users can create databases.| :x: |Modify datbase engines| :x:|
    | Database clusters|You can view databases| You can create databases|You can modify databases| You can delete databases|
    | Backups storage and Monitoring endpoints|You can siew backups and monitroing endpoints| You can create backups and monitroing endpoints|You can modify backups and monitroing endpoints| You can delete backups and monitroing endpoints|
    | Database data (credentials)|View database data (credentials) </br> </br>**Note**: If no policy is defined:</br> * You cannot see the credentials and the connection string.</br> * You also cannot create a database from any backup.| :x: |:x:| :x:|

    
    
  






