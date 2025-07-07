# RBAC for external backup imports in Percona Everest

When importing external backups into Percona Everest, it is essential to consider Role-Based Access Control(RBAC) permissions. This ensures only authorized users have the required permissions to access and manage the data.


The following RBAC permissions are supported for `DataImporters`:


!!! warning "Important"
    :x: Represents an action that's not supported by the Percona Everest API.

|**Resource**| **Read**| **Create**| **Update**|**Delete**|
|------------|---------|-----------|-----------|----------|
| `data-importers`|<name>| :x:|:x: | :x:|
| `data-import-jobs`|<namespace>/<db name>| :x:|:x: | :x:|



