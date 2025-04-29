# Install Percona Everest using Helm

This section explains how to install Percona Everest using [Helm](https://helm.sh/){:target="_blank"} as an alternative to `everestctl`. Helm charts simplify the deployment process by packaging all necessary resources and configurations, making them ideal for automating and managing installations in Kubernetes environments.

Percona Helm charts can be found in [percona/percona-helm-charts]( https://github.com/percona/percona-helm-charts/tree/main/charts/everest){:target="_blank"} repository in Github.

!!! info "Important"
    If you installed Percona Everest using Helm, make sure to uninstall it exclusively through Helm for a seamless removal.

## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    [Google Container Registry (GCR) is scheduled to be deprecated](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"} and will officially shut down on **May 20, 2025**. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date.

**Action required**

We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible.

## Install Percona Everest and deploy database namespaces
Here are the steps to install Percona Everest and deploy additional database namespaces:
{.power-number}

1. Add the Percona Helm repository:

    ```sh
    helm repo add percona https://percona.github.io/percona-helm-charts/
    helm repo update
    ```

2. Install Percona Everest:

    ```sh
    helm install everest-core percona/everest \
    --namespace everest-system \
    --create-namespace
    ```

    ??? info "What's happening under the hood"
        The command does the following:
        {.power-number}

        1. Deploys the Percona Everest components in the `everest-system` namespace. Currently, specifying a different namespace for Percona Everest is not supported.

        2. Deploys a new namespace called `everest` for your databases and the database operators.

            You can override the name of the database namespace by using the `dbNamespace.namespaceOverride` parameter. If you prefer to deploy just the core components, set `dbNamespace.enabled=false`

    !!! note
        PMM can now be deployed as a sub-chart by setting `pmm.enabled=true`. PMM will be automatically deployed within the `everest-system` namespace.

        **Example**

        ```sh
        helm install everest-core percona/everest --namespace=everest-system --create-namespace --set pmm.enabled=true
        ```


3. Once the installation is complete, retrieve the `admin` password. 

    ```sh
    kubectl get secret everest-accounts -n everest-system -o jsonpath='{.data.users\.yaml}' | base64 --decode  | yq '.admin.passwordHash'
    ```

    The default username for logging into the Everest UI is `admin`. You can set a different default admin password by using the `server.initialAdminPassword` parameter during installation.

    The default `admin` password is stored in plain text. It is highly recommended to update the password using `everestctl` to ensure that the passwords are hashed. Instructions for installing `everestctl` can be found at [everestctl installation guide](https://docs.percona.com/everest/install/installEverestCLI.html#__tabbed_1_1).

    To access detailed information on user management, see the [manage users in Percona Everest](../administer/manage_users.md#update-the-password) section.

4. Access the Everest UI/API using one of the following options for exposing it, as Everest is not exposed with an external IP by default:

    === "Load Balancer"

        1. Use the following command to change the Everest service type to `LoadBalancer`:
                    
            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "LoadBalancer"}}'
            ```
                    
        2. Retrieve the external IP address for the Everest service. This is the address where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is [http://34.175.201.246](http://34.175.201.246).
                
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
        Run the following command to use `Kubectl port-forward` for connecting to Everest without exposing the service:
                
        ```sh
        kubectl port-forward svc/everest 8080:8080 -n everest-system
        ``` 

        To launch the Percona Everest UI and create your first database cluster, go to your localhost IP address [http://127.0.0.1:8080](http://127.0.0.1:8080).


        When [TLS is enabled](../security/tls_setup.md), run the following `kubectl port-forward` command to connect to Percona Everest:
                
        ```sh
        kubectl port-forward svc/everest 8443:443 -n everest-system
        ``` 

        To launch the Percona Everest UI and create your first database cluster, go to your localhost IP address [http://127.0.0.1:8443](http://127.0.0.1:8443).

5. Deploy additional database namespaces:

    Once Percona Everest is successfully running, you can create additional database namespaces using the `everest-db-namespace` Helm chart. 

    If you set `dbNamespaces.enabled=false` in **step 2**, you can deploy a database namespace with the following command:

    ```sh
    helm install everest \
    percona/everest-db-namespace \
    --create-namespace \
    --namespace <DB namespace>
    ```

    !!! note
        -  All database operators are installed in your database namespace by default. You can override this by specifying one or more of the following options: `[dbNamespace.pxc=false, dbNamespace.pg=false, dbNamespace.psmdb=false]`.
        - Installation without chart hooks (i.e, the use of `--no-hooks`) is currently not supported.

## Configure parameters

You can customize various parameters in the Percona Everest Helm charts for your deployment to meet your specific needs. Refer to the [Helm documentation](https://helm.sh/docs/chart_best_practices/values/){:target="_blank"} to discover how to configure these parameters.

A few parameters are listed in the following table. For a detailed list of the parameters, see the [README](https://github.com/percona/percona-helm-charts/blob/main/charts/everest/README.md#configuration){:target="_blank"}.


**percona/everest chart**

|**Key**|**Type**|**Default**|**Description**|
|------|---------|-----------|---------------|
|`server.initialAdminPassword`|string|""|Initial password configured for admin user.</br></br> If it is not set, a random password is generated. It is recommended to reset the admin password after installation.|
|`server.oidc`|object|{}|OIDC configuration for Everest.</br></br> These settings are applied only during installation. To modify the settings after installation, you have to manually update the everest-settings `ConfigMap`.|


**percona/everest-db-namespace subchart**

|**Key**|**Type**|**Default**|**Description**|
|-------|--------|-----------|---------------
|`pxc`|bool|true| Installs the Percona XtraDB Cluster operator if set.|
|everest-db-namespace|`postgresql`|bool|true| Installs the Percona Postgresql Server operator if set.|
|`psmdb`|bool|true| Installs the Percona Server MongoDB operator if set.|


## Next steps

[Provision a database :material-arrow-right:](use/db_provision.md){.md-button}