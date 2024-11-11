# Troubleshooting strategies for Percona Everest


This section is your go-to resource for tackling common issues and finding solutions. For additional troubleshooting tips and known issues, see the Percona Everest [Release Notes](../release-notes/release_notes_index.md) and [known limitations](../reference/known_limitations.md) section.


??? info "High-level checklist"

    ## Troubleshooting checklist

    Here’s a high level checklist to help you identify some potential issues you might 
    encouner while using Percona Everest.
    {.power-number}

    1. Are you using the recommended Percona Everest and compatible operator versions?
    2. Did you check the known issues section in the [Release Notes](../release-notes/release_notes_index.md) for that particular Percona Everest release?

    3. Do the logs contain any messages about the problem? See Message logs and Trace logs for more information.
    4. Does the problem occur while you deploy a specific database?
    5. Does the problem occur when you perform a particular task, like backups, restores etc?
    6. Are you using the [authentication](../administer/Idp_integration.md) correctly?
    7. Have you allocated enough resources for deploying your databases on Percona Everest?
    8. Are you using a Technical Preview feature? Technical Preview features are not production-ready and should only be used in testing environments. For more information, see the relevant [Release Notes](../release-notes/release_notes_index.md).



## Troubleshooting topics

We have organized the topics into distinct categories to assist you in exploring the information more easily. 


### Percona Everest installation

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/) to manage the operators. OLM is deployed explicitly to the `everest-olm` namespace. 

The main components are:

* olm-operator
* catalog-operator
* packageserver

When you install Percona Everest, the following components are installed:
{.power-number}


1. The `olm-operator`, `catalog-operator`, and  `packageserver` gets installed in the `everest-olm` namespace:

    Execute the following command, all the three deployments should be present in the `everest-olm` namespace

    ```
    $ kubectl get deploy -n everest-olm
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    olm-operator       1/1     1            1           5m38s
    catalog-operator   1/1     1            1           5m37s
    packageserver      2/2     2            2           3m2s
    ```
    
2. The `everest-catalog` is installed, which serves as the repository for all the operators that Percona Everest supports. 

    Execute the following command, `everest-catalog` should be present in the `everest-olm` namespace:

    ```sh
    kubectl get catalogsources -n everest-olm
    NAME              DISPLAY           TYPE   PUBLISHER   AGE
    everest-catalog   Everest Catalog   grpc   Percona     6m5s
    ```

#### OLM subscription

