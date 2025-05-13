# Default configuration for Pod scheduling policies

In Percona Everest, the default pod scheduling policies are **preset** rules that help ensure optimal placement of database components across a Kubernetes cluster. 


## Common attributes

The following are the common attributes for a default policy for all the three database technologies.

- **Type**: The Affinity Type applied, which is **Pod Anti-Affinity**: This ensures that pods of the same component are not co-located on the same node.

- **Preference**: Preferred 1 means the scheduler will try to satisfy this rule but will still schedule the pod even if the condition cannot be met.

- **Topology Key**: The topology key `kubernetes.io/hostname` defines the scope of the rule. In this case, it ensures that the anti-affinity is evaluated at the node level, preventing matching pods from being placed on the same node.
 
##  Components by technology

The **Components** for a default policy change as per the technology:

**MySQL**: DB Node and Proxy

  ![!image](../images/mysql_default_policy.png)


**PostgreSQL**: DB Node and PG Bouncer

  ![!image](../images/pg_default_policy.png)


- **MongoDB** 
        - DB Node, Config Server, and Router (for sharded cluster) 
        - DB Node for non-sharded cluster.

    ![!image](../images/default_mongo_policy.png)



















 











