# Multiple namespaces

In Kubernetes, the concept of namespaces enables you to create isolated groups of resources within a single cluster. These namespaces provide a way to organize and manage resources without interfering with other resources within the same cluster.


!!! warning "Important"
    Resource names must be unique within a specific namespace but not across different namespaces.


## Use case for multiple namespaces

If you are dealing with complex environments comprising Kubernetes clusters that need to be used with Percona Everest, you can leverage the multiple namespace feature. This feature enables logical partitioning within the cluster.

For example, you can deploy different environments like production, development, and QA within a single cluster by using multiple namespaces. This approach enables you to efficiently manage the clusters.

## Default namespaces in Percona Everest

!!! warning "Important"
    The following namespaces are restricted and cannot be used for deploying databases.

Percona Everest will create the following namespaces by default. You can see these default namespaces while Percona Everest is being installed.

- everest-olm: hosts the [Operator Lifecycle Manager](https://olm.operatorframework.io/) that manages all operators that are part of everest
- everest-system: hosts Everest 
- everest-monitoring: hosts the monitoring stack for kubernetes metrics ([VictoriaMetrics](https://victoriametrics.com/) and [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics))

To set up the namespaces that Percona Everest will manage and where you can deploy your databases, see the [Installation](../install/installEverest.md#installation) section.

## Configure multiple namespaces

The following holds true for multiple namespaces:

- You can configure multiple namespaces in Percona Everest. 

- You can install different operators in various namespaces by running the install command multiple times.

    See the following example for more details:
    
    ??? info "Example: Installing various operators in different namespaces"
            
        To install various operators in different namespaces, such as MySQL and MongoDB operator in namespaces dev and testing, and PostgreSQL operator in namespaces production and staging, run the following command:
            {.power-number}

            1.     everestctl install

                
            ??? example "Expected output"

                ```sh
                ? Namespaces managed by Everest [comma separated] dev,testing
                ? What operators do you want to install? MySQL, MongoDB
                ```

            2. Rerun the `everestctl install` command to install the PostgreSQL operator in the production and staging namespaces.


            ??? example "Expected output"

                ```sh
                ? Namespaces managed by Everest [comma separated] production,staging
                ? What operators do you want to install? PostgreSQL
                ```


Go to Percona Everest UI and navigate to <i class="uil uil-cog"></i> **Settings > Namespaces**. A list of all the namespaces that you have created will appear here.

![!image](../images/everest_multinamespaces.png)

## Deploy the database in your namespace

Once you have configured your namespaces, you can choose the namespace where you want to deploy your new database cluster.

 ![!image](../images/everest_multi-namespaces.png)

For information on deploying a new database cluster in the namespace, see the [Provision a database](../use/db_provision.md) section.













 


