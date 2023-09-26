# Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Set up a publicly accessible Kubernetes cluster. 

    Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a publicly accessible Kubernetes cluster.

    We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), as Percona Everest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products) due to network issues.

   
    [Create EKS cluster :material-arrow-right:](../install/eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](../install/gke.md){.md-button}

2. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under `~/.kube/config`. 

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

## Next step

 [Install Percona Everest :material-arrow-right:](qs-prerequisites.md){.md-button}

