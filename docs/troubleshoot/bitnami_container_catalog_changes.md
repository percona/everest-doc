# Percona Everest and Bitnami Container Catalog changes

!!! warning "ACTION REQUIRED: Bitnami Container Catalog changes impact"
    Bitnami is restructuring its container catalog on September 29, 2025. To avoid potential failures in Percona Everest operations, follow the steps given below.

## What’s changing with Bitnami?

Bitnami is [restructuring its container catalog](https://github.com/bitnami/containers/issues/83267). Starting **September 29, 2025**, most images (including bitnami) will move to a legacy repository.

Percona Everest is affected because it depends on the `bitnami/kubectl` image for several critical tasks:


- The `everest-operators-installer` job during installation and namespace provisioning

- Cleanup jobs like `pre-delete`, `csv-cleanup`, and `psp-cleanup` during uninstallation

If no action is taken, install, update, or uninstall operations will fail after **September 29, 2025**.

## Mandatory fix

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

## If you’re on Percona Everest v1.8.1 or earlier

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

## Troubleshooting after Sept 29, 2025

### Scenario 1: Installation or namespace provisioning stuck

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


### Scenario 2: Uninstallation is stuck


If your `everestctl uninstall` command is stalled, showing a status like this:

```sh
✅ Deleting database clusters in namespace 'everest'
✅ Deleting backup storages in namespace 'everest'
✅ Deleting monitoring instances in namespace 'everest'
●∙∙ Deleting database namespace 'everest'

Esc/Ctrl+c quit
```

Follow these steps to fix the problem:
{.power-number}

1. Open a new terminal and leave the stalled process running.

2. Verify the stuck Helm release. 

    Confirm the everest-db-namespace chart is in an **uninstalling** state. 
    
    !!! note
        Make sure to note the `release name `and `namespace`.

     ```sh
     helm list --all-namespaces --uninstalling
    NAME       NAMESPACE      REVISION                           
    UPDATED    STATUS       CHART              APP VERSION
    everest    everest        1          2025-09-18 16:37:49.047308243 +0100 WEST   uninstalling everest-db-namespace-1.8.1      1.8.1
    ```

3. Identify the stuck job. 

    List the jobs in the namespace and find the one with a **Running** status. 

    !!! note
        Make sure to note the job’s name.
    
     ```sh
     kubectl get jobs -n everest
     NAME                                  STATUS    COMPLETIONS   DURATION   AGE
     everest-helm-pre-delete-hook-288662   Running   0/1             
      25s        25s
      ```   

4. Confirm the cause. 

    Check the pod to ensure it’s an `ImagePullBackOff` for the `bitnami/kubectl:latest` image. 
    
    !!! note
        Make sure to note the pod and the container name.

    ```sh
    kubectl get pod -l job-name=everest-helm-pre-delete-hook-288662 --      all-namespaces -o custom-               
    NAME NAMESPACE        CONTAINER_NAME                            
     IMAGE                       WAITING_REASON
    everest-helm-pre-delete-hook-288662-dlddp      everest        
     everest-helm-pre-delete-hook    bitnami/kubectl:latest      
      ImagePullBackOff
    ```


5. Patch the pod. 

    Replace the `bitnami/kubectl` image with the new `percona/everest-helmtools:0.0.1` image. 
    
    !!! note
        Make sure to replace the pod and container names with your custom names.

     ```sh
     kubectl patch pod everest-helm-pre-delete-hook-288662-dlddp -n     
      everest -p '{"spec":{"containers":[{"name":"everest-helm-pre- 
       delete-hook","image":"percona/everest-helmtools:0.0.1"}]}}'
     pod/everest-helm-pre-delete-hook-288662-dlddp patched
     ```

6. Repeat as needed. The uninstallation should now progress, but it might get stuck again on other cleanup jobs like `psp-cleanup`. Repeat steps 3-5, identifying and patching any new stuck jobs until the uninstallation completes.

7. Your immediate issue is now resolved. Make sure to complete the steps in the [Mandatory Fix](../troubleshoot/troubleshoot.md#mandatory-fix) section if you haven’t already, to avoid this problem in the future.





























