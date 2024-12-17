# Namespaces management

The management of namespaces plays a vital role in efficiently organizing and allocating resources within Percona Everest.

## Add new namespaces

You can run the following command for provisioning a new DB namespace:

```sh
everestctl namespaces add [NAMESPACE]
```

The command supports the following flags:

`--operator.mongodb=<bool>`

`--operator.postgresql=<bool>`

`--operator.xtradb-cluster=<bool>`

`--take-ownership` - Allows Percona Everest to manage an existing Kubernetes namespace by adding the necessary labels. Without this flag, Percona Everest will attempt to create the namespace and throw an error if it already exists. Use this flag to take over an existing namespace.

!!! note
    The `everestctl install` command allows you create database namespaces during the initial installation. However, it cannot be rerun to add more database namespaces. To create additional database namespaces after installation, use the namespaces add command.` 

    - To provision a DB namespace after installation, use the command `everestctl namespaces add`. 

    - You may choose to skip the DB namespace installation in the `everestctl install` command.

??? example "Example"
    ```sh
    everestctl namespaces add development --operator.postgresql=false
    ✓ Installing namespace 'development'
    ```
    In the above command, we did not specify the MongoDB and MySQL operators.       Therefore, by default, Percona Everest assumes these operators are true and will add them.

    ```sh
    everestctl namespaces add production

    ? Which operators do you want to install? MongoDB    
    ✓ Installing namespace 'production'
    ```

   
    

## Update namespaces

You can run the following command to add more operators to an existing DB namespace.


```sh
everestctl namespaces update [NAMESPACE] 
```




- To provision a DB namespace after installation, use the command `everestctl namespaces add`. 

- You may choose to skip the DB namespace installation in the `everestctl install` command.

- Removing operators with `update` is currently not supported.

??? example "Example"    
    ```sh
    everestctl namespaces update development --kubeconfig /Users/rasikachivate/Downloads/Kubeconfig

    ? Which operators do you want to install? MongoDB
    ✓ Updating namespace 'development'
    ```


## Delete namespaces

You can run the following command for deleting namespaces:

```sh
everestctl namespaces delete [NAMESPACE]
```

- This command deletes only the specified namespace, as long as it is managed by Percona Everest.

- Setting `--keep-namespace` deletes all resources within the namespace (e.g., operators, DatabaseClusters, BackupStorages) while preserving the namespace itself. Use this option to clean up the namespace without removing it.


??? example "Example"
    ```sh
    everestctl namespaces remove development  --kubeconfig /Users/rasikachivate/Downloads/Kubeconfig

    ✓ Deleting database clusters in namespace 'development'
    ✓ Deleting backup storages in namespace 'development'
    ✓ Deleting monitoring instances in namespace 'development'
    ✓ Deleting namespace 'development'
    ```
