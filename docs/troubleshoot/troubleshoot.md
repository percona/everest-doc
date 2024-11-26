# Troubleshooting common issues in Percona Everest


This section is your go-to resource for tackling common issues and finding solutions. For additional troubleshooting tips and known issues, see the Percona Everest [Release Notes](../release-notes/release_notes_index.md) and [known limitations](../reference/known_limitations.md) section.




## Comprehensive installation overview

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/) to manage the operators. OLM is deployed explicitly to the `everest-olm` namespace. 

The main components are:

* olm-operator
* catalog-operator
* packageserver

### Percona Everest installation

When you install Percona Everest, the following components are installed:
{.power-number}


1. The `olm-operator`, `catalog-operator`, and  `packageserver` gets installed in the `everest-olm` namespace:

    Execute the following command, all three deployments should be present in the `everest-olm` namespace

    ```
    kubectl get deploy -n everest-olm
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

### OLM subscription

The process of installing an operator with OLM (Operator Lifecycle Manager) begins with creating a [subscription](https://olm.operatorframework.io/docs/concepts/crds/subscription/). OLM will reconcile this subscription and generate an installation plan. Once the installation plan is approved, OLM will create a Cluster Service Version (CSV), which installs everything necessary for the operator to function properly.


In addition to OLM, Percona Everest consists of these operators:

- Percona Operator for MySQL (PXC)
- Percona Operator for MongoDB (PSMDB)
- Percona Operator for PostgreSQL (PG)


In this section, we group all the database (DB) operators together because they are managed in the same way. When you run the command `everestctl install`, you must choose which operators to install (PXC, PSMDB, PG) and specify the namespaces for each. The following example assumes that you installed all the operators in the `everest` namespace:

??? example "Examples"
    ```
    kubectl get sub -n everest
    NAME                              PACKAGE                           SOURCE            CHANNEL
    percona-xtradb-cluster-operator   percona-xtradb-cluster-operator   everest-catalog   stable-v1
    percona-server-mongodb-operator   percona-server-mongodb-operator   everest-catalog   stable-v1
    percona-postgresql-operator       percona-postgresql-operator       everest-catalog   stable-v2
    ```

    ```
    kubectl get ip -n everest
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
    kubectl get csv -n everest
    NAME                                              DISPLAY                                                       
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
    kubectl get deploy -n everest
    NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
    percona-xtradb-cluster-operator   1/1     1            1           23m
    percona-server-mongodb-operator   1/1     1            1           22m
    percona-postgresql-operator       1/1     1            1           21m
    ```

## Database deployment

In Everest, every database begins with a DatabaseCluster (DBC) Custom Resource (CR) that is deployed to the chosen namespace. Depending on the selected engine type, this DBC will be converted into a corresponding Custom Resource that can be understood by the database operator, whether it be `PXC`, `PSMDB`, or `PG`.

Example:
This gives a step by step approach to troubleshoot if something goes wrong with your database deployment:
{.power-number}

1. Run the following command:

    ```
    kubectl get db -n everest
    NAME        SIZE   READY   STATUS   HOSTNAME                    AGE
    mysql-7tl   2      2       ready    mysql-7tl-haproxy.everest   6m8s

    kubectl get pxc -n everest
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


## Backups and restores

### Backups

Every backup in percona Everest begins with the creation of a `DatabaseClusterBackup (DBB)` `Custom Resource (CR)` that is deployed to a selected namespace. Depending on the chosen engine type, this `DBB` will be converted into the corresponding Custom Resource that can be interpreted by the database operator, such as `pxc-backup`, `psmdb-backup`, or `pg-backup`.

```
kubectl describe pxc-backup
kubectl describe psmdb-backup
kubectl describe pg-backup
```

### Restores

Every Restore operation in Everest begins with a `DatabaseClusterRestore (DBR)` Custom Resource (CR) that is deployed in the specified namespace. Based on the selected engine type, this `DBR` will be transformed into the corresponding Custom Resource that can be processed by the database operator, such as `pxc-restore`, `psmdb-restore`, or `pg-restore`.

```sh
kubectl describe pxc-restore restoreName
kubectl describe psmdb-restore restoreName 
kubectl describe pg-restore restoreName
```












