# Split-Horizon DNS config Custom Resource Definition (CRD)


To configure Split-Horizon DNS, Percona Everest Operator introduces a new Custom Resource Definition (CRD):

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: split-horizon-dns-config.engine-features.everest.percona.com
  ...
spec:
  group: engine-features.everest.percona.com
  names:
    kind: SplitHorizonDNSConfig
    listKind: SplitHorizonDNSConfigList
    plural: splithorizondnsconfigs
    singular: splithorizondnsconfig
    shortNames:
    - splitdns
  scope: Namespace
  ...
```

The following CRD provides information on Split-Horizon DNS parameters necessary for configuring this feature in Percona Operator for MongoDB clusters.

```yaml
apiVersion: engine-features.everest.percona.com/v1alpha1
kind: SplitHorizonDNSConfig
metadata:
  name: mycompany.com
  namespace: ns-1
spec:
  baseDomainNameSuffix: mycompany.com
  tls:
    secretName: <secret that holds TLS certs if already exists>
    certificate:
      certFile: <base64 encoded crt file content>
      keyFile: <base64 encoded key file content>
      caCertFile: <base64 encoded ca.crt file content>
```

**Fields in `SplitHorizonDNSConfig.spec**

| Field                                | Description                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| `.spec.baseDomainNameSuffix`          | Domain name suffix used for generating full Pod hostnames in the Replica Set. |
| `.spec.tls.secretName`                | Name of the Kubernetes secret that contains the TLS certificate.             |
| `.spec.tls.certificate.certFile`      | Base64-encoded TLS certificate file (`.crt`).                                |
| `.spec.tls.certificate.keyFile`       | Base64-encoded TLS private key file.                                         |
| `.spec.tls.certificate.caCertFile`    | Base64-encoded CA certificate file (`ca.crt`).                               |

## Allowed TLS configuration options

When creating the Custom Resource (CR), provide one of the following combinations:

- `.spec.tls.secretName` only – Use this option if a TLS certificate already exists and should be re-used.

- `.spec.tls.secretName + .spec.tls.certificate.*` – In this case, the values from `.spec.tls.certificate.*` will be copied into a newly created Secret named `.spec.tls.secretName.` 

    Afterwards, the `.spec.tls.certificate.*` values will be removed for security reasons.

!!! note
    does not validate whether the provided TLS certificate matches the specified base domain name.

## Split-Horizon DNS configuration handling in Percona Everest Operator

### SplitHorizonDNSConfig CR handling

Once a new `SplitHorizonDNSConfig` object is created, the Percona Everest operator will handle it as follows:
{.power-number}

1. Validation
    - Validate that the field `.spec.baseDomainNameSuffix `contains a valid domain name.
    - Verify that `.spec.tls.secretName` is provided. This can either reference an existing secret or will be used to create a new one.

2. TLS secret management

    - If .spec.tls.certificate.* is not provided, ensure a secret with name `.spec.tls.secretName` exists in the same namespace and is of type TLS.

    - If `.spec.tls.certificate.*` is provided, create a secret with name `.spec.tls.secretName` if it does not already exist, and copy the certificate values from `.spec.tls.certificate.*` into it.











