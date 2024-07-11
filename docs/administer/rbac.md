# Role Based Access Control

Role-based access control (RBAC) restricts access to resources within Percona Everest. It establishes a framework that defines access permissions and privileges according to individual users' roles. With RBAC, only authorized individuals can access specific information or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.


## Default role

In Percona Everest, the only predefined default role is **admin**. The **admin** user is a superuser and it has unrestricted access to Percona Everest. However, the RBAC (Role-Based Access Control) configuration can define and allocate specific roles based on individual requirements and access privileges.

- `role:admin` - unrestricted access to all resources

This default built-in role definition can be seen in [policy.csv]()


## RBAC resources and permissions


Below are a comprehensive list of tables outlining the permissions granted for various **resources**:

??? info "Permissions for resources"


    !!! info "Important"
        If you have permission for specific namespaces, you can perform read, update, create, or delete actions on resources only within those namespaces. However, if you have permissions for all the namespaces, you can carry out these actions across all namespaces.


    **Table: Privileges for the various resources in Percona Everest**

    |**Resource**| **Read**| **Create**| **Update**|**Delete**|
    |------------|---------|-----------|-----------|----------|
    | Namespaces|:material-checkbox-marked-circle:| :x:  |:x: | :x:|
    | Database engines</br> MySQL, MongoDB, PostreSQL|:material-checkbox-marked-circle:</br> **Note**: This policy must at least be read all so the users can create databases.| :x:  |:material-checkbox-marked-circle:| :x:|  
    
    
  |






