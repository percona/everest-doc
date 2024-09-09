# Navigating the breaking API changes for RBAC

Starting with Percona Everest v1.2.0, breaking changes are being made to the API for `monitoring-instances` and `backup-storage` resources. These changes are:

- Before the release of Percona Everest 1.2.0, these resources were globally scoped, but now they will be specific to namespaces. 

- The database clusters can only use monitoring instances and backup storages located within the same namespace as the cluster. The system used a `.spec.allowedNamespaces` field to control access to these global resources. This field determined the namespaces where the resource could be accessed, providing a certain degree of access control.

- With the update to Percona Everest v1.2.0, the shift from global scoping to namespacing these resources marks a significant change in how access control is managed, enhancing security by ensuring that resources are only accessible within their designated namespaces.

## Challenges with globally scoped namespaces

In Percona Everest v1.2.0, we’ve rolled out Role-Based Access Control (RBAC) to enhance security and provide more granular control over the access privileges for specific resources within the system. This implementation provides fine-grained control over which users and user groups can access particular resources within the system. 

The RBAC model functions on the principle that all resources are organized into namespaces. This enables a well-structured and hierarchical arrangement of resources, simplifying the management of access rights according to the namespace to which a resource is associated.

Prior to Percona Everest version 1.2.0, certain resources such as `backup-storages` and `monitoring-instances` were not organized into namespaces but were accessible globally. To enforce access restrictions on these globally scoped resources, the system utilized a .spec.allowedNamespaces field. The .spec.allowedNamespaces field specifies the namespaces within which the resource can be accessed, giving you certain level of control.

Using the `allowedNamespaces` field for globally scoped resources presented challenges when integrating with the core RBAC model. To fix this and align with the RBAC framework, `backup-storages`, and `monitoring-instances` are now namespaced resources. This ensures that all resources conform to the same RBAC model, which results in a consistent and manageable access control structure across the system.

##  Changes in the Percona Everest APIs

The APIs have been updated with the following modifications:

- The existing APIs for backup storage and monitoring instances are deprecated. Now, you should use the API path prefixed with `/namespaces/{namespace}`.

    ??? example "Example"

        ```/v1/backup-storages``` is now

        ```/v1/namespaces/{namespace}/backup-storages```

        Check out the [API](https://percona-everest.readme.io/reference/getkubernetesclusterresources) documentation for more details.

- The `.spec.allowedNamespaces` field has been deprecated. Access control for these resources is now managed through the RBAC policy.

- `database-clusters` can now only reference `backup-storages` and `monitoring-instances` that are created within the same namespace as the `database-cluster`.

### Migrating to Percona Everest 1.2.0

When upgrading to 1.2.0, all your existing backup-storages and monitoring-instances will be automatically migrated to the namespaces specified in their .spec.allowedNamespaces fields. After the upgrade, these resources will be accessible exclusively through the new API endpoints.

Need more details? Check out the [upgrade](../upgrade_with_cli.md#upgrading-to-percona-everest-120) section.





