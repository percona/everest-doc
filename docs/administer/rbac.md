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
        p, adminrole:role, <resource>, <action>, <object>
    ```
    
    Where:

    adminrole:role: is the username
    resource: resource can be namespaces, database engines, etc.
    action: action can be read, create, update, delete
    object: it cam be * or in the format <namespace>/<objectname>





## RBAC resources and privileges


Below is a comprehensive table outlining the permissions granted for various **resources**:

??? info "Permissions for resources"


    !!! warning "Warning"
        If you have permission for specific namespaces or resources, you can perform read, update, create, or delete actions only on those resources or only within those namespaces. However, if you have permission for **all** the resources or namespaces, you can carry out these actions across all the resources and namespaces.

    </br> </br>

    **Table: Privileges for the various resources in Percona Everest**

    |**Resource**| **Read**| **Create**| **Update**|**Delete**|
    |------------|---------|-----------|-----------|----------|
    | Namespaces|:white_check_mark:| :x:  |:x: | :x:|
    | Database engines</br> MySQL, MongoDB, PostreSQL|:white_check_mark:</br> </br>**Note**: This policy must at least be **read all** so the users can create databases.| :x: |:white_check_mark:| :x:|
     | Database clusters|:white_check_mark:| :white_check_mark:  |:white_check_mark:| :white_check_mark:|
     | Backups storage and Monitoring endpoints|:white_check_mark:| :white_check_mark:  |:white_check_mark:| :white_check_mark:|
    | Database data (credentials)|:white_check_mark:</br> </br>**Note**: If no policy is defined:</br> </br> * You cannot see the credentials and the connection string.</br> * You cannot create backups or restores from any DB, even if you can create DBs. </br> * You also cannot create a database from any backup.| :x: |:x:| :x:|

    
    
  






