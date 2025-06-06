# Percona Everest quick install guide

Helm simplifies the installation of Percona Everest. With this guide, you'll be up and running with Percona Everest in no time. However, we also have a comprehensive [installation guide](install/install_everest_helm_charts.md) that covers all possibilities.

Percona Helm charts can be found in [percona/percona-helm-charts]( https://github.com/percona/percona-helm-charts/tree/main/charts/everest){:target="_blank"} repository in Github.

!!! info "Alternative installation method"
    If you prefer an alternative method, you can [install Percona Everest using everestctl](install/installEverest.md).

## Prerequisites

Before getting started with Percona Everest, do the following:
{.power-number}

1. Install [Helm v3  :octicons-link-external-16:](https://docs.helm.sh/using_helm/#installing-helm){:target="_blank"}.

4. Install [yq :octicons-link-external-16:](https://github.com/mikefarah/yq){:target="_blank"}.

4. Set up a Kubernetes cluster.
     
    !!! note alert alert-primary "Note"

        Percona Everest assists with installing all the necessary operators and required packages, but does not deploy a Kubernetes cluster.

       We recommend setting up Percona Everest on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE).
         
      [Create EKS cluster :material-arrow-right:](install/eks.md){.md-button}  [Create GKE cluster :material-arrow-right:](install/gke.md){.md-button}

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

2. Install Percona Everest.


    ```sh
    helm install everest-core percona/everest \
    --namespace everest-system \
    --create-namespace
    ```


    ??? info " 🌐 Install Percona Everest and access it using Ingress"

        **Prerequisite**

        - An Ingress controller (e.g., Nginx) installed on your Kubernetes cluster

        - If TLS is required on your Ingress endpoint, a **Secret** containing the TLS certificates

        **Example**

        To install Percona Everest and access using [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/#what-is-ingress){:target="_blank"}, here are the steps:
        {.power-number}


        1. Install Percona Everest:

            ```sh
            helm --install everest percona/everest \
              -n everest-system \
              --set ingress.enabled=true \
              --set ingress.ingressClassName="" \
              --set ingress.hosts[0].host=everest.example.com \
              --set ingress.hosts[0].paths[0].path=/ \
              --set  ingress.hosts[0].paths[0].pathType=ImplementationSpecific
            ```
            Replace `everest.example.com` with your own domain.
             
        3. Verify Ingress:

            ```sh
            kubectl get ingress -n everest-system
            ```

            Make sure the address provided is valid and that it correctly routes to the Percona Everest service.

        ??? example "Example: Custom YAML configuration file"


            ```sh
            ingress:
            # -- Enable ingress for Everest server
            enabled: true
            # -- Ingress class name. This is used to specify which ingress controller should handle this ingress.
            ingressClassName: "nginx"
            # -- Additional annotations for the ingress resource.
            annotations: {}
            # -- List of hosts and their paths for the ingress resource.
            hosts:
                - host: everest.example.com
                  paths:
                    - path: /
                      pathType: ImplementationSpecific
            # -- TLS configuration for the ingress resource.
            # -- Each entry in the list specifies a TLS certificate and the hosts it applies to.
            tls: []
            #  - secretName: everest-tls
            #    hosts:
            #      - everest.example.com
            ```
            Install Percona Everest using this file:

            ```sh
            helm --install everest percona/everest \
            -n everest-system \
            -f everest-values.yaml
            ```

    ??? info "🔒 Install Percona Everest with TLS enabled"

        Install Percona Everest with TLS enabled:

        ```sh
        helm install everest-core percona/everest \
        --namespace everest-system \
        --create-namespace
        --set server.tls.enabled=true
        ```


        For comprehensive instructions on enabling TLS for Percona Everest, see the section [TLS setup with Percona Everest](../security/tls_setup.md#tls-setup-with-percona-everest).

    Once Percona Everest is running successfully, you can create additional database namespaces. For detailed information, refer to the section on [namespace management](administer/manage_namespaces.md).

    !!! note
        - If `dbNamespace.namespaceOverride` is set, the specified namespace will be provisioned instead of the default `everest` namespace.
        - If `dbNamespace.enabled=false` is set, no namespaces will be provisioned. You can provision namespaces later with the `everestctl namespaces add <NAMESPACE>` command.
        - If you installed Percona Everest using `helm` and need to uninstall it, make sure to uninstall it exclusively through `helm` for seamless removal.

## Post-installation steps

Once you have successfully installed Percona Everest, proceed with the following steps:
{.power-number}

1. Retrieve the `admin` password.

    ```sh
    kubectl get secret everest-accounts -n everest-system -o jsonpath='{.data.users\.yaml}' | base64 --decode  | yq '.admin.passwordHash'
    ```

    !!! note
        The default admin password is stored in plain text. It is highly recommended to update the password using `everestctl` to ensure that the passwords are hashed.

    For information on user management, see the section [manage users in Percona Everest](administer/manage_users.md).

2.  Access the Everest UI/API using one of the following options, as the `everest` Service is not exposed with an external IP by default:

    === "Load Balancer"

        1. Use the following command to change the Everest service type to `LoadBalancer`:
                                                
            ```sh
            helm install percona-everest percona/everest \
            --set service.type=LoadBalancer
            ```
            
            ??? example "When TLS is enabled"

                ```sh
                NAME      TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
                everest   LoadBalancer   10.43.172.194   34.175.201.246       443:8080/TCP    10s
                ```
                    
        2. Retrieve the external IP address for the Everest service. This is the address where you can then launch Everest at the end of the installation procedure. In this example, the external IP address used is [http://34.175.201.246](http://34.175.201.246).
                
            ```sh 
            kubectl get svc/everest -n everest-system
            ```
    === "Ingress"

        To access Percona Everest, open your browser and go to: [https://everest.example.com](https://everest.example.com).

        !!! note
            Replace `everest.example.com` with your own domain.


    === "Node Port"       

        1. Run the following command to change the Everest service type to `NodePort`:

            ```sh
            kubectl patch svc/everest -n everest-system -p '{"spec": {"type": "NodePort"}}'
            ```

        2. The following command displays the port assigned by Kubernetes to the everest service, which is `32349` in this case.

            ```sh
            kubectl get svc/everest -n everest-system
            NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
            everest   NodePort   10.43.139.191   <none>        8080:32349/TCP   28m
            ```

            ??? example "When TLS is enabled"
                ```sh
                kubectl get svc/everest -n everest-system
                NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
                everest   NodePort   10.43.139.191   <none>        443:32349/TCP   28m
                ```

        3. Retrieve the external IP addresses for the kubernetes cluster nodes.

            ??? example "Expected output"
                ```{.text .no-copy}
                NAME                                          STATUS   ROLES    AGE   VERSION               INTERNAL-IP     EXTERNAL-IP      OS-IMAGE                             KERNEL-VERSION CONTAINER-RUNTIME
                gke-everest-test-default-pool-8bbed860-65gx   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.199   34.175.155.135   Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
                gke-everest-test-default-pool-8bbed860-pqzb   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.200   34.175.120.50    Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
                gke-everest-test-default-pool-8bbed860-s0hg   Ready    <none>   3m35s v1.30.3-gke.1969001   10.204.15.201   34.175.201.246   Container-Optimized OS from Google   6.1.100+       containerd://1.7.19
                ```
        
        4. To launch the Percona Everest UI and create your first database cluster, go to the IP address/port found in steps 2 and 3. In this example, the external IP address used is [http://34.175.155.135:32349](http://34.175.155.135:32349). Nevertheless, you have the option to use any node IP specified in the above steps.

    === "Port forwarding"
        The `kubectl port-forward` command in Kubernetes is used to create a temporary connection between your local machine and a specific Kubernetes resource (e.g., a Pod, Service, or Deployment) by forwarding traffic from a local port to a port on the resource. 
        
        1. Run the following command to setup a port-forward to the Percona Everest server service:

                
            ```sh
            kubectl port-forward svc/everest 8080:8080 -n everest-system
            ``` 

            Percona Everest will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). This method is mostly useful for testing purposes. 

            ??? example "When TLS is enabled"

                ```sh
                kubectl port-forward svc/everest 8443:443 -n everest-system
                ```

                Percona Everest will be available at [https://127.0.0.1:8443](https://127.0.0.1:8443).

## Next steps

[Provision a database :material-arrow-right:](use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
