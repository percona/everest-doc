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

It must delete only the provided namespace, if it is managed by Everest.

Setting --keep-namespace will delete all the operators in the namespace, but will not delete the namespace itself. It will simply remove the Everest label.

Add new command everestctl namespaces update [NAMESPACE] to add more operators to the DB namespace.

The everestctl install  command can still provision a DB namespace like it does now. However, calling this command a second time will throw an error like Everest is already installed

If you wish to provision a DB namespace after installation, use the everestctl namespaced add command

You are allowed to skip installing a DB namespace in the everestctl install ... command








