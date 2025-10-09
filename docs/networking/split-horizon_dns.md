# Split-Horizon DNS feature for Percona Operator for MongoDB

## Introduction

Split-Horizon DNS for Percona Server for MongoDB (PSMDB) allows database administrators to **expose ReplicaSet Pods** with custom domain names, both inside and outside the Kubernetes cluster, without conflicting with the default DNS configuration.


## Why Split-Horizon DNS matters?

Database administrators may sometimes need to expose **ReplicaSet Pods** in a Percona Operator for MongoDB cluster so they can connect to them directly. This applies both inside and outside the Kubernetes environment, using custom domain names instead of the default ones generated during cluster creation.

This is useful in scenarios such as:

- Performing maintenance tasks, like copying data from one ReplicaSet to another cluster.

- Providing temporary or alternative domain names for direct Pod access without impacting the default DNS configuration.

The [Percona Server for MongoDB and its operator :octicons-link-external-16:](https://docs.percona.com/percona-operator-for-mongodb/expose.html#exposing-replica-set-with-split-horizon-dns) already support Split-Horizon DNS.

## What Split-Horizon DNS feature aims to achieve

Split-Horizon DNS for the Percona Operator for MongoDB aims to achieve the following goals:

- Enable database administrators to expose ReplicaSet Pods within the Percona Operator for MongoDB cluster. This allows direct access through additional domain names from both inside and outside the Kubernetes cluster.

- Allow database administrators to assign custom domain names to the exposed Pods.

- Provide Percona Everest users with the capability to obtain connection URLs for the exposed Pods using external domains.

## Prerequisites

Before you begin, make sure you:

- Understand [Split-Horizon DNS](https://en.wikipedia.org/wiki/Split-horizon_DNS octicons-link-external-16:) feature in computer networks.

- Understand [Split-Horizon DNS](https://docs.percona.com/percona-operator-for-mongodb/expose.html#exposing-replica-set-with-split-horizon-dns) feature in Percona Operator for MongoDB.


These concepts are essential for correctly configuring external domain access to exposed Pods in Percona Everest.






