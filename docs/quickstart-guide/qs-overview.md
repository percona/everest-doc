# Quick install

This section provides instructions for quickly installing and getting started with Percona Everest.

## Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Install [curl](https://everything.curl.dev/get){:target="_blank"}.


2. Set up a Kubernetes cluster.
     
    !!! note alert alert-primary "Note"

          Percona Everest assists with installing all the necessary operators and required packages, but does not deploy a Kubernetes cluster.

       We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE).


???+ note "Create Kubernetes cluster on Google Kubernetes Engine (GKE)"

          ## Prerequisites

             All commands from this guide can be run either in the **Google Cloud shell** or in **your local shell**.

             To use *Google Cloud shell*, you need nothing but a modern web browser.

             If you would like to use *your local shell*, install the following:
             {.power-number}

          1. [gcloud](https://cloud.google.com/sdk/docs/quickstarts){:target="_blank"}. This tool is
             part of the Google Cloud SDK. To install it, select your operating
             system on the [official Google Cloud SDK documentation page](https://cloud.google.com/sdk/docs){:target="_blank"}
             and then follow the instructions.

          2. [kubectl](https://cloud.google.com/kubernetes-engine/docs/quickstart#choosing_a_shell){:target="_blank"}.
             It is the Kubernetes command-line tool you will use to manage and deploy
             applications. To install the tool, run the following command:

               ``` {.bash data-prompt="$" }
               $ gcloud auth login
               $ gcloud components install kubectl
               ```

          ## Create and configure the GKE cluster

               !!! caution alert alert-warning "Important"
                    To run a 3-node pxc cluster, you will need at least a 3-node cluster with 2vCPUs available. The database will not be created if you attempt to create a database cluster in a Kubernetes cluster without sufficient resources.

               You can configure the settings using the `gcloud` tool. You can run it either in
               the [Cloud Shell](https://cloud.google.com/shell/docs/quickstart){:target="_blank"} or in your
               local shell (if you have installed Google Cloud SDK locally on the previous
               step). The following command will create a cluster named `my-cluster-name`:

                    ``` {.bash data-prompt="$" }
                    $ gcloud container clusters create my-cluster-name --project <project name> --zone us-central1-a --cluster-version 1.25 --machine-type n1-standard-4 --num-nodes=3
                    ```

               !!! note

               You must edit the previous command and other command-line statements to
               replace the `<project name>` placeholder with your project name. You may
               also be required to edit the *zone location*, which is set to `us-central1`
               in the above example. Other parameters specify that we are creating a
               cluster with 3 nodes and with machine type of 4 vCPUs.

               You may wait a few minutes for the cluster to be generated.

               ???+ note "When the process is over, you can see it listed in the Google Cloud console"

               Select *Kubernetes Engine* → *Clusters* in the left menu panel:

               ![image](../images/gke-quickstart-cluster-connect.svg)

               Now you should configure the command-line access to your newly created cluster
               to make `kubectl` be able to use it.

               In the Google Cloud Console, select your cluster and then click the *Connect*
               shown on the above image. You will see the connect statement which configures
               the command-line access. After you have edited the statement, you may run the
               command in your local shell:

                    ``` {.bash data-prompt="$" }
                    $ gcloud container clusters get-credentials my-cluster-name --zone us-central1-a --project <project name>
                    ```

               Finally, use your [Cloud Identity and Access Management (Cloud IAM)](https://cloud.google.com/iam){:target="_blank"}
               to control access to the cluster. The following command will give you the
               ability to create Roles and RoleBindings:

                    ```sh
                    kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value core/account)
                    ```

                    ??? example "Expected output"

               ``` {.text .no-copy}
               clusterrolebinding.rbac.authorization.k8s.io/cluster-admin-binding created
               ```

## Remove the GKE cluster

You can clean up the cluster with the `gcloud` command as follows:

```{.bash data-prompt="$" }
$ gcloud container clusters delete <cluster name>
```

The return statement requests your confirmation of the deletion. Type `y` to confirm.

??? note "Also, you can delete your cluster via the Google Cloud console"

    Just click the `Delete` popup menu item in the clusters list:

    ![image](../images/gke-quickstart-cluster-connect.svg)

The cluster deletion may take time.

!!! warning

    After deleting the cluster, all data stored in it will be lost!

      [Create EKS cluster :material-arrow-right:](eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](gke.md){.md-button}

3. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under `~/.kube/config`. Everest will search for the **kubeconfig** file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable:
    
     ```sh
     export KUBECONFIG=~/.kube/config
     ```

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

## Procedure

You can download the latest version of Everest CLI by visiting the latest release page in [this repository](https://github.com/percona/percona-everest-cli/releases/latest).
{.power-number}

1. Download and install Everest CLI.

    === "Linux and WSL"
                        
        ```sh
        curl -sSL -o everestctl-linux-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-linux-amd64
        sudo install -m 555 everestctl-linux-amd64 /usr/local/bin/everestctl
        rm everestctl-linux-amd64       
        ``` 

    === "macOS (Apple Silicon)"
                        
        ```sh
        curl -sSL -o everestctl-darwin-arm64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-arm64
        sudo install -m 555 everestctl-darwin-arm64 /usr/local/bin/everestctl
        rm everestctl-darwin-arm64      
        ```


    === "macOS (Intel CPU)"
                        
        ```sh
        curl -sSL -o everestctl-darwin-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-amd64
        sudo install -m 555 everestctl-darwin-amd64 /usr/local/bin/everestctl
        rm everestctl-darwin-amd64        
        ``` 


2. Install Everest and provision the Kubernetes cluster:

    !!! warning "Important"
        -  Make sure that you enter at least one namespace.
        -  Ensure to copy the authorization token displayed on the terminal in this step. You will need this token to log in to the Percona Everest UI.    


    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Everest to manage, separating each name with a comma.

3. Access the Everest UI/API using one of the following options for exposing it, as Everest is not exposed with an external IP by default:

    === "Port Forwarding"
        Run the following command to use `Kubectl port-forwarding` for connecting to Everest without exposing the service:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

    === "Service Type Load Balancer"

        * Use the following command to change the Everest service type to `LoadBalancer`:
                    
            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "LoadBalancer"}}'
            ```
                    
        * Retrieve the external IP address for the Everest service. This is the address where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is the default `127.0.0.1`:  
                
            ```sh 
            kubectl get svc/everest -n everest-system
            ```

    Percona Everest will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). 


## Video tutorial

You can also learn about installing Percona Everest via the Quick-Install script by following the video tutorial below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vxhNon-el9Q?si=8toRQZ-Z1-prU9vC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
## Next steps

[Create a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
