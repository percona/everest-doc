# Install Percona Everest on Openshift

This section explains how to install Percona Everest using Openshift.


## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    [Google Container Registry (GCR) is scheduled to be deprecated](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"} and will officially shut down on **May 20, 2025**. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date.

**Action required**

We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible.

## Install Percona Everest

Here are the steps to install Percona Everest with OpenShift compatibility enabled:
{.power-number}

1. Run the following command:

    ```sh
    helm install everest-core percona/everest \
        --namespace everest-system \
        --create-namespace \
        --set compatibility.openshift=true \
        --set dbNamespace.compatibility.openshift=true \
        --set kube-state-metrics.securityContext.enabled=false \
        --set kube-state-metrics.rbac.create=false
    ```

2. (Optional) Update RBAC for kube-state-metrics:

    If you're running a chart version prior to 1.5.0, it's essential to manually create a `ClusterRoleBinding` for `kube-state-metrics` to ensure proper functionality. Use the following YAML:

    ```sh
    cat <<EOF | kubectl apply -f -
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRoleBinding
    metadata:
        name: ksm-openshift-cluster-role-binding
    roleRef:
        kind: "ClusterRole"
        apiGroup: "rbac.authorization.k8s.io"
        name: kube-state-metrics
    subjects:
        - kind: "ServiceAccount"
        name: kube-state-metrics
        namespace: everest-monitoring
    EOF
    ```

    !!! note 
        Starting from version 1.5.0 and onwards, a `ClusterRoleBinding` is created automatically when you enable the setting `compatibility.openshift=true`.


3. (Optional) Deploy additional database namespaces:

    If you need to add database namespaces, run the following command with OpenShift compatibility enabled:

    ```sh
    helm install everest \
        percona/everest-db-namespace \
        --create-namespace \
        --namespace everest \
        --set compatibility.openshift=true
    ```

    For detailed instructions, refer to the [installation section](install_everest_helm_charts.md) and adjust the installation parameters according to the values specified here.

4. Once the installation is complete, retrieve the `admin` password. 

    ```sh
    kubectl get secret everest-accounts -n everest-system -o jsonpath='{.data.users\.yaml}' | base64 --decode  | yq '.admin.passwordHash'
    ```

    The default username for logging into the Everest UI is `admin`. You can set a different default admin password by using the `server.initialAdminPassword` parameter during installation.

    The default `admin` password is stored in plain text. It is highly recommended to update the password using `everestctl` to ensure that the passwords are hashed.

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

        1. Run the following command to use `Kubectl port-forwarding` for connecting to Everest without exposing the service:
                
            ```sh
            kubectl port-forward svc/everest 8080:8080 -n everest-system
            ``` 

            To launch the Percona Everest UI and create your first database cluster, go to your localhost IP address [http://127.0.0.1:8080](http://127.0.0.1:8080).


        2. (**Recommended**) When **Transport Layer Security (TLS) is enabled**, run the following command to connect to Percona Everest:       
                    
            ```sh
            kubectl port-forward svc/everest 8443:443 -n everest-system
            ``` 

            Percona Everest will be available at [http://127.0.0.1:8443](http://127.0.0.1:8443).


            For comprehensive instructions on enabling TLS for Percona Everest, see the section [TLS setup with Percona Everest](../security/tls_setup.md#tls-setup-with-percona-everest).

## Next steps

[Provision a database :material-arrow-right:](use/db_provision.md){.md-button}