# Uninstall Percona Everest using everestctl

!!! info "important"
    If you installed Percona Everest using `everestctl`, make sure to uninstall it exclusively through `everestctl` for a seamless removal.

You can run the commands below to remove all Everest resources including:

- All Kubernetes objects created by Everest
- All downloaded binaries and files like **everestctl**.

!!! note alert alert-primary "Warning"
    Uninstalling Everest will remove all database clusters and associated data from the Kubernetes cluster, including backups!


To uninstall Percona Everest, follow these steps:
{.power-number}


1. Run the following command:

    ```sh
    everestctl uninstall
    ```

2. Remove the unused [Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/){:target="_blank"}.

    !!! caution alert alert-warning "warning"

        - Deleting CRDs can potentially cause issues with any custom resources that depend on those definitions within the kubernetes cluster. Ensure that you do not remove any CRDs that are being used by operator deployments outside of Everest.

## How to remove CRDs

During the installation of Everest, the following operators are installed:
    
- Everest
- VictoriaMetrics
- OLM

Besides the operators mentioned above, you must have installed at least one of the following operators.
    
- [Percona Operator for MySQL(PXC)](https://docs.percona.com/percona-operator-for-mysql/pxc/index.html){:target="_blank"}
- [Percona Operator for MongoDB(PSMDB)](https://docs.percona.com/percona-operator-for-mongodb/index.html){:target="_blank"}
- [Percona Operator for PostgreSQL](https://docs.percona.com/percona-operator-for-postgresql/2.0/index.html){:target="_blank"}

    
### List of CRDs for the operators

Below is a list of CRDs for different operators.

=== "CRDs of operators installed with Percona Everest"

    ??? example "OLM operator"
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

    ??? example "VictoriaMetrics operator"
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
        vmscrapeconfigs.operator.victoriametrics.com
        vlogs.operator.victoriametrics.com
        ```

    ??? example "Everest operator"
        ```
        databaseclusterbackups.everest.percona.com
        databaseclusters.everest.percona.com
        databaseengines.everest.percona.com
        backupstorages.everest.percona.com
        databaseclusterrestores.everest.percona.com
        monitoringconfigs.everest.percona.com
        ```

=== "CRDs of optional operators that you selected (at least one)"
    
    ??? example "PXC operator"
        ```
        perconaxtradbclusterbackups.pxc.percona.com
        perconaxtradbclusterrestores.pxc.percona.com
        perconaxtradbclusters.pxc.percona.com
        ```

    ??? example "PSMDB operator"
        ```
        perconaservermongodbbackups.psmdb.percona.com
        perconaservermongodbrestores.psmdb.percona.com
        perconaservermongodbs.psmdb.percona.com
        ```
        
    ??? example "PostgreSQL operator (Percona and CrunchyData)"
        ```
        perconapgbackups.pgv2.percona.com
        perconapgclusters.pgv2.percona.com
        perconapgrestores.pgv2.percona.com
        perconapgupgrades.pgv2.percona.com
        crunchybridgeclusters.postgres-operator.crunchydata.com
        pgadmins.postgres-operator.crunchydata.com
        pgupgrades.postgres-operator.crunchydata.com
        postgresclusters.postgres-operator.crunchydata.com
        ```
                   
        !!! caution alert alert-warning "warning"
            The Percona Operator for PostgreSQL is a fork of the Crunchy Data's Postgres operator. Thus, if you are using the Crunchy Data's Postgres operator, do not remove the CRD `postgresclusters.postgres-operator.crunchydata.com.`

                    
### Examples for removing CRDs

Here are some examples of how to remove the CRDs.

#### Remove all the CRDs

To remove all the CRDS, you can use the following command:

```
cat <<EOF | xargs kubectl delete crd
catalogsources.operators.coreos.com
clusterserviceversions.operators.coreos.com
installplans.operators.coreos.com
olmconfigs.operators.coreos.com
operatorconditions.operators.coreos.com
operatorgroups.operators.coreos.com
operators.operators.coreos.com
subscriptions.operators.coreos.com
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
vmscrapeconfigs.operator.victoriametrics.com
vlogs.operator.victoriametrics.com
databaseclusterbackups.everest.percona.com
databaseclusters.everest.percona.com
databaseengines.everest.percona.com
backupstorages.everest.percona.com
databaseclusterrestores.everest.percona.com
monitoringconfigs.everest.percona.com
perconaxtradbclusterbackups.pxc.percona.com
perconaxtradbclusterrestores.pxc.percona.com
perconaxtradbclusters.pxc.percona.com
perconaservermongodbbackups.psmdb.percona.com
perconaservermongodbrestores.psmdb.percona.com
perconaservermongodbs.psmdb.percona.com
perconapgbackups.pgv2.percona.com
perconapgclusters.pgv2.percona.com
perconapgrestores.pgv2.percona.com
perconapgupgrades.pgv2.percona.com
crunchybridgeclusters.postgres-operator.crunchydata.com
pgadmins.postgres-operator.crunchydata.com
pgupgrades.postgres-operator.crunchydata.com
postgresclusters.postgres-operator.crunchydata.com
EOF   
```
        
??? example "Expected output"
    ```sh
    customresourcedefinition.apiextensions.k8s.io "catalogsources.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "clusterserviceversions.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "installplans.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "olmconfigs.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "operatorconditions.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "operatorgroups.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "operators.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "subscriptions.operators.coreos.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmrules.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmnodescrapes.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmauths.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmprobes.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmpodscrapes.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmsingles.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmstaticscrapes.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmservicescrapes.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmalertmanagerconfigs.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmalertmanagers.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmalerts.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmagents.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmclusters.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmusers.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vmscrapeconfigs.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "vlogs.operator.victoriametrics.com" deleted
    customresourcedefinition.apiextensions.k8s.io "databaseclusterbackups.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "databaseclusters.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "databaseengines.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "backupstorages.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "databaseclusterrestores.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "monitoringconfigs.everest.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaxtradbclusterbackups.pxc.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaxtradbclusterrestores.pxc.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaxtradbclusters.pxc.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaservermongodbbackups.psmdb.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaservermongodbrestores.psmdb.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconaservermongodbs.psmdb.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconapgbackups.pgv2.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconapgclusters.pgv2.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconapgrestores.pgv2.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "perconapgupgrades.pgv2.percona.com" deleted
    customresourcedefinition.apiextensions.k8s.io "crunchybridgeclusters.postgres-operator.crunchydata.com" deleted
    customresourcedefinition.apiextensions.k8s.io "pgadmins.postgres-operator.crunchydata.com" deleted
    customresourcedefinition.apiextensions.k8s.io "pgupgrades.postgres-operator.crunchydata.com" deleted
    customresourcedefinition.apiextensions.k8s.io "postgresclusters.postgres-operator.crunchydata.com" deleted
    ```

#### Remove CRDs of Percona's PostgreSQL operator

If you are using the PostgreSQL operator from **Crunchy Data**, do not remove the `postgresclusters.postgres-operator.crunchydata.com` CRD. 

In this case, run the following command:

```sh
cat <<EOF | xargs kubectl delete crd
perconapgbackups.pgv2.percona.com
perconapgrestores.pgv2.percona.com
perconapgclusters.pgv2.percona.com
EOF
```













