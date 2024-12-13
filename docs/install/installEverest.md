# Install Percona Everest using CLI

## Before you start

Before running the commands in the **Installation** section, note that Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable: 
    
```sh
export KUBECONFIG=~/.kube/config
```

## Install Percona Everest

!!! info "Important"
    Starting from version 1.4.0, `everestctl` now uses the [Helm chart](https://github.com/percona/percona-helm-charts/tree/main/charts/everest) to install Percona Everest. To configure chart parameters during installation through the CLI, you can:

    * Use the `--helm-set` flag to specify individual parameter values.
    * Provide a values file with the `--helm-values` flag for bulk configuration.

To install and provision Percona Everest to Kubernetes:
{.power-number}

1. Download the latest release of [everestctl](https://github.com/percona/everest/releases/latest){:target="_blank"} to provision Percona Everest. For detailed installation instructions, see [CLI installation documentation](../install/installEverestCLI).

2. Install Percona Everest using one of the following commands:


    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Percona Everest to manage, separating each name with a comma. [These](../use/multi-namespaces.md#default-namespaces-in-percona-everest) namespaces are restricted and cannot be used for deploying databases. Make sure that you enter **at least** one namespace.

    **Alternative command**

    You can set multiple namepaces in the headless mode:

    ```sh
    everestctl install --namespaces <namespace-name1>,<namespace-name2> --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
    ```
    Replace `<namespace-name>` with the desired name for your namespace.

    ??? example "Example"
        ```
        everestctl install --namespaces dev,prod --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
        ```

    To gain a deeper understanding of how to install different operators in various namespaces, refer to the [configure multiple namespaces](../use/multi-namespaces.md#configure-multiple-namespaces) section.


3. Update the password for the `admin` user:

    ```sh
    everestctl accounts set-password --username admin
    ```

    !!! info "Important"

        - You can retrieve the automatically generated password by running the `everestctl accounts initial-admin-password` command. However, this password isn't stored securely.

    To access detailed information about user management, see the [Manage users in Percona Everest](../administer/manage_users.md) section.


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
                    
            ??? example "Expected output"
                ```
                NAME      TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
                everest   LoadBalancer   10.43.172.194   34.175.201.246       8080:8080/TCP    10s
                ```


    === "Node Port"
        A NodePort is a service that makes a specific port accessible on all nodes within the cluster. It enables external traffic to reach services running within the Kubernetes cluster by assigning a static port to each node's IP address.

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

        To launch the Percona Everest UI and create your first database cluster, go to your localhost IP address [http://127.0.0.1:8080](http://127.0.0.1:8080).
