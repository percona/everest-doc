#  Leveraging Affinity in Percona Everest

The database Affinity rules provide database administrators with enhanced control over workload distribution in a Kubernetes cluster. By implementing affinity and anti-affinity rules, you can not only optimize performance and enhance system resilience but also ensure that your resources are utilized to their fullest potential.

## Affinity rules

Affinity refers to rules that attempt to schedule Pods together or on nodes that meet specific criteria. It promotes the co-location of Pods or assigns Pods to preferred nodes.

### Set up affinity rules for your cluster

You can set affinity rules in Percona Everest via the **Advanced Configurations** page within the **Affinity** section. 
{.power-number}

1. From the Percona Everest home page, navigate through the **Create Database** wizard until you reach the **Advanced Configurations** page.

2. From the **Advanced Configurations** page, click **Create affinity rule**. The **Add rule** screen will be displayed.

    
3. Enter the information on the **Add Rule** screen. Click **Add rule**. You can view the affinity rule on the components page of the corresponding database.

The following table provides details about the different elements involved in setting up affinity rules for your databases.

|**Settings**    |**Description**  |**Note**  |
|----------------|-----------------|--------------|
|**Node affinity**|Node affinity is used to schedule Pods on nodes that meet specific criteria based on node labels.|   |
|**Pod affinity**|Pod Affinity is used to define rules to ensure that certain Pods are scheduled close to or on the same nodes as other Pods.|   |
|**Pod anti-affinity**|Pod Anti-Affinity is used to specify rules that ensure certain Pods are scheduled away from each other.|   |
|**Components**|<ul><li>Config Server</li><li>DB Node</li><li>Router</br></br></li><li>DB Node</br><br></li><li>DB Node</li><li>Proxy</li></ul>|Applicable for **MongoDB sharded cluster**.<br/></br></br></br></br>Applicable for **MongoDB non sharded cluster**.</br></br>Applicable for **MySQL** and **PostgreSQL** databases.|
|**Priority**|Each type of Affinity can implement two distinct levels of rule enforcement:</br><ul><li>Preffered</br></br></br></br></br></li><li>Required</li></ul>|</br></br>Defines the preferences for Pod scheduling instead of strict requirements. Kubernetes will try to place the Pod according to these preferences, but if they cannot be fulfilled, the Pod will still be scheduled.</br></br>A strict requirement that must be met for a Pod to be scheduled. If the conditions in this field are not met, the Pod will remain unscheduled.|
|**Weight (1-100)**|It prioritizes preferred scheduling rules using a numerical value that indicates how strongly Kubernetes should favor specific placement preferences when scheduling Pods. Higher weights signify stronger preferences, meaning Kubernetes will prioritize fulfilling rules with higher weights over those with lower weights.|Weight is only used when the priority is **Preferred**.|
|**Topology key**|It specifies the domain or grouping within which Pods should be scheduled together (for affinity) or apart (for anti-affinity).| Node affinity rules do not include a topology key. </br></br>Here are some examples of **topologyKey**:</br><ul><li>kubernetes.io/hostname</li><li>topology.kubernetes.io/zone	</li><li>topology.kubernetes.io/region</li><li>custom node labels (e.g., rack)</li></ul>|
|**key**|The key field is a label that identifies resources like Pods or nodes through their associated labels.|Here are some examples of **key**:</br><ul><li>app</li><li>security</li><li>environment</li><li>custom labels (e.g., security, web-store)</li></ul>|
|**Operator**|The operator field specifies how a label's values match a resource, such as a Pod or node. It establishes the logical condition to determine if a resource satisfies the affinity or anti-affinity rule.</br></br>The following are all logical operators you can use in the operator field:</br><ul><li>**In**: Matches label values in a list</li><li>**NotIn**: Matches label values not in a list.</li><li>**Exists**: Matches when a label key exists, regardless of its value.</li><li>**DoesNotExist**: Matches when a label key does not exist.</li></ul>|When using the **In** and **NotIn** operators, you have to provide the values for the key as well.|
|**Values**|The values are the specific label values that must match the key for the affinity rule to apply.|Here are some examples for **values**:</br><ul><li>s2</li><li>database</li><li>production</li><li>custom values</li></ul>|

## Use cases for affinity

Here are several detailed use cases for affinity that highlight its diverse applications and the numerous benefits it offers across various contexts.


=== Node affinity

    ### Use case for Node affinity

    Let's consider a use case in which workloads are distributed based on performance requirements, fault tolerance, and regional specifications across designated zones or areas.

    You need to run a workload in the us-west-2 region for latency optimaztion and to meet specific compliance requirements.

    ```sh
    affinity:
    nodeAffinity:
        requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
            - key: topology.kubernetes.io/region
            operator: In
            values:
            - "us-west-2"
    ```
    ??? info "What happens under the hood"
        It ensures that the pod is scheduled only on nodes located in the us-west-2 region, as defined by the `topology.kubernetes.io/region` node label.

        For the rule to be applicable, it is essential that the node possesses a label such as `topology.kubernetes.io/region: us-west-2`. If no nodes correspond to the specified label, the pod will remain in an unscheduled state.



















 











