# Migrate from PostgreSQL 12

!!! info "Important"
    Percona Everest 1.6.0 has officially discontinued support for PostgreSQL 12. To ensure compatibility, security, and access to new features, it is highly recommended to migrate to PostgreSQL 13 or later.

## Preparation before migration

Before migrating from PostgreSQL 12, it's important to prepare thoroughly to ensure a smooth transition. Here are the key steps:
{.power-number}

1. **Backup your data** - Create a complete backup of your data before upgrading.

2. **Select a target version** - Choose the PostgreSQL version you want to migrate to (e.g., 15 or 16). Select a stable, supported release compatible with Percona Everest's infrastructure requirements.

3. **Check Compatibility** - Verify that your configurations are compatible with the new PostgreSQL version.

4. **Provision a new PostgreSQL database in Percona Everest** – Use Percona Everest to deploy a new database with the desired PostgreSQL version.


## Choose a migration option

When upgrading from PostgreSQL 12, it is essential to choose a migration method that suits your environment. For a smooth transition, consider the following factors during migration:

- Data size

- Downtime tolerance

PostgreSQL offers several migration options. Each method has its own benefits and trade-offs in terms of speed, complexity, and risk.

Review PostgreSQL documentation to select the best option for your environment.

💡 Need assistance? Connect with [Percona Everest community](https://forums.percona.com/t/welcome-to-perconas-community-forum/7){:target="_blank"}! 

Alternatively, you can always [Talk to a Percona Expert](../get-help.md#percona-experts).


??? info " :balance_scale: Expand for a detailed comparison between `logical dump and restore` vs `logical replication`"

    ### Logical dump and restore vs. Logical replication

    Two commonly used approaches to migrating a PostgreSQL database are Logical Dump and Restore and Logical Replication. Both methods help move data from one instance to another, but they have different purposes and distinct advantages.

    | **Feature**              | **Logical dump and restore**               | **Logical replication**               |
    |--------------------------|-------------------------------------------|--------------------------------------|
    | **Setup complexity**      | Simple and portable                      | More complex, involves replication slots |
    | **Best suited for**           | One-time migrations, backups, and moving datasets across versions | Continuous data synchronization |
    | **Downtime Impact**      | Requires application downtime during migration | Minimal downtime |
    | **Primary Keys requirement** | No primary keys required; exports full table data regardless of constraints | Requires primary keys (or unique indexes) on tables|
    | **Schema compatibility**  | Allows schema modifications before restoration; supports cross-version migration | Requires schema compatibility between source and target databases |
    | **Performance**          | Can be slow for large datasets due to full export/import | More efficient for continuous updates, but may add replication overhead |


=== "Logical Replication"

    This option is recommended for **minimal downtime**.

    Use [logical replication](https://www.postgresql.org/docs/current/logical-replication.html) to continuously replicate data from your PostgreSQL 12 cluster into a PostgresQLG 13+ cluster with little to no downtime.

    📚 Learn more

    - [PostgreSQL documentation on logical replication](https://www.postgresql.org/docs/current/logical-replication.html).

=== "Logical dump and restore"

    This option is recommended for **smaller databases** and **one-time migrations**.
    {.power-number}

    1. Provision a new PostgreSQl database in Percona Everest.


    2. Perform a logical dump of the old database:

        - Use [pg_dump or pg_dumpall](https://www.postgresql.org/docs/current/app-pgdump.html) to **export** your data from PostgreSQL 12.

            ??? example "Example: Source database (PostgreSQL 12)"
                Run the following command on the source database (PostgreSQL 12):

                ```sh
                pg_dump -Fc -h <old-db-host> -U <user> <db_name> -f dump_file.dump
                ```

    3. Restore data to the new Percona Everest database:

        - Use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html) or [psql](https://www.postgresql.org/docs/current/app-psql.html) to import data into the newly created Percona Everest cluster.

            ??? example "Example: Target database"
                Run the following command on the target PostgreSQL database:
            
                ```sh
                pg_restore -U your_user -h new_db_host -d new_db_name -F c dump_file.dump
                ```

    4. Verify post-migration performance:

        - Run queries to confirm [data integrity](https://www.postgresql.org/docs/current/applevel-consistency.html) and ensure compatibility.

    📚 Reference

    - [PostgreSQL pg_dump documentation](https://www.postgresql.org/docs/current/app-pgdump.html)
    - [PostgreSQL pg_restore documentation](https://www.postgresql.org/docs/current/app-pgrestore.html)









