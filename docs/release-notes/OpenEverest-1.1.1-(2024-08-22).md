# What's new in OpenEverest 1.1.1

!!! warning
    Google Container Registry (GCR) is scheduled to be deprecated and will officially shut down on March 18, 2025. All versions of OpenEverest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date. We strongly recommend upgrading to OpenEverest version 1.4.0 as soon as possible. If you do not upgrade, OpenEverest will no longer function.
    
    For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


To begin your journey with OpenEverest, check out the [Quickstart Guide for OpenEverest](../quickstart-guide/quick-install.md).

OpenEverest version 1.1.1 introduces the following changes:

## Fixed issues

- [EVEREST-1349](https://perconadev.atlassian.net/browse/EVEREST-1349) - While attempting to delete a database cluster after upgrading from OpenEverest version `1.0.x` to `1.1.0`, the databases provisioned in `v1.0.x` were stuck in the **Deleting** state. The issue has been resolved now.
