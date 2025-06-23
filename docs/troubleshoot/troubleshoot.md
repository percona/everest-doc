# Troubleshooting issues

This section is your go-to resource for tackling common issues and finding solutions. For additional troubleshooting tips and known issues, see the Percona Everest [Release Notes](../release-notes/release_notes_index.md) and [known limitations](../reference/known_limitations.md) section.


## General troubleshooting  guidelines

Before troubleshooting, it's important to understand how Percona Everest works at a high level. Understanding how it works can help narrow down potential areas to investigate.

The [kubectl quick reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/){:target="_blank"} is a useful resource.

Depending on the specific issue, you can review different logs for additional information.
{.power-number}

1. Percona operator logs:

    ```sh
    kubectl logs -f deploy/everest-operator -n everest-system
    ```

2. Percona Everest server Logs:

    ```sh
    kubectl logs -f deploy/everest-server -n everest-system
    ```

3. Percona operator logs in namespaces. For example in everest namespace:

    ```sh
    kubectl logs -f deploy/percona-postgresql-operator -n everest
    kubectl logs -f deploy/percona-server-mongodb-operator -n everest
    kubectl logs -f deploy/percona-xtradb-cluster-operator -n everest
    ```

4. Victoria Metrics operator logs for monitoring issues:

    ```sh
    kubectl logs -f deploy/vm-operator -n everest-monitoring
    kubectl logs -f deploy/vmagent-everest-monitoring -n everest-monitoring
    ```

5. Logs of database Pods/Proxy:

    ```sh
    kubectl logs -f <pod-name of database or proxy> -c <database-container>
    ```

6. Events (Events are stored only for 60 mins, if there are any events which are older than 60 mins, it will be lost).

    ```sh
    kubectl get events --sort-by=".lastTimestamp"
    ```

## Comprehensive installation overview

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/){:target="_blank"} to manage the operators. OLM is deployed explicitly to the `everest-olm` namespace. 

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

The process of installing an operator with OLM (Operator Lifecycle Manager) begins with creating a [subscription](https://olm.operatorframework.io/docs/concepts/crds/subscription/){:target="_blank"}. OLM will reconcile this subscription and generate an installation plan. Once the installation plan is approved, OLM will create a Cluster Service Version (CSV), which installs everything necessary for the operator to function properly.


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

### Database deployment

In Everest, every database begins with a DatabaseCluster (DBC) Custom Resource (CR) that is deployed to the chosen namespace. Depending on the selected engine type, this DBC will be converted into a corresponding Custom Resource that can be understood by the database operator, whether it be `PXC`, `PSMDB`, or `PG`.


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


## Resolving common issues in Percona Everest

### Installation issues

For troubleshooting Percona Everest installation issues using the **everestctl** or the **Helm chart**, the following steps may be helpful:
{.power-number}

1. Appropriate privileges may be required depending on the selected components for installation. For instance, if OLM is to be installed, `cluster-admin` privileges are required. If any of the components fail, verify that the appropriate privileges are granted.

    Run the following command to check if the required privileges are granted:

    ```sh
    kubectl auth can-i
    ```

2. Verify the installation status of the Helm chart. A properly functioning chart should be in a **Deployed** status. 

    To verify the values used during the chart installation, run the following command:

    ```sh
    helm list -n everest-system
    NAME  NAMESPACE   REVISION  UPDATED                             	STATUS  	CHART        	APP VERSION
    everest-core everest-system	1  2025-01-16 16:24:56.577713 +0530 
    IST	deployed	everest-1.4.0	1.4.0
    ```

3. As there are many components in the Percona Everest installation, installation will fail if any of the **subcomponent installations fail**. Check the relevant namespace where components are installed, along with the logs and events.

    For instance, a job is created to approve the installation plan for operators. If there are no resources left in the cluster to run pods, the Helm installation will continue waiting for the specified ``--timeout`` or the default of 5 minutes before failing.

### API/Authentication/frontend issues

To troubleshoot issues with the Percona Everest API, authentication, or frontend, check the everest-server deployment. 
{.power-number}

1. If the Percona Everest API is not working, check the status of the everest-server pod, specifically its **Status** and **Restarts**.

    ```sh
    kubectl get po -l app.kubernetes.io/name=everest-server -n everest-system
    NAME                             READY  STATUS  RESTARTS   AGE
    everest-server-78699679d4-kgqk5  1/1    Running   0             
    4d23h
    ```

2. Check the `everest-server` logs. 

    ```sh
    kubectl logs -f deploy/everest-server -n everest-system
    ```

3. To resolve authentication and access issues, check the Percona Everest server logs. If [Role-Based Access Control (RBAC)](../administer/rbac.md) is implemented, [validate](../administer/administer/rbac.md#validate-your-rbac-policy) or [check the permissions](../administer/rbac.md#test-your-rbac-policy) using `everestctl`.

    ```sh
    kubectl get configmap everest-rbac -n everest-system
    ```

4. Check the `everest-operator` logs for any reconciliation errors.

    ```sh
    kubectl logs -f deploy/everest-operator -n everest-system
    ```

5. If you experience any access issues or lag in the Percona Everest frontend or API, try port-forwarding to the service and check the latency compared to accessing it via a LoadBalancer or NodePort. Once you have set up the port-forward, access the webpage using `localhost:8080`.


    ```sh
    kubectl port-forward svc/everest 8080:8080
    ```

### Database operation issues

Here are the common issues related to the database operations:
{.power-number}

1. Check the `everest-operator` logs if the `DatabaseCluster` object has not been created or if there are any issues with it. 

    ```sh
    kubectl logs -f deploy/everest-operator -n everest-system
    ```

2. Check the `DatabaseCluster` object, verify its status and events. The status should be **Ready**. If it is anything other than **Ready**, further investigation is required. Describing the `DatabaseCluster` object provides details about the database configuration.

    ```sh
    kubectl get DatabaseCluster <DatabaseCluster-Name>
    kubectl describe DatabaseCluster <DatabaseCluster-Name>
    kubectl get DatabaseCluster <DatabaseCluster-Name> -oyaml
    ```


3. Check the relevant database objects such as PXC, PSMDB, and PG, as well as the operator logs. For instance, check the PXC object followed by the operator logs.


    ```sh
   kubectl get pxc <database-name>
   kubectl describe pxc <database-name>
   kubectl get pxc <database-name> -oyaml 
   kubectl logs -f deploy/percona-xtradb-cluster-operator
   # Change to pxc,psmdb,pg for respective database
    ```

4. Check the database pod logs:

    ```sh
  kubectl logs -f <database-pod-name> -c <database-container-name>  
  (container name could be database,pxc,mongo)
  ```





