The process of installing an operator with OLM (Operator Lifecycle Manager) begins with creating a [subscription](https://olm.operatorframework.io/docs/concepts/crds/subscription/). OLM will reconcile this subscription and generate an installation plan. Once the installation plan is approved, OLM will create a Cluster Service Version (CSV), which installs everything necessary for the operator to function properly.


In addition to OLM, Everest consists of five different operators:

- Everest
- VictoriaMetrics
- Percona Operator for MySQL (PXC)
- Percona Operator for MongoDB (PSMDB)
- Percona Operator for PostgreSQL (PG)

=== "Everest"
    The Everest Operator is always installed to the `everest-system` namespace. If the operator is installed properly, you should find a subscription, an install plan and a cluster service version for this operator:

    ??? example "Examples"
        ```sh
        $ kubectl get sub -n everest-system
        NAME               PACKAGE            SOURCE            CHANNEL
        everest-operator   everest-operator   everest-catalog   stable-v0
        ```

        ```
        $ kubectl get ip -n everest-system
        NAME            CSV                       APPROVAL   APPROVED
        install-69g62   everest-operator.v0.10.1  Manual     true
        ```

        ```
        $ kubectl get csv -n everest-system
        NAME                      DISPLAY            VERSION   REPLACES                   PHASE
        everest-operator.v0.10.1  Everest operator   0.10.1    everest-operator.v0.9.0    Succeeded
        ```

        ```
        $ kubectl get deploy -n everest-system
        NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
        everest-operator-controller-manager   1/1     1            1           12m
        percona-everest                       1/1     1            1           11m
        ```
    
        !!! note

            In the last command, besides the Everest operator, you also see the `percona-everest` deployment in the `everest-system `namespace; this is the Percona Everest UI/API deployment.


=== "VictoriaMetrics"
    In this section, we group all the database (DB) operators together because they are managed in the same way. When you run the command `everestctl install`, you must choose which operators to install (PXC, PSMDB, PG) and specify the namespaces for each. The following example assumes that you want to install all the operators in the `everest` namespace:

    ??? example "Examples"
        ```
        $ kubectl get sub -n everest
        NAME                              PACKAGE                           SOURCE            CHANNEL
        percona-xtradb-cluster-operator   percona-xtradb-cluster-operator   everest-catalog   stable-v1
        percona-server-mongodb-operator   percona-server-mongodb-operator   everest-catalog   stable-v1
        percona-postgresql-operator       percona-postgresql-operator       everest-catalog   stable-v2
        ```

        ```
        $ kubectl get ip -n everest
        NAME            CSV      APPROVAL                                    
        APPROVED
        install-tjwjf   percona-xtradb-cluster-operator.v1.14.0   Manual  
        true
        install-8cl7m   percona-server-mongodb-operator.v1.15.0   Manual     
        true
        install-8lz2n   percona-postgresql-operator.v2.3.1.       Manual     
        true
        ```
        
        ```
        $ kubectl get csv -n everest
        NAME                                      DISPLAY                                                       
        VERSION   REPLACES                                  PHASE
        percona-xtradb-cluster-operator.v1.14.0   Percona Operator for MySQL based on Percona XtraDB Cluster   
        1.14.0    percona-xtradb-cluster-operator.v1.13.0   Succeeded
        percona-server-mongodb-operator.v1.15.0   Percona Distribution for MongoDB Operator                    
        1.15.0    percona-server-mongodb-operator.v1.14.0   Succeeded
        percona-postgresql-operator.v2.3.1        Percona Operator for PostgreSQL                              
         2.3.1                                               Succeeded
        everest-operator.v0.10.1                  Everest operator                                             
        0.10.1    everest-operator.v0.9.0                   Succeeded
        ```

        ```
        $ kubectl get deploy -n everest
        NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
        percona-xtradb-cluster-operator   1/1     1            1           23m
        percona-server-mongodb-operator   1/1     1            1           22m
        percona-postgresql-operator       1/1     1            1           21m
        ```

=== "DB operators"
    We use the VictoriaMetrics stack along with [kube-state-metrics](https://kubernetes.io/docs/concepts/cluster-administration/kube-state-metrics/) for monitoring. Both can be found in the `everest-monitoring` namespace.

    ??? example "Examples"

        The following example installs all the operators to the `everest` namespace:
        ```
        $ kubectl get sub -n everest-monitoring
        NAME                   PACKAGE                    SOURCE            
        CHANNEL
        victoriametrics-operator   victoriametrics-operator   everest-  
        catalog   stable-v0
        ```

        ```
        $ kubectl get ip -n everest-monitoring
        NAME            CSV                                APPROVAL   
        APPROVED
        install-nw6sf   victoriametrics-operator.v0.29.1   Manual     true
        ```
        
        ```
        $ kubectl get csv -n everest-monitoring
        NAME                               DISPLAY                    
        VERSION   REPLACES                           PHASE
        victoriametrics-operator.v0.29.1   VictoriaMetrics Operator  0.29.1  
        victoriametrics-operator.v0.27.2   Succeeded
        ```

        ```
        $ kubectl get deploy -n everest-monitoring
        NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
        vm-operator-vm-operator   1/1     1            1           19m
        kube-state-metrics        1/1     1            1           19m
        ```
    The Everest Operator monitors these resources to reconcile the DatabaseEngine Custom Resource Definitions (CRs) for each installed database operator. These DatabaseEngine CRs provide the user interface (UI) with information about the available database engines and their supported versions. If you experience any issues with the list of available database engines or their versions, this is the area to investigate.

    ??? example "Example"
        ```
        $ kubectl get dbengine -n everest
        NAME                              TYPE         STATUS      OPERATOR VERSION
        percona-xtradb-cluster-operator   pxc          installed   1.14.0
        percona-server-mongodb-operator   psmdb        installed   1.15.0
        percona-postgresql-operator       postgresql   installed   2.3.1
        ```

    !!! note
        The Everest Operator requires an internet connection to reach [check.percona.com](http://check.percona.com/) to get the supported versions for each engine. You can troubleshoot this step by looking at the everest operator logs:

        ```
        kubectl logs pods/everest-operator-controller-manager-5b868c4fcc-rt6rp -n everest-system
        ```

### Database deployment

In Everest, every database begins with a DatabaseCluster (DBC) Custom Resource (CR) that is deployed to the chosen namespace. Depending on the selected engine type, this DBC will be converted into a corresponding Custom Resource that can be understood by the database operator, whether it be pxc, psmdb, or pg.

Example:
This gives a step by step approach to troubleshoot if something goes wrong with your database deployment:
{.power-number}

1. Run the following command:

    ```
    $ kubectl get db -n everest
    NAME        SIZE   READY   STATUS   HOSTNAME                    AGE
    mysql-7tl   2      2       ready    mysql-7tl-haproxy.everest   6m8s

    $ kubectl get pxc -n everest
    NAME        ENDPOINT                    STATUS   PXC   PROXYSQL   HAPROXY   AGE
    mysql-7tl   mysql-7tl-haproxy.everest   ready    1                1         6m10s
    ```

2. If an issue arises, first investigate these two objects by executing the following commands:

    ```
    kubectl describe db/mysql-7tl -n everest
    kubectl describe pxc/mysql-7tl -n everest
    ```

3. If relevant information is not found here, then check the Everest Operator logs as well as the PXC Operator logs:

    ```
    kubectl logs pods/everest-operator-controller-manager-5b868c4fcc-rt6rp -n everest-system
    kubectl logs pods/percona-xtradb-cluster-operator-77c5ffddf6-fv8vg -n everest
    ```
            
    !!! note

        The names of the pods in your deployment may vary. If nothing relevant appears, check the logs for details.


### Backups and restores

#### Backups

Every backup in percona Everest begins with the creation of a `DatabaseClusterBackup (DBB)` `Custom Resource (CR)` that is deployed to a selected namespace. Depending on the chosen engine type, this `DBB` will be converted into the corresponding Custom Resource that can be interpreted by the database operator, such as `pxc-backup`, `psmdb-backup`, or `pg-backup`.

```
kubectl describe pxc-backup
kubectl describe psmdb-backup
kubectl describe pg-backup
```

#### Restores

Every Restore operation in Everest begins with a `DatabaseClusterRestore (DBR)` Custom Resource (CR) that is deployed in the specified namespace. Based on the selected engine type, this `DBR` will be transformed into the corresponding Custom Resource that can be processed by the database operator, such as `pxc-restore`, `psmdb-restore`, or `pg-restore`.

```sh
kubectl describe pxc-restore restoreName
kubectl describe psmdb-restore restoreName 
kubectl describe pg-restore restoreName
```












