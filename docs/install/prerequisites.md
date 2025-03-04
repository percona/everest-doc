# Prerequisites

Before getting started with Percona Everest, we recommend that you:
{.power-number}


1. Install [Helm v3  :octicons-link-external-16:](https://docs.helm.sh/using_helm/#installing-helm) to install Percona Everest using Helm.

2. Install [yq :octicons-link-external-16:](https://github.com/mikefarah/yq) to install Percona Everest using Helm.

3. Verify that you can access the Kubernetes cluster you want to use with Everest. By default, Everest uses the kubeconfig file available under *~/.kube/config*. Run the following command:

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


## Before you install Percona Everest

You can install Percona Everest using one of the following methods:


* [Helm charts](../install/install_everest_helm_charts.md)

* [Percona Everest CLI](https://docs.percona.com/everest/install/installEverestCLI.html), which connects Percona Everest to your Kubernetes cluster.


Once you’ve installed Percona Everest, you can easily log into the Percona Everest UI by following the setup instructions in the next section.

!!! important
    Percona Everest assists with installing all the necessary operators and packages but does not currently help spin up a publicly accessible Kubernetes cluster.

We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE). Due to network issues, Percona Everest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products).
   
[Create EKS cluster :material-arrow-right:](eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](gke.md){.md-button}


## Next steps

Start by installing Percona Everest:

[Install Percona Everest :material-arrow-right:](installEverest.md){.md-button}
