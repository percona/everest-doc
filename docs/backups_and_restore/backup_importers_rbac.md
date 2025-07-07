# RBAC for external backup imports in Percona Everest

When importing external backups into Percona Everest, it is essential to consider Role-Based Access Control(RBAC) permissions. This ensures only authorized users have the required permissions to access and manage the data.


The following RBAC permissions are supported for `DataImporters`:

|**Resource**| **Read**| **Create**| **Update**|**Delete**|
|------------|---------|-----------|-----------|----------|
| `data-importers`|<name>| :x:|:x: | :x:|
| `data-import-jobs`|<namespace>/<db name>| :x:|:x: | :x:|



