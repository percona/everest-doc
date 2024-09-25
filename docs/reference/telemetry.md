# Telemetry on Percona Everest

In creating Percona Everest, we leveraged our years of experience in open-source database development, and collaborated closely with the Percona community through interviews to ensure our new product will meet your needs.

Product telemetry fills-in the gaps in our understanding of how you are actually using Everest, to help us build the best-in-class cloud-native database platform for the open-source community.

Participation in this **anonymous** program is optional, and you can opt-out if you prefer not to share any information. Read our [privacy statement](https://www.percona.com/privacy-policy#h.e34c40q8sb1a) to learn more.

## What information is collected

Currently, Everest only collects information about the database technology used (MySQL, Mongo, PostgreSQL). Future releases will cover additional metrics.

Rest assured, access to the raw data is rigorously controlled, and individual user identification within the dataset is impossible. The data is thoroughly anonymized and cannot be traced back to any specific user.

## Disable telemetry

Starting with Everest 0.4.1, telemetry is enabled by default. If you don't want to send usage data to Percona, you can set the **DISABLE_TELEMETRY** environment variable to **TRUE**:
{.power-number}

1. To disable telemetry run:

    ```sh
kubectl -n everest-system patch deployment percona-everest --type strategic -p 'spec:
  strategy:
    rollingUpdate:
      maxSurge: 0
      maxUnavailable: 1
    type: RollingUpdate
  template:
    spec:
      containers:
        - name: everest
          env:
          - name: DISABLE_TELEMETRY
            value: "true"'
    ```

2. Run the Everest upgrade command so the underlying operators apply the new setting as well:
   
    ```sh
    ./everestctl upgrade
    ```

## Enable telemetry

If you want to enable telemetry again:
{.power-number}

1. Run the following:

    ```sh
    kubectl -n everest-system patch deployment percona-everest --type strategic -p 'spec:
    strategy:
        rollingUpdate:
        maxSurge: 0
        maxUnavailable: 1
        type: RollingUpdate
    template:
        spec:
        affinity:
            podAntiAffinity: {}
        containers:
            - name: everest
            env:
                - name: DISABLE_TELEMETRY
                value: "false"'
    ```

2. Run the Everest provisioning again to make sure that the underlying operators apply the new setting as well:
    
    ```sh
    ./everestctl upgrade
    ```
