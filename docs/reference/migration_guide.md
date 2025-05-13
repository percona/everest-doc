# Migration: PMM DBaaS to Percona Everest

Migrating from Percona Monitoring and Management (PMM) DBaaS to Percona Everest has many benefits, such as decreased operational overhead, improved scalability, and enhanced flexibility. However, planning and executing the migration is crucial to minimize downtime and ensure data integrity. 

Here's a comprehensive guide to help you through the process.


## Before you migrate

Here are some key differences between Percona Everest and PMM DBaaS:
{.power-number}

1. Percona Everest has a separate and configurable namespace for running operators and database clusters, whereas PMM/DBaaS uses a default namespace.

2. Percona `everestctl` is a tool that helps you install and configure operators and monitoring features, whereas this function was previously handled by PMM.

3. Percona Everest has revamped its backup/restore feature, which means that old backups/restores cannot be used.


## Prerequisites

Before getting started with Percona Everest:
{.power-number}

1. Install [Docker Engine](https://docs.docker.com/engine/install){:target="_blank"} (1.13.0 and higher) with the [Docker compose plugin](https://docs.docker.com/compose/install/){:target="_blank"}.

2. Install [curl](https://everything.curl.dev/install/index.html){:target="_blank"}.

3. Install [jq](https://jqlang.github.io/jq/){:target="_blank"}.

4. Set up a publicly accessible Kubernetes cluster. 

    Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a publicly accessible Kubernetes cluster.

    We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), as Percona Everest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products) due to network issues.

   
    [Create EKS cluster :material-arrow-right:](../quickstart-guide/eks.md){.md-button} [Create GKE cluster :material-arrow-right:](../quickstart-guide/gke.md){.md-button}

5. Verify that you have access to the Kubernetes cluster that you want to use with Percona Everest. By default, Percona Everest uses the kubeconfig file available under `~/.kube/config`. 

    To verify access to the Kubernetes cluster, run:
   
    ```sh 
    kubectl get nodes
    ```

    ??? example "Expected output"
        
        ```{.text .no-copy}
        NAME                                    STATUS   ROLES    AGE   VERSION
        gke-<name>-default-pool-75d48bfc-bx8g   Ready    <none>   11h   v1.26.7-gke.500
        gke-<name>-default-pool-75d48bfc-c2df   Ready    <none>   11h   v1.26.7-gke.500
        gke-<name>-default-pool-75d48bfc-zl7k   Ready    <none>   11h   v1.26.7-gke.500
        ```


## Migration procedure

To migrate from PMM DBaaS to Percona Everest:
{.power-number}

1. [Install Everest](quickstart-guide/quick-install.md).
2. Migrate backup storages from PMM to Percona Everest:

    - Log in to the PMM UI and navigate to the **Backup > Storage Locations** section. The **Storage Location** page opens. You can see the storage locations configured on this page.
    - Click the downward arrow to see the details of the storage location that are configured.
    - Log in to Percona Everest and go to the **Backup Storages** section on the UI.
    - Copy-paste the values from the **details** on the configured storage locations in PMM and paste it to **[Add backup storage](../use/CreateStorage.md)** page in Percona Everest.

3. Migrate secrets for database clusters from one Kubernetes cluster to a new cluster using the pattern `everest-secrets-dbclusterName`. 

    Example:

    ```sh
    export DBNAME=mysql-btknhj
    export DBTYPE=pxc
    ```

    !!! note alert alert-primary "Note"
        The DBTYPE can be `pxc` or `psmdb` depending on whether it is a MySQL or MongoDB database.

    Get the secret from the kubernetes cluster registered in PMM:

    ```sh
    kubectl get secret "dbaas-$DBNAME-$DBTYPE-secrets" -o yaml | sed "s/name: dbaas-$DBNAME-.*-
    secrets/name: everest-secrets-$DBNAME/" | sed "s/namespace: default/namespace: percona-everest/" > 
    secret.yaml
    ```

    Apply the secret in the kubernetes cluster registered in Everest:

    ```sh
    kubectl apply -f secret.yaml
    ```


    !!! note alert alert-primary "Note"
        Keep the naming consistent across the two Kubernetes clusters.

4. [Create a new database cluster](use/db_provision.md) using the webUI. Run through the creation wizard to select resources, set the name, and configure the backup storage and monitoring of the cluster.
5. Restore data for your database clusters using the operator's backup and restore features.

    !!! note alert alert-primary "Note"
        - The restoration won't be available for you in the web UI, you'll need to refer to the corresponding operator's documentation for instructions on how to do this.

            -  For [PXC](https://docs.percona.com/percona-operator-for-mysql/pxc/backups-restore.html){:target="_blank"}
            -  For [PSMDB](https://docs.percona.com/percona-operator-for-mongodb/backups-restore.html){:target="_blank"}
            -  For [PostgreSQL](https://docs.percona.com/percona-operator-for-postgresql/2.0/backups-restore.html){:target="_blank"}

        - Each time you run a database cluster, repeat this step.

6. Disable the DBaaS feature in PMM by navigating to <i class="uil uil-cog"></i> **Configuration** → <i class="uil uil-setting"></i> **Settings** → **Advanced Settings** on the PMM UI and toggling <i class="uil uil-toggle-off"></i> the **Database as a Service (DBaaS)** option located in the **Technical preview features** section.

## What's next

After the migration, you can connect to the new database cluster to check if the data has been successfully migrated.


