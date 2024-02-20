# Uninstall Everest

You can run the commands below to remove all Everest resources including:

- All Kubernetes objects created by Everest
- All downloaded binaries and files like **everestctl**.

!!! note alert alert-primary "Warning"
    Uninstalling Everest will remove all database clusters and associated data from the Kubernetes cluster, including backups!

    Before proceeding with Custom Resource Definitions (CRD) cleanup, check that any custom resources linked with CRDs are removed. This is a crucial step because deleting CRDs can potentially cause issues with any custom resources that depend on those definitions within the cluster.

To uninstall Everest:
{.power-number}


1. Uninstall Everest:

    ```sh
    everestctl uninstall
    ```

2. Remove the unused Custom Resource Definitions (CRD).

    !!! caution alert alert-warning "warning"
        Ensure that you don't remove any CRDs that are being used by the operators. Removing these CRDs can lead to unexpected behavior and errors in Percona Everest.

    During the installation of Everest, the following operators will be installed as well:
    - Everest
    - VictoriaMetrics
    - OLM

    Besides the default operators, you have the option to install at least one of the following operators.
    - [Percona Operator for MySQL](https://docs.percona.com/percona-operator-for-mysql/pxc/index.html)
    - [Percona Operator for MongoDB](https://docs.percona.com/percona-operator-for-mongodb/index.html)
    - [Percona Operator for PostgreSQL](https://docs.percona.com/percona-operator-for-postgresql/2.0/index.html)




