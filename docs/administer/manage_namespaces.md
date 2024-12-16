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

`--take-ownership` - If the namespace exists, it will be part of Percona Everest. If it is set to false, Percona Everest will throw an error.

??? example "Example"    
    ```sh
    everestctl namespaces add production --kubeconfig /Users/rasikachivate/Downloads/Kubeconfig 

    ? Which operators do you want to install? MongoDB    
    ✓ Installing namespace 'production'
    ```
    
    ```sh
    everestctl namespaces add development --operator.postgresql=false --kubeconfig /Users/rasikachivate/Downloads/Kubeconfig
    ✓ Installing namespace 'development'
    ```
    In the command above, we did not specify the MongoDB and MySQL  operators. Therefore, by default, Percona Everest assumes these operators are true and will add them.

## Update namespaces

You can run the following command to add more operators to the DB namespace.


```sh
everestctl namespaces update [NAMESPACE] 
```

!!! note
    The `everestctl install` command can provision a DB namespace. However, if you run this command again, an error will be thrown: `Everest is already installed.`


- To provision a DB namespace after installation, use the command `everestctl namespaces add`. 

- You may choose to skip the DB namespace installation in the `everestctl install` command.

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





