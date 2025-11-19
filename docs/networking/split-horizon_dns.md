# Split-Horizon DNS feature for Percona Server for MongoDB


## Introduction

Split-Horizon DNS for Percona Server for MongoDB (PSMDB) allows database administrators to **expose ReplicaSet Pods** with custom domain names, both inside and outside the Kubernetes cluster, without conflicting with the default DNS configuration.


## Why Split-Horizon DNS matters?

This is useful in scenarios such as:

- Performing maintenance tasks, like copying data from one ReplicaSet to another cluster.

- Providing temporary or alternative domain names for direct Pod access without impacting the default DNS configuration.

- Allow database administrators to assign custom domain names to the exposed Pods.

- Provide Percona Everest users with the capability to obtain connection URLs for the exposed Pods using external domains.


## Prerequisites

Before you begin, make sure you:

- Understand [Split-Horizon DNS](https://en.wikipedia.org/wiki/Split-horizon_DNS octicons-link-external-16:) feature in computer networks.

- Understand [Split-Horizon DNS](https://docs.percona.com/percona-operator-for-mongodb/expose.html#exposing-replica-set-with-split-horizon-dns) feature in Percona Operator for MongoDB.


These concepts are essential for correctly configuring external domain access to exposed Pods in Percona Everest.


## Limitations of Split-Horizon DNS

Some limitations apply when using Split-Horizon DNS. See the [detailed limitations](../reference/known_limitations.md#split-horizon-dns) section for more information.



