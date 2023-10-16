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

   
    [Create EKS cluster :material-arrow-right:](eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](gke.md){.md-button}

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

## Pre-migration

Some points worth noting before you migrate to Percona Everest:

1. Everest uses a configurable and separate namespace to run operators and database clusters while PMM/DBaaS uses a default namespace for that
2. Everestctl installs operators and helps you to install/configure operators and monitoring features while this part was on the PMM side
3. Everest revamped the backup/restore feature and it’s not possible to use old backup/restores


## Migrate



## Post-migration


