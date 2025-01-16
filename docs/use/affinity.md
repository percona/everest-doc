#  Leveraging Affinity in Percona Everest

The database Affinity rules provide database administrators with enhanced control over workload distribution in a Kubernetes cluster. By implementing affinity and anti-affinity rules, you can not only optimize performance and enhance system resilience but also ensure that your resources are utilized to their fullest potential.

## Affinity rules

Affinity refers to rules that attempt to schedule Pods together or on nodes that meet specific criteria. It promotes the co-location of Pods or assigns Pods to preferred nodes.

### Types of affinity

Kubernetes supports the following types of affinity:

- **Node Affinity**: Node affinity is used to schedule Pods on nodes that meet specific criteria based on node labels.
    
- **Pod Affinity**: Pod Affinity is used to define rules to ensure that certain Pods are scheduled close to or on the same nodes as other Pods.
    
- **Pod Anti-Affinity**: Pod Anti-Affinity is used to specify rules that ensure certain Pods are scheduled away from each other.


You can set affinity rules in Percona Everest via the **Advanced Configurations** page within the **Affinity** section. From the Percona Everest home page, navigate through the **Create Database** wizard until you reach the **Advanced Configurations** page.

Each component has a default affinity rule of type **Pod Anti-Affinity** with the following settings: 

- Priority: Preferred

- Weight: 1

- Topology Key: `kubernetes.io/hostname`.

### Add a new rule

Here’s how you can create a new rule for affinity:
{.power-number}

1. From the **Advanced Configurations** page, click **Create affinity rule**. The **Add rule** screen will be displayed.

2. In the **Rule type** section, select the following:

    - **Component**: The following components are available based on the selected databases:
    
        - **MongoDB**: DB Node
        - **MongoDB sharded cluster**: Config server, DB Node, Proxy
        - **MySQL**: DB Node, Proxy
        - **PostreSQL**: DB Node, Proxy

    - **Type**: The following are the different [types of affinity](#types-of-affinity):

        - node affinity
        - pod affinity
        - pod anti-affinity

    - **Priority**: Each type of Affinity can implement two distinct levels of rule enforcement:
        
        - **Prefered**: It defines preferences for Pod scheduling instead of strict requirements. Kubernetes will try to place the Pod according to these preferences, but if they cannot be fulfilled, the Pod will still be scheduled.    
        - **Required**: A strict requirement that must be met for a Pod to be scheduled. If the conditions in this field are not met, the Pod will remain unscheduled.

    - **Weight (1-100)**: It prioritizes preferred scheduling rules using a numerical value that indicates how strongly Kubernetes should favor specific placement preferences when scheduling Pods. Higher weights signify stronger preferences, meaning Kubernetes will prioritize fulfilling rules with higher weights over those with lower weights. 
    
        !!! note
            Weight is only used when the priority is **Preferred**.

3. In the **Rule details** section, enter the following:

    - **Topology key**: It specifies the domain or grouping within which Pods should be scheduled together (for affinity) or apart (for anti-affinity).
    
    - **Key**: The key field is a label that identifies resources like Pods or nodes through their associated labels.

    - **Operator**: The operator field specifies how a label's values match a resource, such as a Pod or node. It establishes the logical condition to determine if a resource satisfies the affinity or anti-affinity rule.

        The following are all logical operators you can use in the operator field:

        - **In**: Matches label values in a list.

            !!! note
                When using the **In** operator, you must provide the values.
        
        - **NotIn**: Matches label values not in a list.

            !!! note
                When using the **NotIn** operator, you must provide the values.

        - **Exists**: Matches when a label key exists, regardless of its value.

        - **DoesNotExist**: Matches when a label key does not exist.	


4. Click **Add rule**. You can view the affinity rule on the components page of the corresponding database.


|**Settings**|**Components**|**Note**|**Description**|
|------------|-------------|---------------|-----------|
|Node affinity|* Config Server<br/>* DB Node<br/>* Proxy<br/><br/><br/>DB node|This is applicable to MongoDB sharded cluster.<br/><br/></br>This is applicable to MongoDB non sharded cluster.|Node affinity is used to schedule Pods on nodes that meet specific criteria based on node labels.



 











