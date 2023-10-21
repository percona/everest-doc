# Install using Docker Compose (recommended)

## Prerequisites

Before getting started with Percona Everest, we recommend that you:
{.power-number}

1. Install [Docker Engine](https://docs.docker.com/engine/install){:target="_blank"} (1.13.0 and higher) with the [Docker Compose plugin](https://docs.docker.com/compose/install/){:target="_blank"}.
2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html){:target="_blank"} for EKS or the [gcloud CLI](https://cloud.google.com/sdk/docs/install){:target="_blank"} for GKE.
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

## Install and provision

To install and provision Percona Everest using Docker Compose:
{.power-number}

1. Download the Docker Compose file:
   
    ```
    curl https://raw.githubusercontent.com/percona/percona-everest-backend/release-0.3.0/deploy/quickstart-compose.yml -o quickstart-compose.yml
    ```

2. Initialize the Everest container and its internal PostgreSQL database by executing one of the following commands, each offering distinct access configurations:

    * to limit access to the localhost interface (default):
    
      ```sh
      docker compose -f quickstart-compose.yml up -d
      ```

    * to expose Everest though a specific interface, use that interface's IP address: 
    
      ```sh
      EVEREST_BIND_ADDR=<ip address>; docker compose -f quickstart-compose.yml up -d
      ```

    * to allow access from any interface on the host machine (not recommended):
    
      ```sh
      EVEREST_BIND_ADDR=0.0.0.0; docker compose -f quickstart-compose.yml up -d
      ```
  
3. (Optional) Verify if the services started correctly:

    ```sh 
    docker compose -f quickstart-compose.yml ps --services --filter 'status=running'
    ```

    ??? example "Expected output"
        
        ```
            everest
            pg
        ```
4. Retrieve the external IP address for the Everest service. This is the address used for provisioning the cluster, and from where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is the default 127.0.0.1:  
   
    ```sh 
    kubectl get svc/everest -n percona-everest
    ```
    
    ??? example "Expected output"
        ```
        NAME      TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
        everest   LoadBalancer   10.43.172.194   127.0.0.1       8080:31611/TCP   10s
        ```

5. Download the latest release of [everestctl](https://github.com/percona/percona-everest-cli/releases){:target="_blank"} to provision Percona Everest.

6. Rename the downloaded file using the following command and replacing the placeholder `everestctl-darwin-amd64` to match the file downloaded in the previous step: 

    ```sh
    mv everestctl-darwin-amd64 everestctl
    ```

7. Modify the file permissions: 

    ```sh
    chmod +x everestctl
    ```

8. From the installation wizard, provision and register the Kubernetes cluster in Everest using the following commands. Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, set the `KUBECONFIG` environment variable before running the command.  Additionally, ensure that the Everest URL/endpoint is configured to use the external IP value obtained in step 4:
  
  
    ```sh
    export KUBECONFIG=~/.kube/config
    ```

  
    ```sh
    ./everestctl install operators
    ```
    
    This will install all needed components in a namespace called `percona-everest`.

    ??? example "Example"
            
            ? Everest URL http://127.0.0.1:8080
            ? Choose your Kubernetes Cluster name k3d-dbaas-tilt
            ? Do you want to enable monitoring? Yes
            ? PMM URL Endpoint http://127.0.0.1
            ? Username admin
            ? Password *****
            ? Name for the new monitoring instance my-pmm
            ? Do you want to enable backups? No
            ? What operators do you want to install? MySQL, MongoDB, PostgreSQL
            

    Alternatively, you can provision and register the Kubernetes cluster by running the installation in headless mode:
        
    ```
    ./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --monitoring.enable=true --monitoring.type=pmm --monitoring.new-instance-name=my-pmm --monitoring.pmm.endpoint=http://127.0.0.1 --monitoring.pmm.username=admin --monitoring.pmm.password=admin  --skip-wizard
    ```

    ### Limitations
        
    * If the Everest CLI fails to install the operators, do the following:
        
        * [Uninstall Percona Everest](uninstallEverest.md).
        
        * Install Percona Everest, starting with the second step.

    * If you install an operator after the initial provisioning and want to create a database cluster, restart the `everest-operator pod` by running the following commands:

        ```sh 
        kubectl -n percona-everest get po
        kubectl -n percona-everest delete pod everest-operator-pod-name
        ```

        This will fix the database cluster creation. The issue will be fixed in the upcoming releases.

    * If you don't enable monitoring during this provisioning step then you won't be able to enable it from the UI later. Make sure to fill in the monitoring details in the wizard.

    * If you are using a PMM server instance with a self-signed certificate you cannot use HTTPS in the PMM URL endpoint.

9. Go the IP address configured for the Everest service at step 4 to launch the Everest UI and create your first database cluster. The default one used in this example is [http://127.0.0.1:8080](http://127.0.0.1:8080). 