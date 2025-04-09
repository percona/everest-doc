# Migrate away from PostgreSQL 12

!!! info "Important"
    Percona Everest 1.6.0 has officially discontinued support for PostgreSQL 12. To ensure compatibility, security, and access to new features, it is highly recommended to migrate to PostgreSQL 13 or later.

## Preparation before migration

Before migrating from PostgreSQL 12, it's important to prepare thoroughly to ensure a smooth transition. Here are the key steps:
{.power-number}

1. Backup your data - Create a complete backup of your data before upgrading.

2. Check Compatibility - Verify that your extensions and configurations are compatible with the new PostgreSQL version.

3. Install the new Version – Download and install the target PostgreSQL release.


## Migrations options

When upgrading from PostgreSQL 12—it’s important to choose a migration method that suits your environment, data size, downtime tolerance and Kubernetes or cloud-native setup. PostgreSQL offers several migration options. Each method has its own benefits and trade-offs in terms of speed, complexity, and risk.

We recommend reviewing the PostgreSQL documentation and choosing the method that best suits your environment.

If you're looking for assistance with your migration, don't hesitate to connect with [Percona Everest community](https://forums.percona.com/t/welcome-to-perconas-community-forum/7){:target="_blank"}! Alternatively, you can always [Talk to a Percona Expert](../get-help.md#percona-experts).


## Migration options

Select the migration method that best suits your environment and data size.

### Logical Dump and Restore

This option is recommended for smaller Databases.





