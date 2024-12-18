# Percona Everest quick install guide

This section provides instructions for quickly installing and getting started with Percona Everest.

## Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Install [curl](https://everything.curl.dev/install/index.html){:target="_blank"}.


2. Set up a Kubernetes cluster.
     
    !!! note alert alert-primary "Note"

        Percona Everest assists with installing all the necessary operators and required packages, but does not deploy a Kubernetes cluster.

       We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE).
   
      [Create EKS cluster :material-arrow-right:](eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](gke.md){.md-button}

3. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under `~/.kube/config`. 

     If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable:
    
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

## Install Percona Everest

You can download the latest version of Everest CLI by visiting the latest release page in [this repository](https://github.com/percona/everest/releases/latest).
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


2. Install Percona Everest:

    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Percona Everest to manage, separating each name with a comma.

    !!! warning "Important"
        Make sure that you enter at least one namespace.

3. Update the password for the `admin` user:

    ```sh
    everestctl accounts set-password --username admin
    ```

    !!! info "Important"

        You can retrieve the automatically generated password by running the `everestctl accounts initial-admin-password` command. However, this password isn't stored securely.


    For more information on user management, see the section [Manage users in Percona Everest](../administer/manage_users.md).

4. Access the Everest UI/API using one of the following options, as the `everest` Service is not exposed with an external IP by default:

    === "Load Balancer"

        1. Use the following command to change the Everest service type to `LoadBalancer`:
                    
            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "LoadBalancer"}}'
            ```
                    
        2. Retrieve the external IP address for the Everest service. This is the address where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is [http://34.175.201.246](http://34.175.201.246):
                
            ```sh 
            kubectl get svc/everest -n everest-system
            ```




    === "Node Port"       

        1. Run the following command to change the Everest service type to `NodePort`:

            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "NodePort"}}'
            ```

        2. The following command displays the port assigned by Kubernetes to the everest service, which is `32349` in this case.

            ```sh
            kubectl get svc/everest -n everest-system
            ```

            ??? example "Expected output"
            ```{.text .no-copy}
            NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
            everest   NodePort   10.43.139.191   <none>        8080:32349/TCP   28m
            ```

        3. Retrieve the external IP addresses for the kubernetes cluster nodes.

            ```sh
            kubectl get nodes -o wide
            ```

            ??? example "Expected output"
            ```{.text .no-copy}
            NAME                                          STATUS   ROLES    AGE   VERSION               INTERNAL-IP     EXTERNAL-IP      OS-IMAGE                             KERNEL-VERSION CONTAINER-RUNTIME
            gke-everest-test-default-pool-8bbed860-65gx   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.199   34.175.155.135   Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
            gke-everest-test-default-pool-8bbed860-pqzb   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.200   34.175.120.50    Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
            gke-everest-test-default-pool-8bbed860-s0hg   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.201   34.175.201.246   Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
            ```
        
        4. To launch the Percona Everest UI and create your first database cluster, go to the IP address/port found in steps 2 and 3. In this example, the external IP address used is [http://34.175.155.135:32349](http://34.175.155.135:32349). Nevertheless, you have the option to use any node IP specified in the above steps.

    === "Port Forwarding"
   
        The `kubectl port-forward` command in Kubernetes is used to create a temporary connection between your local machine and a specific Kubernetes resource (e.g., a Pod, Service, or Deployment) by forwarding traffic from a local port to a port on the resource. Run the following command to use `kubectl port-forwarding` for connecting to Everest service from your machine without exposing it outside of the K8s cluster:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

        Percona Everest will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). This method is mostly useful for testing purposes. 


## Next steps

[Provision a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
