# Migrate from PostgreSQL 12

!!! info "Important"
    Percona Everest 1.6.0 has officially discontinued support for PostgreSQL 12. To ensure compatibility, security, and access to new features, it is highly recommended to migrate to PostgreSQL 13 or later.

## Preparation before migration

Before migrating from PostgreSQL 12, it's important to prepare thoroughly to ensure a smooth transition. Here are the key steps:
{.power-number}

1. **Backup your data** - Create a complete backup of your data before upgrading.

2. **Check Compatibility** - Verify that your configurations are compatible with the new PostgreSQL version.

3. **Install the new version** – Download and install the target PostgreSQL release.


## Choose a migration option

When upgrading from PostgreSQL 12, it is essential to choose a migration method that suits your environment. For a smooth transition, consider the following factors during migration:

- Data size

- Downtime tolerance

- Infrastructure (Kubernetes, cloud, on-premise)

PostgreSQL offers several migration options. Each method has its own benefits and trade-offs in terms of speed, complexity, and risk.

Review PostgreSQL documentation to select the best option for your environment.

💡 Need assistance? Connect with the Percona Everest community or consult a Percona Expert. connect with [Percona Everest community](https://forums.percona.com/t/welcome-to-perconas-community-forum/7){:target="_blank"}! Alternatively, you can always [Talk to a Percona Expert](../get-help.md#percona-experts).

### Logical Dump and Restore vs. Logical Replication

Two commonly used approaches to migrating a PostgreSQL database are Logical Dump and Restore and Logical Replication. Both methods help move data from one instance to another, but they have different purposes and distinct advantages.

| **Feature**              | **Logical Dump and Restore**               | **Logical Replication**               |
|--------------------------|-------------------------------------------|--------------------------------------|
| **Setup complexity**      | Simple and portable                      | More complex, involves replication slots |
| **Best suited for**           | One-time migrations, backups, and moving datasets across versions | Continuous data synchronization |
| **Downtime Impact**      | Requires application downtime during migration | Minimal downtime |
| **Primary Keys requirement** | No primary keys required; exports full table data regardless of constraints | Requires primary keys (or unique indexes) on tables|
| **Schema compatibility**  | Allows schema modifications before restoration; supports cross-version migration | Requires schema compatibility between source and target databases |
| **Performance**          | Can be slow for large datasets due to full export/import | More efficient for continuous updates, but may add replication overhead |

### Logical Dump and Restore

This option is recommended for **smaller databases** and **one-time migrations**.
{.power-number}

1. Use [pg_dump/pg_dumpall](https://www.postgresql.org/docs/current/app-pgdump.html) to **export** your data from PostgreSQL 12.

2. Use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html) or [psql](https://www.postgresql.org/docs/current/app-psql.html) to import data into a new cluster.

For comprehensive information, dive deep into the [PostgreSQL documentation on pg_dump](https://www.postgresql.org/docs/current/backup-dump.html).

### Logical Replication

This option is recommended for **minimal downtime**.

Use [logical replication](https://www.postgresql.org/docs/current/logical-replication.html) to continuously replicate data from your PostgreSQL 12 cluster into a PostgresQLG 13+ cluster with little to no downtime.

For comprehensive information, dive deep into the [PostgreSQL documentation on logical replication](https://www.postgresql.org/docs/current/logical-replication.html).







