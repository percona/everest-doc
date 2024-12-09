# Percona Everest quick install guide

Helm simplifies the installation of Percona Everest. With this guide, you'll be up and running with Percona Everest in no time.

We have a comprehensive [installation guide](install/install_everest_helm_charts.md) that covers all possibilities.

!!! info "Alternative installation option"
    If you prefer an alternative method, you can [install Percona Everest using the CLI](install/installEverest.md).

## Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Install [curl](https://everything.curl.dev/install/index.html){:target="_blank"}.

2. Install [yq](https://github.com/mikefarah/yq).

3. Set up a Kubernetes cluster.
     
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

To install Percona Everest using Helm follow these steps:
{.power-number}

1. Add the Percona Helm repository.

    ```sh
    helm repo add percona https://percona.github.io/percona-helm-charts/
    helm repo update
    ```

    Enter the specific names for the namespaces you want Percona Everest to manage, separating each name with a comma.

2. Install Percona Everest.

    ```sh
    helm install everest-core percona/everest \
    --namespace everest-system \
    --create-namespace
    ```
    Once Percona Everest is running successfully, you can create additional database namespaces. For detailed information, refer to the section [here](install/install_everest_helm_charts.md).

3. Retrieve the `admin` password.

    ```sh
    kubectl get secret everest-accounts -n everest-system -o jsonpath='{.data.users\.yaml}' | base64 --decode  | yq '.admin.passwordHash'
    ```

    !!! note
        The default admin password is stored in plain text. It is highly recommended to update the password using `everestctl` to ensure that the passwords are hashed.

    For information on user management, see the section [manage users in Percona Everest](administer/manage_users.md).

4. Access the Everest UI/API using one of the following options for exposing it, as Everest is not exposed with an external IP by default:

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
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "NodePort"}}
            ```

        2. The following command displays the port assigned by Kubernetes to the everest service, which is `32349` in this case.

            ```sh
            kubectl get svc/everest -n everest-system
            NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
            everest   NodePort   10.43.139.191   <none>        8080:32349/TCP   28m
            ```

        3. Retrieve the external IP addresses for the kubernetes cluster nodes.

            ```sh
            kubectl get nodes -o wide
            NAME                   STATUS   ROLES    AGE   VERSION             
            INTERNAL-IPEXTERNAL-IP  OS-IMAGE                        KERNEL-VERSION   
            CONTAINER-RUNTIME
            gke-everest-test-default-pool-8bbed860-65gx   Ready    <none>   3m35s   
            v1.30.3-gke.1969001   10.204.15.199   34.175.155.135   Container- 
            Optimized OS from Google   6.1.100+         containerd://1.7.19
            gke-everest-test-default-pool-8bbed860-pqzb   Ready    <none>   3m35s   
            v1.30.3-gke.1969001   10.204.15.200   34.175.120.50    Container- 
            Optimized OS from Google   6.1.100+         containerd://1.7.19
            gke-everest-test-default-pool-8bbed860-s0hg   Ready    <none>   3m35s   
            v1.30.3-gke.1969001   10.204.15.201   34.175.201.246   Container- 
            Optimized OS from Google   6.1.100+         containerd://1.7.19
            ```
        
        4. To launch the Percona Everest UI and create your first database cluster, go to the IP address/port found in steps 2 and 3. In this example, the external IP address used is [http://34.175.155.135:32349](http://34.175.155.135:32349). Nevertheless, you have the option to use any node IP specified in the above steps.

    === "Port Forwarding"
        Run the following command to use `Kubectl port-forwarding` for connecting to Everest without exposing the service:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

        Percona Everest will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). 


## Next steps

[Provision a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
