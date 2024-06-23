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

2. Install Everest and provision the Kubernetes cluster using one of the following commands:


    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Everest to manage, separating each name with a comma.

    !!! warning "Important"
        - [These](../use/multi-namespaces.md#default-namespaces-in-percona-everest) namespaces are restricted and cannot be used for deploying databases.
        -  Make sure that you enter at least one namespace.

    ??? example "Expected output"
        ```
        ? Namespaces managed by Everest (comma separated) dev,production
        ? What operators do you want to install? MySQL, MongoDB, PostgreSQL        
        ```

    ??? example "Installing various operators in different namespaces"
        
        To install various operators in different namespaces, such as MySQL and MongoDB operator in namespaces dev and testing, and PostgreSQL operator in namespaces production and staging, run the following command:

        1.     ```sh
                everestctl install
                ```
            
            ??? example "Expected output"

            ```sh
            ? Namespaces managed by Everest [comma separated] dev,testing
            ? What operators do you want to install? MySQL, MongoDB
            ```
        2. Run the everestctl install command again to install the PostgreSQL operator again in namespaces production and staging.

            ??? example "Expected output"

            ```sh
            ? Namespaces managed by Everest [comma separated] production,testagingsting
            ? What operators do you want to install? PostgreSQL
            ```

    Alternatively, you can set multiple namepaces in the headless mode:

    ```sh
    everestctl install --namespaces <namespace-name1>,<namespace-name2> --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
    ```
    Replace `<namespace-name>` with the desired name for your namespace.

    ??? example "Example"
        ```
        everestctl install --namespaces dev,prod --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
        ```

    !!! warning "Important"
        Ensure to copy the authorization token displayed on the terminal in this step. You will need this token to log in to the Percona Everest UI.    

3. Access the Everest UI/API using one of the following options for exposing it, as Everest is not exposed with an external IP by default:

    === "Service Type Load Balancer"

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

    === "Port Forwarding"
        Run the following command to use `Kubectl port-forwarding` for connecting to Everest without exposing the service:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

4. To launch the Everest UI and create your first database cluster, go to the IP address configured for the Everest service in step 3. In the example above, this is [http://127.0.0.1:8080](http://127.0.0.1:8080).
