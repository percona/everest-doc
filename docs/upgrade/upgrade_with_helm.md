# Upgrade Percona Everest using Helm

Percona Everest consistently delivers updates that includes bug fixes, security enhancements, and various improvements designed to optimize the overall performance of your database.

## Before you upgrade

!!! note
    - Upgrade one minor release at a time to avoid unexpected issues. Start by updating to the latest patch release before moving on to the next minor release.
    - For a safe upgrade, we perform a pre-upgrade hook that runs a series of checks. You can disable this by setting `upgrade.preflightChecks=false`, but doing so means a safe upgrade cannot be assured.


 ## Upgrade CRDs

In Helm v3, CRDs are not updated automatically during a Helm upgrade. You need to manually upgrade the CRDs.

To update the CRDs, run the following command:

```sh
VERSION=<Next version>
kubectl apply -k https://github.com/percona/everest-operator/config/crd?ref=$(VERSION) --server-side
```

where,

**Next version** - A placeholder for the specific version of the Everest Operator. For example, you might replace `<Next version>` with v1.3.0.


