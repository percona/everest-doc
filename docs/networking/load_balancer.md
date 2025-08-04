# Load balancer configuration in Percona Everest

## Overview

In Percona Everest, you can access the database clusters using `ClusterIP` for internal access and `LoadBalancer` for external access. Starting with Percona Everest 1.9.0, `NodePort` has been introduced, enabling you to access database clusters directly through the node IP and designated static ports.


## Why use LoadBalancer?

Kubernetes LoadBalancer configurations vary between cloud providers. Percona Everest offers a flexible mechanism that allows administrators to create reusable, provider-specific LoadBalancer configurations to address this.


