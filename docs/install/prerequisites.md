# Prerequisites

Before getting started with OpenEverest, we recommend that you:
{.power-number}


1. Install [Helm v3  :octicons-link-external-16:](https://docs.helm.sh/using_helm/#installing-helm) to install OpenEverest using Helm.

2. Install [yq :octicons-link-external-16:](https://github.com/mikefarah/yq) to install OpenEverest using Helm.

3. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under *~/.kube/config*. Run the following command:

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


## Before you install OpenEverest

You can install OpenEverest using one of the following methods:


* [Helm charts](../install/install_everest_helm_charts.md)

* [everestctl](../install/install_everestctl.md), which connects OpenEverest to your Kubernetes cluster.


Once you’ve installed OpenEverest, you can easily log into the OpenEverest UI by following the setup instructions in the next section.

!!! important
    OpenEverest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a publicly accessible Kubernetes cluster.

We recommend setting up OpenEverest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE). OpenEverest may not work as expected on local Kubernetes installations (minikube, kind, k3d, or similar products) due to network issues.
   
[Create EKS cluster :material-arrow-right:](eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](gke.md){.md-button}


## Next steps

Start by installing OpenEverest:

[Install OpenEverest :material-arrow-right:](installEverest.md){.md-button}
