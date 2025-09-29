# Managing database clusters with CRD

At the core of Percona Everest is the `DatabaseCluster CRD`, which defines and manages database clusters.


??? example "Example: Basic database cluster"
    ```
    apiVersion: everest.percona.com/v1alpha1
    kind: DatabaseCluster
    metadata:
      name: my-database-cluster
      labels:
        clusterName: my-database-cluster
    spec:
    backup:
    pitr:
      enabled: false
    engine:
      type: postgresql   # Can be: postgresql, pxc, psmdb
      version: "17.4"
      replicas: 1
      resources:
        cpu: "1"
        memory: 2G
      storage:
        class: standard-rwo
        size: 25Gi
        userSecretsName: everest-secrets-my-database-cluster
      monitoring:
        resources: {}
    proxy:
      type: pgbouncer
      replicas: 1
      resources:
        cpu: "1"
        memory: 30M
    expose:
      type: internal
    ```

    

## Supported database engine types

Percona Everest supports three database engines:

- Percona Distribution for PostgreSQL

- Percona XtraDB Cluster (MySQL)

- Percona Server for MongoDB


### DatabaseEngine CRD

The DatabaseEngine Custom Resource Definition (CRD) manages the lifecycle of database engines in your Kubernetes cluster. 

It handles the following:

- Operator installation
- Upgrades
- Version management


??? example "Example: DatabaseEngine CRD"
    ```
    apiVersion: everest.percona.com/v1alpha1
    kind: DatabaseEngine
    metadata:
      name: percona-postgresql-operator
    spec:
      type: postgresql
    ```

### DatabaseEngine status

The DatabaseEngine status provides the following information:


- Operator state: not installed, installing, installed, upgrading
- Current operator version
- Available database versions and their components
- Pending operator upgrades


Each version can have one of these statuses:

- **recommended**: Preferred version for production use

- **available**: Supported, but not the recommended version

- **unavailable**: Version exists but currently can’t be used

- **unsupported**: Version is no longer supported


To check the available versions and their status:

```
kubectl get dbengine percona-postsgresql-operator -n <your namespace> -o jsonpath='{.status.availableVersions}'
```

??? example "Example: DatabaseEngine with both spec and status"
    ```
    apiVersion: everest.percona.com/v1alpha1
    kind: DatabaseEngine
    metadata:
      name: percona-postgresql-operator
      namespace: everest
    spec:
      type: postgresql
    status:
      state: installed
      operatorVersion: 1.4.0
      availableVersions:
        "14.9.0": recommended
        "14.8.0": available
        "13.11.0": available
        "12.14.0": unsupported
        "15.0.0": unavailable
      pendingUpgrades:
        - from: 1.3.0
        to: 1.4.0
    ```

!!! note
    Operator upgrades must be performed through the UI or API, not directly via Kubernetes.


### Exposing your database

You can expose your database service either internally or externally:

```sh
spec:
  proxy:
    type: haproxy  # or: pgbouncer, proxysql, mongos
    expose:
      type: external
      ipSourceRanges:  # Optional IP whitelist
        - "10.0.0.0/24"
    replicas: 2
```








