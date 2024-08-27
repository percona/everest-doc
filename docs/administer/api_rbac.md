# API changes for RBAC

Starting with Percona Everest v1.2.0, breaking changes are being made to the API for monitoring instances and backup storage resources. Previously, these resources were globally scoped, but now they will be specific to namespaces. This means that database clusters will only be able to use monitoring instances and backup storages that are located within the same namespace as the cluster. With the update to Percona Everest v1.2.0, the shift from global scoping to namespacing these resources marks a significant change in how access control is managed, enhancing security by ensuring that resources are only accessible within their designated namespaces.

Before the release of Percona Everest 1.2.0, resources like backup storage and monitoring instances were globally scoped rather than contained within namespaces. The system used a `.spec.allowedNamespaces` field to control access to these global resources. This field determined the namespaces where the resource could be accessed, providing a certain degree of access control.

## Challenges of globally spaced namespaces

The use of the `allowedNamespaces` field for globally scoped resources presented challenges when integrating with the core RBAC model. In order to resolve this inconsistency and align with the RBAC framework, backup storage and monitoring instances are now namespaced resources. This change ensures that all resources adhere to the same RBAC model, resulting in a more consistent and manageable access control structure across the entire system.









