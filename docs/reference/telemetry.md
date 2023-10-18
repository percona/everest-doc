# Telemetry on Percona Everest

In creating Percona Everest, we leveraged our years of experience in open-source database development, and collaborated closely with the Percona community through interviews to ensure our new product will meet user needs.

Product telemetry fill-in the gaps in our understanding of how users are actually using Everest, to help us build the best-in-class DBaaS software for the open-source community.

Participation in this **anonymous program** is optional, and you can opt-out if prefer not to share any information.

Read our [privacy statement](https://www.percona.com/privacy-policy#h.e34c40q8sb1a) and [telemetry documentation](../reference/telemetry.md) to learn more.

## What information is collected

Currently, Everest only collects information about the database technology used (MySQL, Mongo, PostgreSQL). Future releases will cover additional metrics.

Rest assured, access to the raw data is rigorously controlled, and individual user identification within the dataset is impossible. The data is thoroughly anonymized and cannot be traced back to any specific user.

## Disable telemetry

Starting with Everest 0.4.0, telemetry is enabled by default. If you don't want to send usage data to Percona, you can set the **DISABLE_TELEMETRY** environment variable to TRUE:

1. When [installing Everest using the quick install script](../quickstart-guide/quick-install.md), set the `DISABLE_TELEMETRY` env variable to **True**: 
   `export DISABLE_TELEMETRY=true`.
2. Restart the Everest backend: 
    `docker compose -f quickstart.yml restart everest`.
3. Run the Everest provisioning again to make sure that the underlying operators apply the new setting as well:
    ```./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --monitoring.enable=false --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard```

## Enable telemetry again

1. Set the DISABLE_TELEMETRY environment variable to false: 
 `export DISABLE_TELEMETRY=false`
2. Restart the Everest backend: 
    `docker compose -f quickstart.yml restart everest`.
3. Run the Everest provisioning again to make sure that the underlying operators apply the new setting as well:
    ```./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --monitoring.enable=false --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard```