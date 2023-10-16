# Migrate from PMM DBaaS to Percona Everest

Migrating from PMM DBaaS to Percona Everest has many benefits, such as decreased operational overhead, improved scalability, and enhanced flexibility. However, planning and executing the migration is crucial to minimize downtime and ensure data integrity. 

Here's a comprehensive guide to help you through the process.

## Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Install [Docker Engine](https://docs.docker.com/engine/install){:target="_blank"} (1.13.0 and higher) with the [Docker compose plugin](https://docs.docker.com/compose/install/){:target="_blank"}.

2. Install [curl](https://everything.curl.dev/get){:target="_blank"}.

3. Install [jq](https://jqlang.github.io/jq/){:target="_blank"}.

4. Set up a publicly accessible Kubernetes cluster. 

    Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a publicly accessible Kubernetes cluster.

    We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), as Percona Everest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products) due to network issues.

   
    [Create EKS cluster :material-arrow-right:](quickstart-guide/eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](quickstart-guide/gke.md){.md-button}

5. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under `~/.kube/config`. 

    To verify access to the Kubernetes cluster, run the following command:
   
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

## Before you migrate

Here are some key differences between Everest and PMM/DBaaS:

1. Everest has a separate and configurable namespace for running operators and database clusters, whereas PMM/DBaaS uses a default namespace.

2. Everestctl is a tool that helps you install and configure operators and monitoring features, whereas this function was previously handled by PMM.

3. Everest has revamped its backup/restore feature, which means that old backups/restores cannot be used.

## Migrate

1. Create a new Kubernetes cluster.
2. [Provision](use/db_provision.md) the cluster using everestctl.
3. Connect your PMM instance (if required.)
4. Migrate backup storages from PMM to Everest.
5. Migrate from one Kubernetes cluster to a new cluster using the pattern `everest-secrets-dbclusterName`. 
   
       !!! note alert alert-primary "Note"
           Keep names consistent across two Kubernetes clusters.

6. Create a new database cluster using the webUI. Run through the creation wizard to select resources, set the name, and configure the backup storage and monitoring of the cluster.
7. Restore data for your database clusters using the operator's backup and restore features.

    !!! note alert alert-primary "Note"
        The restoration won't be available for you in the web UI for this run, but other backups/restores will be there.

        1. For PXC https://docs.percona.com/percona-operator-for-mysql/pxc/backups.html
        2. For PSMDB https://docs.percona.com/percona-operator-for-mongodb/backups.html

8.  Each time you run a database cluster, repeat this step.

9. Disable the ***Database as a Service (DBaaS)** feature in PMM Settings to prevent accidental usage and confusion.


## Post-migration

### Perform tests


