# Setup and prerequisites for manual installation

!!! note alert alert-primary "Note"
    The installation instructions in this guide go through all the manual installation and provisioning steps. To get started with Percona Everest as quickly as possible, Percona provides a script that automatically performs most steps.

    [See Percona Everest QuickStart guide :material-arrow-right:](../quickstart-guide/quick-install.md){.md-button}

## Setup

Percona Everest has two primary components:

* [Percona Everest CLI](https://docs.percona.com/everest/install/installEverestCLI.html), which connects Percona Everest to your Kubernetes cluster.
* Percona Everest application with the UI, which you can spin up using the instructions below.

### Supported operators

* Percona Operator for MySQL Based on Percona XtraDB Cluster (PXC) 1.13.0, 1.14.0
* Percona Operator for MongoDB (PSMDB) 1.15.0
* Percona Operator for PostgreSQL (PG) 2.3.1

### Supported k8s clusters

Percona Everest works on most of the cloud K8s and on most of the on-prem vanilla K8s. 

However, not all the many combinations of K8s distributions and K8s versions might be fully tested and certified. Please refer to the matrix below, and feel free to [contact us](SetupPrereqs.md#get-expert-help) in case of questions.

| Platform              | Kubernetes Version | Percona Everest Version | State                                   | 
|:----------------------|:-------------------|:------------------------|:----------------------------------------| 
| Google GKE            | 1.24 - 1.28        | >= 1.0.0                | Fully tested & certified                |
| Amazon EKS            | 1.24 - 1.28        | >= 1.0.0                | Fully tested & certified                |
| Vanilla K8s (kubeadm) | 1.24 - 1.28        | >= 1.0.0                | Fully tested & certified                |
| Azure AKS             | -                  | >= 1.0.0                | Works but not fully certified yet       |
| DigitalOcean          | 1.29 - 1.30        | >= 1.0.0                | Works but not fully certified yet       |
| OpenShift             | -                  |                         | Coming soon                             |
| Other cloud K8s       | -                  |                         | Should work but not fully certified yet |

**Note:**

- Air-gapped environments are still not supported, but its support is coming soon.

## Before you install

Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a publicly accessible Kubernetes cluster.

We recommend setting up Percona Everest on the [Amazon Elastic Kubernetes Service (EKS)](../quickstart-guide/eks.md) or on [Google Kubernetes Engine (GKE)](../quickstart-guide/gke.md), as Percona Everest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products) due to network issues.

## Prerequisites

Before getting started with Percona Everest, we recommend that you:
{.power-number}

1. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html){:target="_blank"} for EKS or the [gcloud CLI](https://cloud.google.com/sdk/docs/install){:target="_blank"} for GKE.
2. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under *~/.kube/config*. Run the following command:
    
    ```sh 
    kubectl get nodes
    ```

    ??? example "Expected output"
        ```
            NAME                                       STATUS   ROLES    AGE   VERSION
            gke-<name>-default-pool-75d48bfc-bx8g      Ready    <none>   11h   v1.26.7-gke.500
            gke-<name>-default-pool-75d48bfc-c2df      Ready    <none>   11h   v1.26.7-gke.500
            gke-<name>-default-pool-75d48bfc-zl7k      Ready    <none>   11h   v1.26.7-gke.500
        ```

### Next steps

Start by installing Everest: 

[Install Everest :material-arrow-right:](installEverest.md){.md-button}
