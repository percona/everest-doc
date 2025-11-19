# Split-Horizon DNS config Custom Resource Definition (CRD)

To configure Split-Horizon DNS, Percona Everest Operator introduces a new Custom Resource Definition (CRD):

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: splithorizondnsconfigs.enginefeatures.everest.percona.com
  ...
spec:
  group: enginefeatures.everest.percona.com
  names:
    kind: SplitHorizonDNSConfig
    listKind: SplitHorizonDNSConfigList
    plural: splithorizondnsconfigs
    singular: splithorizondnsconfig
    shortNames:
    - splitdns
  scope: Namespaced
  ...
```

The following CRD provides information on Split-Horizon DNS parameters necessary for configuring this feature in Percona Server for MongoDB clusters.

```yaml
apiVersion: enginefeatures.everest.percona.com/v1alpha1
kind: SplitHorizonDNSConfig
metadata:
  name: my-shdc
  namespace: everest
spec:
  baseDomainNameSuffix: mycompany.com
  tls:
    secretName: my-shdc-secret
    certificate:
      ca.crt: <base64 encoded ca.crt file content>
      ca.key: <base64 encoded ca-key.pem file content>
```

**Fields in `SplitHorizonDNSConfig.spec`**

| Field                                | Description                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| `.spec.baseDomainNameSuffix`          | Domain name suffix used for generating full Pod hostnames in the Replica Set. |
| `.spec.tls.secretName`                | Name of the Kubernetes secret that contains the TLS certificate.             |
| `spec.tls.certificate.tls.ca.crt` | base64 encoded `ca.pem` file |
| `.spec.tls.certificate.tls.ca.key`|base64 encoded `ca-key.pem` file content.|

## Allowed TLS configuration options

When creating the Custom Resource (CR), provide one of the following combinations:

- `.spec.baseDomainNameSuffix` and `.spec.tls.secretName` only – Use this option if a secret with TLS CA certificate already exists and should be reused.

- `.spec.baseDomainNameSuffix`,`.spec.tls.secretName` and `.spec.tls.certificate.*` – In this case, the values from `.spec.tls.certificate.*` will be copied into a newly created Secret named `.spec.tls.secretName.` 

  If such secret already exists, it will be updated with values from `.spec.tls.certificate.* `.

    Afterwards, the `.spec.tls.certificate.*` values will be removed for security reasons.

!!! note
    Percona Everest does not validate whether the provided TLS certificate matches the specified base domain name.

## Split-Horizon DNS configuration handling in Percona Everest Operator

### SplitHorizonDNSConfig CR handling

Once a new `SplitHorizonDNSConfig` object is created, the Percona Everest operator will handle it as follows:
{.power-number}

1. Validation
    - Validate that the field `.spec.baseDomainNameSuffix' contains a valid domain name.
    - Verify that `.spec.tls.secretName` is provided. This can either reference an existing secret or will be used to create a new one.

2. TLS secret management

    - If .spec.tls.certificate.* is not provided, ensure a secret with name `.spec.tls.secretName` exists in the same namespace and is of type TLS.

    - If `.spec.tls.certificate.*` is provided, create a secret named `.spec.tls.secretName` if it does not already exist, and copy the certificate values from `.spec.tls.certificate.*` into that secret.


### DatabaseCluster CR extension

The `DatabaseCluster` CR is extended with an optional field `.spec.engineFeatures.psmdb.split-horizon-dns`.

The default value is **nil**, indicating that the Split-Horizon DNS feature will not be applied to the Percona Server for MongoDB cluster.


??? example "Example"
    ```yaml
    apiVersion: everest.percona.com/v1alpha1
    kind: DatabaseCluster
    metadata:
        name: psmdb-4d5
        namespace: ns-1
    spec:
        engine:
            type: psmdb
            userSecretsName: everest-secrets-psmdb-4d5
        engineFeatures:
            psmdb:
                splitHorizonDnsConfigName: mycompany.com
    ```

### Handling splitHorizonDnsConfigName in DatabaseCluster

When a DatabaseCluster object includes the optional field `spec.engineFeatures.psmdb.splitHorizonDnsConfigName`, the Percona Everest Operator performs the following steps:
{.power-number}

1. Fetch the `SplitHorizonDNSConfig` CR whose name matches `DatabaseCluster.spec.engineFeatures.psmdb.splitHorizonDnsConfigName`.

2. Extract `.spec.baseDomainNameSuffix` from the `SplitHorizonDNSConfig` CR and generate additional domain names for each pod in the `ReplicaSet` using template:

    ```sh
    <ReplicaSet number>-<pod number>-<db cluster name>-<namespace>.<base domain>
    ```

    ??? example "Examples"
        ```sh
        rs0-0-psmdb-4d5-ns-1.mycompany.com
        ```
        ```sh
        rs0-1-psmdb-4d5-ns-1.mycompany.com
        ```

3. Set the TLS secret for the Percona Server for MongoDB cluster:

    ```yaml
    .spec.secrets.ssl = SplitHorizonDNSConfig.spec.tls.secretName
    ```

4. Set into upstream Percona Server for MongoDB CR:

  ```sh
  apiVersion: psmdb.percona.com/v1
  kind: PerconaServerMongoDB
  metadata:
    name: mongodb-8nr
    namespace: everest
  spec:
    secrets:
      ssl: mongodb-8nr-sh-cert // <- new secret that contains generated TLS certificate
      sslInternal: mongodb-8nr-ssl-internal
      ...
    replsets:
      - name: rs0
      size: 3
      splitHorizons:
        mongodb-8nr-rs0-0:
          external: mongodb-8nr-rs0-0-everest.mycompany.com // <-   generated split-horizon domain for Pod 0 in ReplicaSet 0
        mongodb-8nr-rs0-1:
          external: mongodb-8nr-rs0-1-everest.mycompany.com <- generated split-horizon domain for Pod 1 in ReplicaSet 0
        mongodb-8nr-rs0-2:
          external: mongodb-8nr-rs0-2-everest.mycompany.com <- generated split-horizon domain for Pod 2 in ReplicaSet 0
  ```  

### Handling updates to SplitHorizonDNSConfig

The Percona Everest Operator watches for changes in `SplitHorizonDNSConfig` and:
{.power-number}

1. Fetches all `DatabaseCluster` objects in the same namespace where:
                               `DatabaseCluster.spec.engineFeatures.psmdb.splitHorizonDnsConfigName == SplitHorizonDNSConfig.metadata.name`

2. Applies updated values automatically to all associated Percona Server for MongoDB cluster resources.



