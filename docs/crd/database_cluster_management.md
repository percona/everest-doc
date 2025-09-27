# Managing database clusters with CRD

At the core of Percona Everest is the `DatabaseCluster CRD`, which defines and manages database clusters.


??? example "Example: Basic database cluster"
    ```
    yaml
    apiVersion: everest.percona.com/v1alpha1
kind: DatabaseCluster
metadata:
  labels:
    clusterName: my-database-cluster
  name: my-database-cluster
spec:
  backup:
    pitr:
      enabled: false
  engine:
    replicas: 1
    resources:
      cpu: "1"
      memory: 2G
    storage:
      class: standard-rwo
      size: 25Gi
    type: postgresql # Can be pxc, psmdb, postgresql
    userSecretsName: everest-secrets-my-database-cluster
    version: "17.4"
  monitoring:
    resources: {}
  proxy:
    expose:
      type: internal
    replicas: 1
    resources:
      cpu: "1"
      memory: 30M
    type: pgbouncer
    ```

## Supported database engine types

Percona Everest supports three database engines:

- Percona Distribution for PostgreSQL

- Percona XtraDB Cluster (MySQL)

- Percona Server for MongoDB











