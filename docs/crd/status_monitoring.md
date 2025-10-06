# Status monitoring


You can monitor the status of your database cluster by running the following command:

```sh
kubectl get databasecluster <cluster-name> -o jsonpath='{.status}'
```

The `status` field will show one of these states:

- **creating**: Initial creation in progress
- **initializing**: Database is being initialized
- **ready**: Database is running and ready
- **error**: An error has occurred
- **paused**: Database is paused
- **upgrading**: Database is being upgraded
- **restoring**: Database is being restored from backup
