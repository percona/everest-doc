# Install Percona Everest using the Quick-Install script

## Procedure

As soon as you create a Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), you can install Percona Everest.

For more information, see the [Prerequisites](qs-prerequisites.md) section.
{.power-number}

## Before you start

Before running the commands in the **Installation** section, note that Everest will search for the **kubeconfig** file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable:
    
```sh
export KUBECONFIG=~/.kube/config
```

## Installation

You can download the latest version of Everest CLI by visiting the latest release page in this repository.
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
        - [These](../use/multi-namespaces.md#default-namespaces-in-percona-everest) namespaces are restricted and cannot be used for deploying databases.
        -  Make sure that you enter at least one namespace.
        -  Ensure to copy the authorization token displayed on the terminal in this step. You will need this token to log in to the Percona Everest UI.    


    ```sh
    everestctl install
    ```

    Enter the specific names for the namespaces you want Everest to manage, separating each name with a comma.

    ??? example "Expected output"
        ```
        ? Namespaces managed by Everest (comma separated) dev,production
        ? What operators do you want to install? MySQL, MongoDB, PostgreSQL        
        ```

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

4. The Percona Everest app will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). 

    Now, you can open your browser and create databases in Percona Everest.

    ![!image](../images/everest_site.png)

## Video tutorial

You can also learn about installing Percona Everest via the Quick-Install script by following the video tutorial below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vxhNon-el9Q?si=8toRQZ-Z1-prU9vC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
## Next steps

[Create a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
