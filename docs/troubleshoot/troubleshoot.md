# Percona Everest: Troubleshooting and diagnostics

This page is your go-to resource for tackling common issues and finding solutions. 

For limitations, see the [known limitations](../reference/known_limitations.md) section.


## General troubleshooting guidelines

Before troubleshooting, it's important to understand how Percona Everest works at a high level. Understanding how it works can help narrow down potential areas to investigate. You can refer to the [Kubernetes concepts guide](https://kubernetes.io/docs/concepts/)
 for background. This context will help you interpret Everest’s behavior when debugging.

- Refer to the [kubectl quick reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/){:target="_blank"} for commonly used commands to inspect and troubleshoot Kubernetes resources when working with Percona Everest.

- Use logs and events for debugging.


### Key logs and commands

You can review different logs for additional information depending on the specific issue.
{.power-number}

1. **Everest Core Components**

    | Logs        | Command                                                     |
    | ---------------- | ----------------------------------------------------------- |
    | Percona Everest operator| `kubectl logs -f deploy/everest-operator -n everest-system` |
    | Percona Everest server | `kubectl logs -f deploy/everest-server -n everest-system`   |

2. **Database Operators (in Namespaces)**

    | Operator type | Namespace | Command                                                             |
    | ------------- | --------- | ------------------------------------------------------------------- |
    | PostgreSQL    | `everest` | `kubectl logs -f deploy/percona-postgresql-operator -n everest`     |
    | MongoDB       | `everest` | `kubectl logs -f deploy/percona-server-mongodb-operator -n everest` |
    | PXC           | `everest` | `kubectl logs -f deploy/percona-xtradb-cluster-operator -n everest` |

    !!! note
        Update the namespace (`-n <namespace>`) in your commands if your database clusters are deployed in a namespace other than the default one.

3. **Monitoring**

    | Component                | Command                                                                   |
    | ------------------------ | ------------------------------------------------------------------------- |
    | VictoriaMetrics Operator | `kubectl logs -f deploy/vm-operator -n everest-monitoring`                |
    | VM Agent                 | `kubectl logs -f deploy/vmagent-everest-monitoring -n everest-monitoring` |


4. **Database and Proxy Pods**

    ```sh
    kubectl logs -f <pod-name of database or proxy> -c <database-container>
    ```

5. **Kubernetes Events**

    !!! info "Important"
        Events (Events are stored only for 60 mins; if there are any events older than 60 minutes, they will be lost).

    ```sh
    kubectl get events --sort-by=".lastTimestamp"
    ```

## Troubleshooting key areas

### Percona Everest and Bitnami Container Catalog changes

!!! warning "ACTION REQUIRED: Bitnami Container Catalog changes impact"
    Bitnami is restructuring its container catalog on September 29, 2025. To avoid potential failures in Percona Everest operations, follow the steps given below.

#### What’s changing with Bitnami?

