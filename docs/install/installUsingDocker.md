# Install using Docker Compose (recommended)


To install and provision Percona Everest using Docker Compose:
{.power-number}

1. Download the Docker Compose file:
   
    ```
    curl https://raw.githubusercontent.com/percona/percona-everest-backend/release-0.4.0/deploy/quickstart-compose.yml -o quickstart-compose.yml
    ```

2. Create the `percona-everest` namespace:

    ```sh
    kubectl create namespace percona-everest
    ```
3. Create a Kubernetes secret with an auto-generated root key used for encrypting secrets:
   
    ```sh
    ENCODED_SECRETS_ROOT_KEY=$(openssl rand -base64 32 | tr -d '\n' | base64 | tr -d '\n'); cat <<EOF | sed "s/\$ENCODED_SECRETS_ROOT_KEY/$ENCODED_SECRETS_ROOT_KEY/" | kubectl apply -n percona-everest -f -
    apiVersion: v1
    kind: Secret
    metadata:
        name: everest-secrets-root-key
    data:
        secrets-root-key: $ENCODED_SECRETS_ROOT_KEY
    EOF
    ```
    
    ??? example "Expected output"
    
        ```{.text .no-copy}
        secret/everest-secrets-root-key configured
        ```


4. Deploy Everest to Kubernetes:

    ```sh
    kubectl apply -f https://raw.githubusercontent.com/percona/percona-everest-backend/v0.4.0/deploy/quickstart-k8s.yaml -n percona-everest
    ```

5. Initialize the Everest container and its internal PostgreSQL database by executing one of the following commands, each offering distinct access configurations:

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
  
6. (Optional) Verify if the services started correctly:

    ```sh 
    docker compose -f quickstart-compose.yml ps --services --filter 'status=running'
    ```

    ??? example "Expected output"
        
        ```
            everest
            pg
        ```
        
7. Retrieve the external IP address for the Everest service. This is the address used for provisioning the cluster, and from where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is the default 127.0.0.1:  
   
    ```sh 
    kubectl get svc/everest -n percona-everest
    ```
    
    ??? example "Expected output"
        ```
        NAME      TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
        everest   LoadBalancer   10.43.172.194   127.0.0.1       8080:31611/TCP   10s
        ```

8. Download the latest release of [everestctl](https://github.com/percona/percona-everest-cli/releases){:target="_blank"} to provision Percona Everest.

9. Rename the downloaded file using the following command and replacing the placeholder `everestctl-darwin-amd64` to match the file downloaded in the previous step: 

    ```sh
    mv everestctl-darwin-amd64 everestctl
    ```

10. Modify the file permissions: 

    ```sh
    chmod +x everestctl
    ```

11. From the installation wizard, provision and register the Kubernetes cluster in Everest using the following commands. Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, set the `KUBECONFIG` environment variable before running the command.  Additionally, ensure that the Everest URL/endpoint is configured to use the external IP value obtained in step 4:
  
  
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

    * If you don't enable monitoring during this provisioning step then you won't be able to enable it from the UI later. Make sure to fill in the monitoring details in the wizard, ensuring that the name of the monitoring instance does not exceed 22 characters, starts and ends with an alphanumeric character and only uses alphanumeric characters or '-'.

    * If you are using a PMM server instance with a self-signed certificate you cannot use HTTPS in the PMM URL endpoint.

12. Go the IP address configured for the Everest service at step 4 to launch the Everest UI and create your first database cluster. The default one used in this example is [http://127.0.0.1:8080](http://127.0.0.1:8080). 