# Load balancer scenarios

This section outlines the various scenarios around managing load balancer configurations.


## Create load balancer configuration

Percona Everest administrators can predefine load balancer configurations suitable for their infrastructure, allowing all Percona Everest users to use them later without having to define rules for each database cluster creation.

**Key characteristics:**

-  Load balancer configuration has a globally unique name across the entire Percona Everest deployment.

- It can be applied to the Proxy component of any supported database Engine.

- It is not associated with a specific namespace, so the same configuration must be applied across all namespaces managed by Percona Everest.

- It consists of a set of **key-value** pairs representing **annotations** that need to be applied to the appropriate load balancer.


After all required values are configured, the Percona Everest administrator saves the configuration to make it available for use throughout the platform.


## Restrict access to load balancer configurations with Role-based access control (RBAC) policies

For security, the Percona Everest administrator can limit access to specific load balancer configs, including the ability to apply or modify them. This is achieved using Percona Everest’s RBAC (Role-Based Access Control) system.

**Key characteristics:**

- RBAC policies apply to the entire load balancer configuration, including all key-value pairs in the template.

- It is not possible to assign access control to individual key-value pairs within a specific load balancer configuration.

### Restrict usage of load balancer configs

The Percona Everest administrator can manage (**create/edit/read/delete**) load balancer configuration for specific Percona Everest users only. The rest of the users can only **read** load balancer config content and can apply existing configs when provisioning database clusters, but cannot modify them.

To achieve this, the following RBAC policy is defined:

```sh
p, alice, load-balancer-configs, *, *
p, role:team-dev, load-balancer-configs, read, *
```

## Apply load balancer configuration to a new database cluster

!!! info "Important"
    Only one load balancer configuration can be applied to a load balancer at any given time.

While creating a new database cluster, a user can expose it using the load balancer and apply the configuration to it.

  ![!image](../images/load_balancer_config_page.png)

- **If RBAC is disabled:** The system will display all existing load balancer configurations.

- **If RBAC is enabled:** The system will only show the load balancer configurations that the user can access (with **read** permissions).

For more information, see the [Creating and managing load balancer configurations](load_balancer_config.md#create-a-load-balancer-configuration) section.


## Apply load balancer configuration to an existing database cluster

!!! info "Important"
    Only one load balancer configuration can be applied to a load balancer at any given time.

Users may want to change the load balancer configuration applied to an existing load balancer.

   ![!image](../images/new_created_load_balancer_configurations.png)

   For detailed information, see the [Manage load balancer configurations](load_balancer_config.md#manage-load-balancer-configurations) section.

Within the **load Balancer configuration** section, users can select a different config:

- If RBAC is disabled: All existing load Balancer Configs are visible.
- If RBAC is enabled: Only the load Balancer Configs the user has read access to will be displayed.

After selecting a new load Balancer config, the user can save the changes:

- If a new config is selected, the system applies it to the load balancer.

    !!! note
        This change does not trigger a database restart.

- If the user cancels the changes, no updates are applied.

## Manage load balancer configuration

As infrastructure requirements or usage patterns change, there may be a need to modify or remove existing load Balancer Configurations. Percona Everest enables administrators, as well as any users with the appropriate RBAC permissions, to update or delete load Balancer Configurations directly from the Percona Everest UI.


### Modify load balancer configuration

A Percona Everest Admin may need to adjust a load Balancer config by adding, modifying, or removing annotations.

### Delete load balancer configuration

When a load Balancer configuration is no longer needed, the Percona Everest admin can delete the load balancer configuration.


## Next steps

[Creating and managing load balancer configurations :material-arrow-right:](../networking/load_balancer_config.md){.md-button}












