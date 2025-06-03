# Upgrade Percona Everest using Helm

Percona Everest consistently delivers updates that includes bug fixes, security enhancements, and various improvements designed to optimize the overall performance of your database.

## Before you upgrade

!!! Info "Important"
    - Upgrade one minor release at a time to avoid unexpected issues. Start by updating to the latest patch release before moving on to the next minor release.
    - For a safe upgrade, we perform a pre-upgrade hook that runs a series of checks. You can disable this by setting `upgrade.preflightChecks=false`, but doing so means a safe upgrade cannot be assured.


### Before you upgrade to version 1.7.0

Run the following command before you upgrade to Percona Everest version 1.7.0:

```sh
kubectl label namespaces everest-system app.kubernetes.io/managed-
```

## Upgrade CRDs

In Helm v3, CRDs are not updated automatically during a Helm upgrade. You need to manually upgrade the CRDs.

To update the CRDs, run the following command:

```sh
VERSION=<Next version>
kubectl apply -k "https://github.com/percona/everest-operator/config/crd?ref=v$VERSION" --server-side
```

where,

**Next version** - A placeholder for the specific version of Everest. For example, you might replace `<Next version>` with 1.3.0.

!!! note
    You may encounter an error due to conflicting field ownership, such as:

    ```sh
    error: Apply failed with 1 conflict: conflict with  "helm" using apiextensions.k8s.io/v1: .spec.versions
    ```

    This typically occurs when multiple tools (e.g., Helm and `kubectl` apply) manage the same Custom Resource Definition (CRD).

    To resolve this, you can use the `--force-conflicts` flag when applying the CRD:

    ```sh
    kubectl apply -k "https://github.com/percona/everest-operator/config/crd?ref=v$VERSION" --server-side --force-conflicts
    ```
    This is generally safe when the CRDs originate from a trusted source, such as a verified Helm chart or operator.

## Upgrade Helm releases

!!! warning
    When using `helm upgrade`, specifying `--set` (or other equivalent flags) causes Helm to revert all other values to the defaults defined in the chart. To avoid this issue, either include the `--reuse-values` flag or provide the complete set of values, including those used during the installation.

To upgrade Percona Everest using Helm, run the following commands:
{.power-number}

1. Upgrade the Helm release for Everest (core components).

    ```sh
    helm upgrade everest-core percona/everest --namespace everest-system --version "$VERSION"      
    ```

    where,

    **VERSION** is the Percona Everest version you wish to upgrade to.

2. Upgrade the Helm release for the database namespace (if applicable):

    ```sh
    helm upgrade everest percona/everest-db-namespace --namespace <DB namespace> --version "$VERSION"
    ```

    where,

    **VERSION** is the Percona Everest version you wish to upgrade to.

    **DB namespace** is the namespace you wish to upgrade.
