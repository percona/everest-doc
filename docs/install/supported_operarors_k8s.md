# Setup and prerequisites

Percona Everest has two primary components:

* [Percona Everest CLI](https://docs.percona.com/everest/install/installEverestCLI.html), which connects Percona Everest to your Kubernetes cluster.
* Percona Everest application with the UI, which you can spin up using the instructions below.

## Supported operators

* Percona Operator for MySQL Based on Percona XtraDB Cluster (PXC) 1.14.0, 1.15.0
* Percona Operator for MongoDB (PSMDB) 1.15.0
* Percona Operator for PostgreSQL (PG) 2.3.1, 2.4.1

## Supported k8s clusters

Percona Everest works on most of the cloud K8s and on most of the on-prem vanilla K8s.

However, not all the many combinations of K8s distributions and K8s versions might be fully tested and certified. Refer to the matrix below and [reach out to us](SetupPrereqs.md#get-expert-help) should you have any questions.

| Platform              | Kubernetes Version | State                                   |
|:----------------------|:-------------------|:----------------------------------------|
| Google GKE            | 1.27 - 1.29        | Fully tested and certified                |
| Amazon EKS            | 1.28 - 1.30        | Fully tested and certified                |
| Azure AKS             | -                  | Works but not fully certified yet       |
| DigitalOcean          | -                  | Works but not fully certified yet       |
| Vanilla K8s (kubeadm) | -                  | Works but not fully certified yet       |
| OpenShift             | -                  | Coming soon                             |
| Other cloud K8s       | -                  | Should work but not fully certified yet |

!!! note
    Air-gapped environments (i.e. environments physically isolated from unsecured networks such as the public Internet) are not currently supported. Their support is coming soon.

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

## Next steps

Start by installing Everest:

[Install Everest :material-arrow-right:](installEverest.md){.md-button}
