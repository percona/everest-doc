# Split-Horizon DNS feature for Percona Operator for MongoDB


## Introduction

Split-Horizon DNS for Percona Server for MongoDB (PSMDB) allows database administrators to **expose ReplicaSet Pods** with custom domain names, both inside and outside the Kubernetes cluster, without conflicting with the default DNS configuration.


## Why Split-Horizon DNS matters?

Database administrators may sometimes need to expose **ReplicaSet Pods** in a Percona Operator for MongoDB cluster so they can connect to them directly. This applies both inside and outside the Kubernetes environment, using custom domain names instead of the default ones generated during cluster creation.

This is useful in scenarios such as:

- Performing maintenance tasks, like copying data from one ReplicaSet to another cluster.

- Providing temporary or alternative domain names for direct Pod access without impacting the default DNS configuration.

The [Percona Server for MongoDB and its operator](https://docs.percona.com/percona-operator-for-mongodb/expose.html#exposing-replica-set-with-split-horizon-dns) already support Split-Horizon DNS.


