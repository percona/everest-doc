# Load balancer configuration in Percona Everest

## Overview

Provisioning external access to Kubernetes clusters can be challenging, since cloud providers like AWS, GCP, and Azure each have their own annotations and configurations for load balancers. As a result, users often have to manually adjust settings for each environment, leading to a lack of a unified approach.

## Why use load balancer?

Percona Everest simplifies the process by enabling administrators to define reusable load balancer configurations. This includes cloud provider-specific settings that can be applied consistently across clusters, ensuring:

- Consistency across cloud and on-prem environments

- Reduced manual effort when provisioning external access

- Flexibility to support multiple cloud providers with a unified approach



## Understanding some key terms

| **Term**                  | **Definition**                                                                                                                                            |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ClusterIP** | In Kubernetes, a service type that exposes an application on a virtual IP address within the cluster. |
| **Load balancer**| In Kubernetes, a service type that exposes your application to the internet using a cloud provider’s load balancing infrastructure.|
| **Load balancer Config**  | A preset in Percona Everest that contains a set of key-value pairs representing annotations applied to the appropriate LoadBalancer.|
| **NodePort**| In Kubernetes, a service type that exposes your application by opening a specific port on each node in the cluster.|
| **Percona Everest user** | A user of Percona Everest who manages database clusters. |
| **Percona Everest admin** | A user with full permissions to configure and maintain Percona Everest.|

