# Configure monitoring

Percona Everest integrates with Percona Monitoring and Management (PMM) to monitor your database clusters.

!!! info "Important"
    To enable monitoring, you must first create a `MonitoringConfig` that defines your PMM connection and credentials.

Here are the steps to configure monitoring for your database clusters:
{.power-number}

1. Store your PMM username and API key in a Kubernetes Secret. Encode both values in Base64 before adding them to the manifest:

    ```sh
    apiVersion: v1
    kind: Secret
    metadata:
        name: pmm-credentials
    type: Opaque
    data:
          username: <YOUR BASE64 ENCODED USERNAME>
          apiKey: <YOUR BASE64 ENCODED API KEY>
    ```

2. Define a `MonitoringConfig`. 

    Use the secret in a `MonitoringConfig` CRD:

    ```sh
    apiVersion: everest.percona.com/v1alpha1
    kind: MonitoringConfig
    metadata:
        name: my-monitoring-config
    spec:
        type: pmm
        credentialsSecretName: pmm-credentials
    pmm:
        url: "https://pmm.example.com"
        image: "percona/pmm-client:2.41.0"  # Optional: specify PMM client version
    verifyTLS: true  # Optional: verify TLS certificates
    ```










