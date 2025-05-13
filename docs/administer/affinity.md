#  Leveraging Pod scheduling policies in Percona Everest

!!! info "Important"
    Percona Everest relies on the Kubernetes scheduler for pod placement and resource management.


## Introduction

Percona Everest supports database workload scheduling on Kubernetes by allowing users to define Pod Scheduling Policies, including Kubernetes Affinity and Anti-Affinity rules. These policies not only optimize performance and enhance system resilience but also ensure that your resources are utilized to their fullest potential.


## Understanding Pod scheduling policies

Pod Scheduling Policy is a **preset** in Percona Everest that includes a set of Kubernetes affinity rules applied to the relevant DB cluster components.


Kubernetes features three primary types of affinity that play a crucial role in how pods are scheduled and interact within a cluster. 


### Pod anti-affinity

Pod anti-affinity empowers you to take control of pod placement in your Kubernetes environment. With pod anti-affinity you can prevent certain pods from being scheduled on the same node or within the same topology, such as a zone or region.

Like pod affinity, Pod anti-affinity also uses pod labels to identify and match pods that should not be co-located.

📚 [Learn more in Kubernetes documentation - Pod anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).


### Pod affinity

Pod affinity enables you to control the placement of pods based on the location of other pods. By using affinity rules, you can ensure that pods are scheduled together (co-located) on the same node, in the same zone, or within any other topological boundary.

Kubernetes uses labels, which are key-value pairs, to identify and categorize pods.

📚 [Learn more in Kubernetes documentation - Pod affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).

### Node affinity

Node affinity determines which nodes a pod can be scheduled on. Based on the labels assigned to nodes, you can define rules about where a pod should or should not be deployed. 

Nodes in a Kubernetes cluster have labels that consist of **key-value** pairs.

📚 [Learn more in Kubernetes documentation - Node affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity).



## Next steps

[Custom Pod scheduling policies :material-arrow-right:](custom_policies.md){.md-button}

[Default Pod scheduling policies :material-arrow-right:](default_policies.md){.md-button}















 











