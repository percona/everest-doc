# Multiple namespaces

In Kubernetes, the concept of namespaces enables you to create isolated groups of resources within a single cluster. These namespaces provide a way to organize and manage resources without interfering with other resources within the same cluster.


!!! warning "Important"
    Resource names must be unique within a specific namespace but not across different namespaces.


## Use case for multi-namespaces in Percona Everest

If you are dealing with complex environments comprising Kubernetes clusters that need to be used with Percona Everest, you can leverage the multiple namespace feature. This feature enables logical partitioning within the cluster, thus helping to manage the clusters efficiently.

## Default namespaces in Percona Everest

!!! caution alert alert-warning "Important"
    The following namespaces are restricted and cannot be used for deploying databases.

Percona Everest will create the following namespaces by default. You can see these default namespaces while Percona Everest is being installed.

- everest-olm: hosts the [Operator Lifecycle Manager](https://olm.operatorframework.io/) that manages all operators that are part of everest
- everest-system: hosts Everest 
- everest-monitoring: hosts the monitoring stack for kubernetes metrics ([VictoriaMetrics](https://victoriametrics.com/) and [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics))

To set up the namespaces that Percona Everest will manage and where you can deploy your databases, see the [Installation](install/installEverest.md#installation) section.

## Configure multiple namespaces

You can configure multiple namespaces while installing Percona Everest. For detailed information on configuring multiple namespaces, see the [Installation](install/installEverest.md#installation) section.


Go to Percona Everest UI and navigate to <i class="uil uil-cog"></i> **Settings > Namespaces**. A list of all the namespaces that you have created will appear here.

     ![!image](images/everest_multinamespaces.png)












 


