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












