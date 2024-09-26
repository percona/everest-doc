# Install Everest

## Before you start

Before running the commands in the **Installation** section, note that Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable: 
    
```sh
export KUBECONFIG=~/.kube/config
```

## Installation

To install and provision Percona Everest to Kubernetes:
{.power-number}

1. Download the latest release of [everestctl](https://github.com/percona/everest/releases/latest){:target="_blank"} to provision Percona Everest. For detailed installation instructions, see [CLI installation documentation](../install/installEverestCLI).

2. Install Percona Everest using one of the following commands:


    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Percona Everest to manage, separating each name with a comma. [These](../use/multi-namespaces.md#default-namespaces-in-percona-everest) namespaces are restricted and cannot be used for deploying databases. Make sure that you enter **at least** one namespace.


    Alternatively, you can set multiple namepaces in the headless mode:

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

        * Use the following command to change the Everest service type to `LoadBalancer`:
                    
            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "LoadBalancer"}}'
            ```
                    
        * Retrieve the external IP address for the Everest service. This is the address where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is the default `127.0.0.1`:  
                
            ```sh 
            kubectl get svc/everest -n everest-system
            ```
                    
            ??? example "Expected output"
                ```
                NAME      TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
                everest   LoadBalancer   10.43.172.194   127.0.0.1       8080:8080/TCP    10s
                ```


    === "Node Port"
        A NodePort is a service that makes a specific port accessible on all nodes within the cluster. It enables external traffic to reach services running within the Kubernetes cluster by assigning a static port to each node's IP address.

        1. Run the following command to change the Everest service type to `NodePort`

            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "NodePort"}}
            ```

        2. Assign the external port to the Percona Everest service, which is `32349` in this case.

            ```sh
            kubectl get svc/everest -n everest-system
NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
everest   NodePort   10.43.139.191   <none>        8080:32349/TCP   28m
            ```


    === "Port Forwarding"
        Run the following command to use `Kubectl port-forwarding` for connecting to Everest without exposing the service:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

5. To launch the Everest UI and create your first database cluster, go to the IP address configured for the Everest service in step 4. In the example above, this is [http://127.0.0.1:8080](http://127.0.0.1:8080).
