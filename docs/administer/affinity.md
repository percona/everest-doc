#  Leveraging Pod scheduling policies in Percona Everest

!!! info "Important"
    Percona Everest relies on the Kubernetes scheduler for pod placement and resource management.


## Introduction

Percona Everest supports **database workload scheduling** on Kubernetes by allowing users to define Pod scheduling policies, including Kubernetes Affinity and Anti-Affinity rules. These policies not only optimize performance and enhance system resilience but also ensure that your resources are utilized to their fullest potential.


## Why Pod scheduling policies matter?

Database administrators often want to control the allocation of database workloads across Kubernetes clusters. This is important for enhancing performance, improving resource management, or ensuring high availability based on deployment needs. This section describes a solution that Percona Everest provides to address this challenge.

### What Pod scheduling policies feature aims to achieve

This feature in Percona Everest aims to achieve the following goals:
{.power-number}

1. Enable Percona Everest users to utilize the Kubernetes Affinity and Anti-Affinity features when deploying their database clusters.
   
2. Enable Percona Everest administrators to simplify the complexity of Kubernetes Affinity rules configuration for users:
   - Administrators can create Affinity presets independently.
   - Users can then select which Affinity preset they wish to apply to their database cluster.


## Understanding Pod scheduling policies

The Pod scheduling policy is a **preset** that includes a set of Kubernetes **Affinity** rules that are applied to the appropriate DB cluster components.

Kubernetes features three primary types of affinity that play a crucial role in how pods are scheduled and interact within a DB cluster. 

### Pod affinity

Pod affinity enables you to control the placement of pods based on the location of other pods. By using affinity rules, you can ensure that pods are scheduled together (co-located) on the same node, in the same zone, or within any other topological boundary.

Kubernetes uses labels, which are key-value pairs, to identify and categorize pods.


📚 [Learn more in Kubernetes documentation - Pod affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).


### Pod anti-affinity

Pod anti-affinity prevents certain pods from being scheduled on the same node or within the same topology, such as a zone or region.

Like pod affinity, Pod anti-affinity also uses pod labels to identify and match pods that should not be co-located.

📚 [Learn more in Kubernetes documentation - Pod anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).



### Node affinity

Node affinity determines which nodes a pod can be scheduled on. Based on the labels assigned to nodes, you can define rules about where a pod should or should not be deployed. 

Nodes in a Kubernetes cluster have labels that consist of **key-value** pairs.

📚 [Learn more in Kubernetes documentation - Node affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity).

## Types of Pod scheduling policies

There are two types of polices in Percona Everest:

- Default Policies - **Predefined** Pod scheduling policies in Percona Everest that come bundled with every Percona Everest deployment.
- Custom policies - **User-defined** pod scheduling policies created to meet specific requirements.


## Next steps

[Default Pod scheduling policies :material-arrow-right:](default_policies.md){.md-button}

[Custom Pod scheduling policies :material-arrow-right:](custom_policies.md){.md-button}

















 











