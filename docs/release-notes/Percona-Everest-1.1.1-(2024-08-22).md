# What's new in Percona Everest 1.1.1

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest version 1.1.1 introduces the following changes:

## Fixed issues

- [EVEREST-1349](https://perconadev.atlassian.net/browse/EVEREST-1349) - While attempting to delete a database cluster after upgrading from Percona Everest version `1.0.x` to `1.1.0`, the databases provisioned in `v1.0.x` were stuck in the **Deleting** state. The issue has been resolved now.