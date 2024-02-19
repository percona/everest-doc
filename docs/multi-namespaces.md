# Multi-namespaces

In Kubernetes, the concept of namespaces enables you to create isolated groups of resources within a single cluster. These namespaces act as virtual clusters, providing a way to organize and manage resources without interfering with other resources within the same cluster.


!!! warning "Important"
    Resource names must be unique within a specific namespace but not across different namespaces.


Percona Everest supports multi-namespaces feature for the following:

- [Database clusters](use/db_provision.md)
- [Backups](use/createBackups/CreateOnDemand.md)
- [Restore](use/RestoreBackup.md)
- [Monitoring](use/monitor_endpoints.md)

## Use case for multi-namespaces in Percona Everest

If you are dealing with complex environments comprising Kubernetes clusters that need to be used with Percona Everest, you can leverage the multi-namespace feature. This feature enables logical partitioning within the cluster, thus helping to manage the clusters efficiently.

## Default namespaces in Percona Everest

Percona Everest will create the following namespaces by default. You can see these default namespaces while Percona Everest is being installed.

- everest-system
- everest-monitoring


## Configure multi-namespaces

You can configure multi-namespaces while installing Percona Everest. For detailed information on configuring multinamespaces, see (install/installEverest.md)


3. Go to Percona Everest UI and navigate to <i class="uil uil-cog"></i> **Settings > Namespaces**. A list of all the namespaces that you have created will appear here.

     ![!image](images/everest_multinamespaces.png)












 


