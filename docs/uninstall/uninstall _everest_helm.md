# Uninstall Percona Everest using Helm

If you are looking for an alternative method to uninstall Percona Everest, you can also consider using the Helm charts.


## Uninstall the database namespaces

If you have created any database namespaces other than the default namespace, ensure to delete them first.


```sh
helm uninstall everest -n <your_db_namespace>
kubectl delete ns <your_db_namespace>
```

!!! note
    This runs a chart hook that cleans up your database resources. Although it is not recommended, you can skip this step by specifying `cleanupOnUninstall=false`.


## Uninstall Percona Everest

To uninstall Percona Everest, run the following command:

```sh
helm uninstall everest-core -n everest-system
kubectl delete ns everest-system
```









