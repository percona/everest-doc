# Role Based Access Control

Role-based access control (RBAC) restricts access to resources within Percona Everest. It establishes a framework that defines access permissions and privileges according to individual users' roles. With RBAC, only authorized individuals can access specific information or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.


## Default role

In Percona Everest, the only predefined default role is **admin**. The **admin** user is a superuser and it has unrestricted access to Percona Everest. However, the RBAC (Role-Based Access Control) configuration can define and allocate specific roles based on individual requirements and access privileges.

- `role:admin` - unrestricted access to all resources

This default built-in role definition can be seen in [policy.csv]()


## RBAC resources and permissions


Below are a comprehensive list of tables outlining the permissions granted for various **resources**:

??? info "Permissions for resources"

    **Table: Permissions for Namespaces**
 
    |**Access** | **Description** |
    --------|-------------------------------------|
    | Read specific | View specific namespaces.|
    | Read all | View all namespaces.|
    | All (*) | View all namespaces.|


    **Table: Permissions for database engines (MySQL, MomgoDB, PostreSQL)**

    | Access | Description |
    |-----------|---------------------------------------------|
    | Read all |Users can view all the database engines when they create databases. </br> **Note**: This policy must at least be read all so the users can create databases.|