Bitnami is [restructuring its container catalog](https://github.com/bitnami/containers/issues/83267). Starting **September 29, 2025**, most images (including bitnami) will move to a legacy repository.

Percona Everest is affected because it depends on the `bitnami/kubectl` image for several critical tasks:


- The `everest-operators-installer` job during installation and namespace provisioning

- Cleanup jobs like `pre-delete`, `csv-cleanup`, and `psp-cleanup` during uninstallation

If no action is taken, install, update, or uninstall operations will fail after **September 29, 2025**.

#### Mandatory fix

The `everestctl` CLI caches previous chart versions, which can lead to issues even after upgrading Percona Everest. By clearing the cache and upgrading your charts if necessary, you ensure that all future operations are safe.

Please execute the following commands based on the operating system you are using:

Execute the following commands according to your operating system.

=== ":fontawesome-brands-linux: Linux"
    ```sh
    rm -rf "$XDG_CACHE_HOME/everestctl"

    # Or if $XDG_CACHE_HOME is not set:

    rm -rf "$HOME/.cache/everestctl"
    ```

=== " macOS"
    ```sh
    rm -rf "$HOME/Library/Caches/everestctl"
    ```

=== ":material-microsoft-windows: Windows (in PowerShell)"
    ```sh
    Remove-Item "$env:LocalAppData/everestctl" -Recurse -Force
    ```

=== "Plan 9"
    ```sh
    rm -r "$home/lib/cache/everestctl"
    ```

#### If you’re on Percona Everest v1.8.1 or earlier

You must **manually update your Helm charts** to use the new image. If you are on v1.9.0 or later, you **can skip these steps**.
{.power-number}


1. List all installed Percona Everest charts. Find all Helm releases for both the `everest` and `everest-db-namespace` charts. 

    !!! note 
        Make sure that you note the release name, namespace, and app version for each one.

    ```sh
    helm list --all-namespaces | grep everest
    a1          a1              1  2025-09-18         
    16:46:31.130925768 +0100 WEST   deployed        everest-db- 
     namespace-1.8.1      1.8.1
    everest        everest          1  2025-09-18 16:45:15.362666552 
    +0100 WEST   deployed        everest-db-namespace-1.8.1      1.8.1
    everest-system everest-system   1  2025-09-18 16:44:45.138480161 
    +0100 WEST   deployed        everest-1.8.1                   1.8.1
    ```

2. Upgrade the main Percona Everest chart (e.g., `everest-system`) using its specific details:

    ```sh
    helm upgrade everest-system percona/everest \
    --reuse-values \
    --namespace everest-system \
    --version 1.8.1
    Release "everest-system" has been upgraded. Happy Helming!
    NAME: everest-system
    LAST DEPLOYED: Thu Sep 18 16:52:18 2025
    NAMESPACE: everest-system
    STATUS: deployed
    REVISION: 2
    TEST SUITE: None
    NOTES: Everest has been successfully upgraded to version 1.8.1!
    ```

3. Upgrade the database namespace charts. Execute the helm upgrade command for each `everest-db-namespace `chart identified in **step 1**.

    ```sh
    helm upgrade a1 percona/everest-db-namespace \
    --reuse-values \
    --namespace a1 \
    --version 1.8.1
    Release "a1" has been upgraded. Happy Helming!
    NAME: a1
    LAST DEPLOYED: Thu Sep 18 16:52:45 2025
    NAMESPACE: a1
    STATUS: deployed
    REVISION: 2
    TEST SUITE: None
    ```

    ```sh
    helm upgrade everest percona/everest-db-namespace \
    --reuse-values \
    --namespace everest \
    --version 1.8.1
    Release "everest" has been upgraded. Happy Helming!
    NAME: everest
    LAST DEPLOYED: Thu Sep 18 16:53:02 2025
    NAMESPACE: everest
    STATUS: deployed
    REVISION: 2
    TEST SUITE: None
    ```
4. Restart Everest Operator.

    ```sh
    kubectl -n everest-system rollout restart deploy/everest-operator
    ```

#### Troubleshooting after Sept 29, 2025

##### Scenario 1: Installation or namespace provisioning stuck

If your `everestctl` install, `everestctl namespaces add`, or `everestctl namespaces update` command is stalled, showing a status like this:

    ```sh
    ℹ️ Installing Everest version 1.8.1

    ✅ Installing Everest Helm chart
    ✅ Ensuring Everest API deployment is ready
    ✅ Ensuring Everest operator deployment is ready
    ✅ Ensuring OLM components are ready
    ✅ Ensuring monitoring stack is ready
    ∙∙● Provisioning database namespace 'everest'

    Esc/Ctrl+c quit
    ```
    
Follow these steps to fix the problem:
{.power-number}

1. Open a new terminal and leave the stalled process running.

2. Verify the stuck Helm release. 

    Confirm the `everest-db-namespace` chart is in a **pending-install** state. 
    
    !!! note 
        Make sure to note the release name and namespace from the output. In this example, it’s `everest` in the `everest namespace`.

        ```sh
        helm list --all-namespaces --pending
        NAME       NAMESPACE      REVISION            UPDATED                                STATUS          CHART                           APP VERSION
        everest    everest        1          2025-09-18 16:12:36.237739864 +0100 WEST   pending-install everest-db-namespace-1.8.1      1.8.1
        ```

3. Confirm the cause. 

    Check the **pod status** to ensure the problem is an `ImagePullBackOff` for the `bitnami/kubectl:latest` image.

    ```sh
    kubectl get pod -l job-name=everest-operators-installer --all-namespaces -o custom-columns='NAME:.metadata.name,NAMESPACE:.metadata.namespace,IMAGE:.spec.containers[0].image,WAITING_REASON:.status.containerStatuses[0].state.waiting.reason'
    NAME       NAMESPACE  IMAGE              WAITING_REASON
    everest-operators-installer-rllfg everest    bitnami/kubectl:latest      ImagePullBackOff
    ```

4. Delete the stuck job.

      ```sh
      kubectl delete job everest-operators-installer -n everest
      job.batch "everest-operators-installer" deleted from everest namespace
      ```

5. Check that the installation continues. 

    The original `everestctl` command should now proceed. 
    
    !!! note
        Make sure to note the **APP VERSION** of your Helm release, as you will need it in the next step.

    ```sh
    helm list -n everest
    NAME  NAMESPACE   REVISION UPDATED                                  
    STATUS          CHART                           APP VERSION
    everest    everest        1          2025-09-18 16:12:36.237739864 
    +0100 WEST   deployed        everest-db-namespace-1.8.1      1.8.1
    ```

6. Upgrade the Helm release. Use the release name, namespace, and **APP VERSION** from the previous steps to upgrade the chart.

    ```sh
    helm upgrade everest percona/everest-db-namespace \
    --reuse-values \
    --namespace everest \
    --version 1.8.1
    Release "everest" has been upgraded. Happy Helming!
    NAME: everest
    LAST DEPLOYED: Thu Sep 18 16:18:50 2025
    NAMESPACE: everest
    STATUS: deployed
    REVISION: 2
    TEST SUITE: None
    ```

7. Restart Everest Operator.

    ```sh
    kubectl -n everest-system rollout restart deploy/everest-operator
    ```

8. Your immediate issue is now resolved. Make sure to complete the steps in the [Mandatory Fix](../troubleshoot/troubleshoot.md#mandatory-fix) section if you haven’t already, to avoid this problem in the future.







        



























### Installation issues

For troubleshooting Percona Everest installation issues using **everestctl** or the **Helm chart**, the following steps may be helpful:
{.power-number}

1. **Permissions and privileges**

    Installing database operators and their dependencies may require appropriate privileges. 

     - Percona Everest installation may require `cluster-admin` privileges for:
        - **Operator Lifecycle Manager (OLM)**
        - **CustomResourceDefinitions (CRDs)**

    If you encounter failures during installation, ensure your user account has the appropriate permissions. 

    !!! note
	    Application teams frequently encounter problems when installing operators due to **insufficient privileges**.

    Run the following command to check if the required privileges are granted:

    ```sh
    kubectl auth can-i <verb> <resource> --namespace <namespace>
    ```

    To verify if you can create CRDs, run the following command:

    ```
    kubectl auth can-i create crd
    ```

    Ensure that your cluster administrator grants the required privileges before you **retry** the installation.


2. **Helm Chart validation**

    - Verify the installation status of the Helm chart. A properly functioning chart should be in a **Deployed** status. 

        To verify the values used during the chart installation, run the following command:

        ```sh
        helm list -n everest-system
        NAME            NAMESPACE         REVISION    UPDATED                                 STATUS      CHART            APP VERSION
        everest-core    everest-system    1           2025-01-16 16:24:56.577713 +0530 IST    deployed    everest-1.4.0    1.4.0
        ```

    - The Percona Everest installation has many components, so it will fail if any **subcomponent installations fail**. Check the relevant namespace where components are installed, along with the logs and events.

3. **Resource availability**

    When a job is created to approve the installation plan for operators, if the cluster has no available resources to run pods, the Helm installation will wait for the specified `--timeout` or the default 5 minutes before failing. 
    
    In such cases, check if any pod is stuck in the **Pending** state due to insufficient resources:

    ```sh
    kubectl get pods -A --field-selector=status.phase=Pending
    ```

    !!! note
        This behavior is not confined to jobs alone. If the cluster lacks sufficient resources, any component may remain in a **Pending** state.

For detailed information on the installation process, see [Installation overview](../troubleshoot/installation_overview.md)


### UI, API and authorization issues

To troubleshoot issues with the Percona Everest UI, API, or authorization, check the everest-server deployment. 
{.power-number}

1. **Check everest-server Pod health**

    If the Percona Everest API is not working, check the status of the everest-server pod, specifically its **Status** and **Restarts**.

    ```sh
    kubectl get po -l app.kubernetes.io/name=everest-server -n everest-system

    NAME                            READY STATUS  RESTARTS AGE
    everest-server-78699679d4-kgqk5 1/1   Running  0       4d23h
    ```

2. **Check `everest-server` logs**

    ```sh
    kubectl logs -f deploy/everest-server -n everest-system
    ```

3. **RBAC validation**

    To resolve authorization and access issues, check the Percona Everest server logs. If [Role-Based Access Control (RBAC)](../administer/rbac.md) is enabled, [validate](../administer/administer/rbac.md#validate-your-rbac-policy) or [check the permissions](../administer/rbac.md#test-your-rbac-policy) using `everestctl`.

    ```sh
    kubectl get configmap everest-rbac -n everest-system
    ```

5. **Local access via Port Forwarding**

    If you experience any access issues or lag in the Percona Everest UI or API, try port-forwarding to the service and check the latency compared to accessing it via a **LoadBalancer** or **NodePort**. 

    ```sh
    kubectl port-forward svc/everest 8080:8080
    ```
    Once you have set up the port-forward, access the webpage using [http://localhost:8080](http://localhost:8080).

### Database operation issues

Here are the common issues related to the database operations:
{.power-number}

1. **Check the `everest-operator` logs**

    Check the `everest-operator` logs if the `DatabaseCluster` object has not been created or if there are any issues. 

    ```sh
    kubectl logs -f deploy/everest-operator -n everest-system
    ```

2. **Check the `DatabaseCluster` object**

    Verify the status of the `DatabaseCluster` object and events. The status should be **Ready**. If it is anything other than **Ready**, further investigation is required. Describing the `DatabaseCluster` object provides details about the database configuration.

    ```sh
    kubectl get DatabaseCluster <DatabaseCluster-Name>
    kubectl describe DatabaseCluster <DatabaseCluster-Name>
    kubectl get DatabaseCluster <DatabaseCluster-Name> -oyaml
    ```

3. **Database objects**

    Check the operator logs and the relevant database objects, such as PXC, PSMDB, and PG. For instance, check the PXC object followed by the operator logs.

    ```sh
    kubectl get pxc <database-name>
    kubectl describe pxc <database-name>
    kubectl get pxc <database-name> -oyaml 
    kubectl logs -f deploy/percona-xtradb-cluster-operator
    
    # Change to pxc, psmdb, pg for respective database
    ```

4. **Check the database pod logs**

    ```sh
    kubectl logs -f <database-pod-name> -c <database-container-name>  
    
    # (container name could be database, pxc, mongo)
    ```




























