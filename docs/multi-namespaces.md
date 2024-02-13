# Multi-namespaces

In Kubernetes, the concept of namespaces enables you to create isolated groups of resources within a single cluster. These namespaces act as virtual clusters, providing a way to organize and manage resources without interfering with other resources within the same cluster.


!!! warning "Important"
    Resource names must be unique within a specific namespace but not across different namespaces.

## Use case

If you are dealing with complex environments comprising multiple k8s clusters that need to be used with Percona Everest, you can leverage the multi-namespace feature. This feature enables logical partitioning between the virtual clusters, thus helping to manage the clusters efficiently.

## Create multi-namespaces

To create multi-namespaces using the wizard:
{.power-number}

1. Run the command:

    ```sh
    everestctl install
    ```

2. Enter the specific names for the namespaces you want to create, separating each name with a comma.

    ??? example "Expected output"
        ```
        ? Namespaces managed by Everest (comma separated) dev, production
        ? What operators do you want to install? MySQL, MongoDB, PostgreSQL        
        ```

    Alternatively, you can create multi-namepaces in the headless mode:

    ```sh
    everestctl install --namespace <namespace-name> --namespace <namespace-name> --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
    ```
    Replace `<namespace-name>` with the desired name for your namespace.

    ??? example "Example"
        ```
        everestctl install --namespace dev --namespace prod --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
        ```

3. Go to Percona Everest UI and navigate to <i class="uil uil-cog"></i> **Settings > Namespaces**. A list of all the namespaces that you have created will appear here.

     ![!image](../images/everest_multinamespaces.png)








 


