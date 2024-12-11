# Namespaces management

The management of namespaces plays a vital role in efficiently organizing and allocating resources within Percona Everest.

## Add new namespaces

You can run the following command for provisioning a new DB namespace:

    ```sh
    everestctl namespaces add [NAMESPACE]
    ```

The command supports the following flags:

`--operator.mongodb=<bool>`

`--operator.postgres=<bool>`

`--operator.xtradb-cluster=<bool>`

`--take-ownership` - If the namespace exists, it will be adopted. If set to false, Percona Everest will throw an error.


## Delete namespaces

You can run the following command for deleting namespaces:

```sh
everestctl namespaces delete [NAMESPACE]
```

- This command deletes only the specified namespace, as long as it is managed by Percona Everest.

- Setting the `--keep-namespace` option will delete all operators in the namespace but will not remove the namespace itself. iI will only remove the Percona Everest label.


## Update namespaces

You can run the following command to add more operators to the DB namespace.


```sh
everestctl namespaces update [NAMESPACE] 
```

!!! warning
    The `everestctl install` command can provision a DB namespace. However, if you run this command again, an error will be thrown: `Everest is already installed.`


- To provision a DB namespace after installation, use the command 'everestctl namespaces add.' 

- You may choose to skip the DB namespace installation in the 'everestctl install ...' command.








