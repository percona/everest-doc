# DatabaseCluster examples

Here are some sample configurations for various database engines supported by OpenEverest.


## PostgreSQL cluster

```
apiVersion: everest.percona.com/v1alpha1
kind: DatabaseCluster
metadata:
  labels:
    clusterName: my-pg-cluster
  name: my-pg-cluster
spec:
  backup:
    pitr:
      backupStorageName: my-s3-backup-storage
      enabled: true
    schedules:
      - backupStorageName: my-s3-backup-storage
        enabled: true
        name: my-pg-backup-schedule
        schedule: 30 19 * * *
  engine:
    replicas: 3
    resources:
      cpu: "4"
      memory: 8G
    storage:
      class: standard-rwo
      size: 100Gi
    type: postgresql
    userSecretsName: everest-secrets-my-pg-cluster
    version: "17.4"
  monitoring:
    resources: {}
  proxy:
    expose:
      type: internal
    replicas: 3
    resources:
      cpu: "1"
      memory: 30M
    type: pgbouncer
```

## MongoDB sharded cluster

```
apiVersion: everest.percona.com/v1alpha1
kind: DatabaseCluster
metadata:
  labels:
    clusterName: mongodb-sharded
  name: mongodb-sharded
spec:
  backup:
    pitr:
      enabled: false
    schedules:
    - backupStorageName: my-s3-backup-storage
      enabled: true
      name: my-schedule
      schedule: 30 19 * * *
  engine:
    replicas: 3
    resources:
      cpu: "1"
      memory: 4G
    storage:
      class: standard-rwo
      size: 25Gi
    type: psmdb
    userSecretsName: everest-secrets-mongodb-sharded
    version: 7.0.15-9
  monitoring:
    resources: {}
  proxy:
    expose:
      type: internal
    replicas: 3
    resources:
      cpu: "1"
      memory: 2G
    type: mongos
  sharding:
    configServer:
      replicas: 3
    enabled: true
    shards: 2
```

## Percona XtraDB cluster


```yaml
apiVersion: everest.percona.com/v1alpha1
kind: DatabaseCluster
metadata:
  labels:
    clusterName: my-pxc-cluster
  name: my-pxc-cluster
spec:
  backup:
    pitr:
      enabled: false
    schedules:
    - backupStorageName: s3
      enabled: true
      name: backup-wbj
      schedule: 30 19 * * *
  engine:
    replicas: 3
    resources:
      cpu: "4"
      memory: 8G
    storage:
      class: standard-rwo
      size: 100Gi
    type: pxc
    userSecretsName: everest-secrets-my-pxc-cluster
    version: 8.0.39-30.1
  monitoring:
    resources: {}
  proxy:
    expose:
      type: internal
    replicas: 3
    resources:
      cpu: 200m
      memory: 200M
    type: haproxy
```


You can find these and more manifests in the [examples directory](https://github.com/percona/everest-operator/tree/main/docs/examples)



