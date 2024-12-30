# What's new in Percona Everest 1.1.1

!!! warning
    Google Container Registry (GCR) is being deprecated and will be shut down on March 18, 2025. This change will affect all versions of Percona Everest prior to 1.4.0. It is recommended to transition to [Artifact Registry](https://cloud.google.com/artifact-registry/docs){:target="_blank"}, which provides similar container management features along with additional benefits. 
    
    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest version 1.1.1 introduces the following changes:

## Fixed issues

- [EVEREST-1349](https://perconadev.atlassian.net/browse/EVEREST-1349) - While attempting to delete a database cluster after upgrading from Percona Everest version `1.0.x` to `1.1.0`, the databases provisioned in `v1.0.x` were stuck in the **Deleting** state. The issue has been resolved now.
