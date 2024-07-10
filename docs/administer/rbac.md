# Role Based Access Control

Role-based access control (RBAC) restricts access to resources within Percona Everest. It establishes a framework that defines access permissions and privileges according to individual users' roles. With RBAC, only authorized individuals can access specific information or perform certain actions based on their assigned roles. This method improves security by minimizing the risk of unauthorized access and helps manage permissions more efficiently across Percona Everest.


## Default role

In Percona Everest, the only predefined default role is **admin**. The **admin** user is a superuser and it has unrestricted access to Percona Everest. However, the RBAC (Role-Based Access Control) configuration can define and allocate specific roles based on individual requirements and access privileges.

- `role:admin` - unrestricted access to all resources

This default built-in role definition can be seen in [policy.csv]()


## RBAC resources and permissions


Below is a comprehensive table outlining the permissions granted for various resources:

??? example "Permissions for Namespaces list"
 

| Resources |Permissions | Description |Note|
|-----------|--------|---------------|------------------|
| Namespaces list|Read specific | View specific namespaces.|
| Namespaces list|Read all | View all namespaces.|
| Namespaces list|All | View all namespaces.|





