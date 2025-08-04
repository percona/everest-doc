# Load balancer configuration in Percona Everest

## Overview

In Percona Everest, you can access the database clusters using `ClusterIP` for internal access and `LoadBalancer` for external access. Starting with Percona Everest 1.9.0, `NodePort` has been introduced, enabling you to access database clusters directly through the node IP and designated static ports.


## Why use LoadBalancer?

Kubernetes LoadBalancer configurations differ across cloud providers. To streamline this, Percona Everest provides a flexible mechanism that allows administrators to create reusable and provider-specific LoadBalancer configurations.


## Understanding some key terms

| **Term**                  | **Definition**                                                                                                                                            |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ClusterIP** | In Kubernetes, a service type that exposes an application on a virtual IP address within the cluster. |
| **LoadBalancer**| In Kubernetes, a service type that exposes your application to the internet using a cloud provider’s load balancing infrastructure.|
| **Load Balancer Config**  | A preset in Percona Everest that contains a set of key-value pairs representing annotations applied to the appropriate LoadBalancer.|
| **NodePort**| In Kubernetes, a service type that exposes your application by opening a specific port on each node in the cluster.|
| **Percona Everest User**  | A user of Percona Everest who manages database clusters.  |
| **Percona Everest Admin** | A user with full permissions to configure and maintain Percona Everest.|
