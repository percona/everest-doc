## DB clusters

### Add a DB Cluster

In order to create a database cluster you must have at least one Kubernetes cluster registered to PMM. Start [here](dbaas/setting-up.md#create-a-kubernetes-cluster) if you haven't done that yet.

!!! caution alert alert-warning "Important"
In order for PMM to collect metrics from your DB clusters, you must first set the [public address](../how-to/configure.md#public-address) of your PMM server.

You can create a DB cluster with the click of a button! We have populated all needed fields with suitable defaults but you can customize many aspects of your DB cluster's configuration.

To create a DB cluster, do the following:

1. Select the _DB Cluster_ tab.

2. Click _Create DB Cluster_.

3. From the drop-down menu, select the values for the following:

   - _Kubernetes Cluster_
   - _Database Type_
   - _Database Version_

4. Optionally expand _Advanced Settings_ panel for further customization.

   1. Select the number of nodes. (1 is the minimum)

   2. Select a preset _Resources per Node_.

      _Small_, _Medium_ and _Large_ are fixed preset values for _Memory_, _CPU_, and _Disk_.

      Values for the _Custom_ preset can be edited.

      Beside each resource type is an estimate of the required and available resources represented numerically in absolute and percentage values, and graphically as a colored, segmented bar showing the projected ratio of used to available resources. A red warning triangle <i style="color: red" class="uil uil-exclamation-triangle"></i> is shown if the requested resources exceed those available.

      ![!](../images/PMM_DBaaS_DB_Cluster_Advanced_Options.png)

   3. Enter the following on the _Database Configurations_ panel:

   - _Storage Class_ - Select the storage class from the drop-down. Storage classes allow dynamic provisioning of persistent storage for PMM. Using storage classes, you can create and attach volumes on-demand without manually managing the underlying storage infrastructure.
   - _Database configuration_- Enter the config string into the Configuration text box to configure the database engine.

     ![!](../images/PMM_DBaaS_DB_Cluster_Advanced_DB_Config.png)

   4. Enter the following on the _Network and Security_ panel:

   - _Expose_ - Select this checkbox to make this DB cluster available outside of the kubernetes cluster.
   - _Internet Facing_ - Select this checkbox if you want the cluster to be accessible on the Internet.
   - _Source Range_ - For security, you can control the exposure level by providing the IP address in the _Source Range_ field. This allows you to choose the IP addresses that can access your DB cluster. To add more than one source range, click _Add New_.

5. Click _Create Cluster_ to create your cluster.

6. A row appears with information on your cluster:

   ![!](../images/PMM_DBaaS_DB_Cluster_Created.png)

   - _Name_: The cluster name.
   - _Database_: The cluster database type and version.
   - _Connection_:
     - _Host_: The hostname.
     - _Port_: The port number.
     - _Username_: The connection username.
     - _Password_: The connection password (click the eye icon <i class="uil uil-eye"></i> to reveal).
   - _DB Cluster Parameters_:
     - _K8s cluster name_: The Kubernetes cluster name.
     - _CPU_: The number of CPUs allocated to the cluster.
     - _Memory_: The amount of memory allocated to the cluster.
     - _Disk_: The amount of disk space allocated to the cluster.
   - _Cluster Status_:
     - _PENDING_: The cluster is being created.
     - _ACTIVE_: The cluster is active.
     - _FAILED_: The cluster could not be created.
     - _DELETING_: The cluster is being deleted.
     - _UPDATING_: The cluster is being updated.

### Delete a DB Cluster

1. Select the _DB Cluster_ tab.

2. Find the row with the database cluster you want to delete.

3. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Delete_.

4. Confirm the action by clicking _Proceed_, or abandon by clicking _Cancel_.

   ![!](../images/PMM_DBaaS_DB_Cluster_Delete.png)

!!! danger alert alert-danger "Danger"
Deleting a cluster also deletes any attached volumes. Please proceed with caution.

### Edit a DB Cluster

1. Select the _DB Cluster_ tab.

2. Find the row with the database cluster you want to change.

3. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Edit_.

A paused cluster can't be edited.

### Restart a DB Cluster

1. Select the _DB Cluster_ tab.

2. Identify the database cluster to be changed.

3. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Restart_.

### Suspend or resume a DB Cluster

1. Select the _DB Cluster_ tab.

2. Identify the DB cluster to suspend or resume.

3. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click the required action:

   - For active clusters, click _Suspend_.

     ![!DBaaS Suspend](../images/PMM_DBaaS_DB_Cluster_Suspend.gif)

   - For paused clusters, click _Resume_.

     ![!DBaaS Resume](../images/PMM_DBaaS_DB_Cluster_Resume.gif)

### Update a DB Cluster

1. Select the _DB Cluster_ tab.

2. Identify the DB cluster to update.

3. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Update_:

   ![!DBaaS Update](../images/PMM_DBaaS_DB_Cluster_Update_menu.png)

4. Confirm the update by clicking on _Update_, or abandon by clicking _Cancel_.

   ![!DBaaS Update Confirmation](../images/PMM_DBaaS_DB_Cluster_Update_confirmation.png)

!!! seealso alert alert-info "See also"
[Setting up a development environment for DBaaS](../dbaas/setting-up.md)

[ALPHA]: https://en.wikipedia.org/wiki/Software_release_life_cycle#Alpha
[Amazon Elastic Kubernetes Service (EKS)]: https://aws.amazon.com/eks/
[AWS documentation]: https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html
