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





