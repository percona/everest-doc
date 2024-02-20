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


    During the installation of Everest, the following operators will be installed as well:
    - Everest
    - VictoriaMetrics
    - OLM

    Besides the operators mentioned above, you have the option to install at least one of the following operators.
    - [Percona Operator for MySQL](https://docs.percona.com/percona-operator-for-mysql/pxc/index.html)
    - [Percona Operator for MongoDB](https://docs.percona.com/percona-operator-for-mongodb/index.html)
    - [Percona Operator for PostgreSQL](https://docs.percona.com/percona-operator-for-postgresql/2.0/index.html)

    !!! caution alert alert-warning "warning"
        Ensure that you don't remove any CRDs that are being used by the operators. Removing these CRDs can lead to unexpected behavior and errors in Percona Everest.

    The list of CRD's for the operators is given below:

    === "Operators installed with Percona Everest"

        ??? example "OLM Operator"
            ```
            catalogsources.operators.coreos.com
            clusterserviceversions.operators.coreos.com
            installplans.operators.coreos.com
            olmconfigs.operators.coreos.com
            operatorconditions.operators.coreos.com
            operatorgroups.operators.coreos.com
            operators.operators.coreos.com
            subscriptions.operators.coreos.co
            ```

        ??? example "VictoriaMetrics Operator"
            ```
            vmrules.operator.victoriametrics.com
            vmnodescrapes.operator.victoriametrics.com
            vmauths.operator.victoriametrics.com
            vmprobes.operator.victoriametrics.com
            vmpodscrapes.operator.victoriametrics.com
            vmsingles.operator.victoriametrics.com
            vmstaticscrapes.operator.victoriametrics.com
            vmservicescrapes.operator.victoriametrics.com
            vmalertmanagerconfigs.operator.victoriametrics.com
            vmalertmanagers.operator.victoriametrics.com
            vmalerts.operator.victoriametrics.com
            vmagents.operator.victoriametrics.com
            vmclusters.operator.victoriametrics.com
            vmusers.operator.victoriametrics.com
            ```

        ??? example "Everest Operator"
            ```
            databaseclusterbackups.everest.percona.com
            databaseclusters.everest.percona.com
            databaseengines.everest.percona.com
            backupstorages.everest.percona.com
            databaseclusterrestores.everest.percona.com
            monitoringconfigs.everest.percona.com
            ```

    === "Operators that you need to select (atleast one)"
    
        ??? example "PXC Operator"
            ```
            perconaxtradbclusterbackups.pxc.percona.com
            perconaxtradbclusterrestores.pxc.percona.com
            perconaxtradbclusters.pxc.percona.com
            ```

        ??? example "PSMDB Operator"
            ```
            perconaservermongodbbackups.psmdb.percona.com
            perconaservermongodbrestores.psmdb.percona.com
            perconaservermongodbs.psmdb.percona.com
            ```
        
        ??? example "PG Operator (Percona and CrunchyData)"
            ```
            perconapgbackups.pgv2.percona.com
            perconapgrestores.pgv2.percona.com
            perconapgclusters.pgv2.percona.com
            postgresclusters.postgres-operator.crunchydata.com
            ```




