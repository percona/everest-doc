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
| `spec.tls.certificate.ca.crt` | base64 encoded `ca.pem` file |
| `.spec.tls.certificate.ca.key`|base64 encoded `ca-key.pem` file content.|

## Allowed TLS configuration options

When creating the Custom Resource (CR), provide one of the following combinations:

- `.spec.baseDomainNameSuffix` and `.spec.tls.secretName` only – Use this option if a secret with TLS CA certificate already exists and should be reused.

- `.spec.baseDomainNameSuffix`,`.spec.tls.secretName` and `.spec.tls.certificate.*` – In this case, the values from `.spec.tls.certificate.*` will be copied into a newly created Secret named `.spec.tls.secretName.` 

  If such secret already exists, it will be updated with values from `.spec.tls.certificate.*`.

  Afterwards, the `.spec.tls.certificate.*` values will be removed for security reasons.

!!! note
    Percona Everest does not validate whether the provided TLS certificate matches the specified base domain name.





