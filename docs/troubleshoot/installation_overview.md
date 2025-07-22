# Percona Everest installation and workflow

This section provides an overview of how Percona Everest is installed, the components involved, and the workflow, from operator installation to database provisioning, backups, and restores.


## Percona Everest installation workflow

Starting from Percona Everest v1.4.0, the [CLI installation](../install/installEverest.md) is a wrapper around the helm charts:

- [everest-core](https://github.com/percona/percona-helm-charts/tree/main/charts/everest){:target="_blank"} 

- [everest-db-namespace](https://github.com/percona/percona-helm-charts/tree/main/charts/everest/charts/everest-db-namespace){:target="_blank"}. 

The installation flow is as follows:
{.power-number}

1. The `everest-core` helm chart is installed:

    This step deploys all the core components required for Percona Everest to function.

    | Component category   | Namespace            | Components                                                  |
    |----------------------|----------------------|-------------------------------------------------------------|
    | OLM components       | `everest-olm`        | `olm-operator`, `catalog-operator`, `package-server`, `everest-catalog` |
    | Monitoring stack     | `everest-monitoring` | `vm-operator`, `kube-state-metrics`                         |
    | Everest components   | `everest-system`     | `everest-server`, `everest-operator`                        |


2. The `everest-db-namespace` chart is installed in the `everest` namespace. This chart handles the deployment of database operators using the following workflow:

    1. Creates OLM subscriptions for each of the selected database operators (by default, all supported operators are selected).
    2. OLM reconciles the subscriptions and creates an install plan for each operator.
    3. A Helm hook creates the `everest-operators-installer` job that waits for the OLM install plan to be created and approves it once created.
    4. OLM reconciles the approved install plan and creates a `cluster-service-version` for each database operator. The CSV includes all the manifests needed to install the operator. OLM automatically applies these manifests, and the operator is installed.


### Configurable installation options 

Percona Everest supports several configuration flags for customizing the installation.

**Namespace configuration**

| **Flag**                  | **Description**                                     |
| --------------------- | ----------------------------------------------- |
| `--namespaces everest`  | By default, the `everest` namespace is used, and all the database operators (PXC, PSMDB, and PG) are installed. |
| `--namespaces n1,n2`  | Deploy database operators in custom namespaces. |
| `--skip-db-namespace` | Skip creation of database namespaces.           |

??? example "Example"
    You can provision multiple database namespaces simultaneously by providing a comma-separated list with the `--namespaces` flag.

    ```sh
    everestctl install --namespaces n1,n2
    ```


**Operator installation flags**

If you want to skip the installation of certain operators, you can use the following flags:

| **Flag** | **Description**|
| --------------------------------- | ------------------------------------ |
| `--operator.mongodb=false`        | Skip installing MongoDB operator.    |
| `--operator.postgresql=false`     | Skip installing PostgreSQL operator. |
| `--operator.xtradb-cluster=false` | Skip installing PXC operator.        |

### Manage namespaces

You can manage database namespaces after the initial installation using the following commands:

```sh
everestctl namespaces add [NAMESPACE]
everestctl namespaces update [NAMESPACE]
everestctl namespaces remove [NAMESPACE]
```

For detailed information on managing namespaces, see the [Namespaces management](../administer/manage_namespaces.md) section.

The [helm installation method](../install/install_everest_helm_charts.md) provides an identical flow to the one described above, with similar configuration options. Refer to the [helm chart documentation](https://github.com/percona/percona-helm-charts/tree/main/charts/everest){:target="_blank"} for a full list of available [configuration options](https://github.com/percona/percona-helm-charts/tree/main/charts/everest#configuration){:target="_blank"}.

## Percona Everest server and operator workflow

### Database creation workflow

Here's the database creation workflow in Percona Everest:
{.power-number}

1. The Percona Everest user is authenticated and logged in and a JWT Token is provided.
2. The user creates a database, either through the frontend UI or `everestctl` or via the APl.
3. The Percona Everest API is invoked to create a create a **Custom Resource Definition (CRD)**. The Percona Everest server then creates a custom resource `DatabaseCluster`.
4. In the `everest-operator` reconciliation loop, once the `DatabaseCluster` object is recognized, an appropriate custom resource for the database is created, for example if it’s PXC , `PerconaXtraDBCluster` is created.
5. The database operator takes over the task of creating the database and the necessary objects to manage it.


    !!! note
        Other actions, such as creating backups, restores ,monitoring or deleting the objects follows a similar flow except the objects involved may differ.

        All the custom resources connected to Percona Everest follow a similar flow except the `DatabaseEngine`.

### Database engine workflow

Here’s the workflow for the database engine in Percona Everest:
{.power-number}

1. The user installs the everest db namespace chart either as part of initial installation or as a [separate step](https://github.com/percona/percona-helm-charts/tree/main/charts/everest#4-deploy-additional-database-namespaces).
2. [Subscriptions](https://github.com/percona/percona-helm-charts/tree/main/charts/everest/charts/everest-db-namespace/templates){:target="_blank"} are created for the operators chosen while installing the helm chart.
3. OLM **reconciles the Subscriptions** and creates an **InstallPlan**.
4. The helm chart creates a kubernetes job called e`verest-operators-installer` that waits for the InstallPlan to be created and approves it.
5. OLM detects that the **InstallPlan** has been approved and creates a `ClusterServiceVersion`, deploying all components that make up the database operator.
6. The Percona Everest operator detects the deployment resource of the database operator and reconciles the **DatabaseEngine CR** of the corresponding type. 

7. During the reconciliation process, the everest operator detects the installed version and queries [Percona’s Version Service](https://github.com/Percona-Lab/percona-version-service){:target="_blank"} to fetch supported engine versions.
 
??? example "Example"
    Check [Percona.com](https://docs.percona.com/){:target="_blank"} to get the engine versions supported by that operator. 
    To check which MongoDB versions are supported by MongoDB Operator (PSMDB) v1.19.0, visit:
    
    🔗 (https://github.com/Percona-Lab/percona-version-service/blob/09867dc07b553e452df2330e50185d98b68ed90a/sources/operator.1.19.0.psmdb-operator.json#L7-L73){:target="_blank"}.
