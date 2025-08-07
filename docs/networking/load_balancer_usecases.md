# Load balancer use cases


## Create load balancer configs

Percona Everest administrators create load balancer configurations suitable for their infrastructure in advance, allowing all Percona Everest users to utilize them later without having to define rules for each database cluster creation.

**Key characteristics:**

-  Load balancer config has a globally unique name across the entire Percona Everest deployment.

- It can be applied to the Proxy component of any supported database Engine.

- It is not associated with a specific namespace, so the same configuration to be applied across all namespaces managed by Percona Everest.

- It consists of a set of key-value pairs representing annotations that need to be applied to the appropriate load balancer.


After all required values are configured, the Percona Everest administrator saves the configuration to make it available for use throughout the platform.


## Restrict access to load balancer configs with Role-based access control (RBAC) policies

The Percona Everest administrator can limit access to specific load balancer configs, including the ability to apply or modify them. This is achieved using Percona Everest’s RBAC (Role-Based Access Control) system.

**Key characteristics:**

- RBAC policies apply to the entire load balancer configuration, including all key-value pairs in the template.

- It is not possible to assign access control to individual key-value pairs within a specific load balancer configuration.

### Restrict usage of load balancer configs

The Percona Everest administrator can manage (**create/edit/read/delete**) load balancer config for specific Percona Everest users only. The rest of the users can only **read** load balancer config content and can apply existing configs when provisioning database clusters, but cannot modify them.

To achieve this, the following RBAC policy is defined:

```sh
p, alice, load-balancer-configs, *, *
p, role:team-dev, load-balancer-configs, read, *

```

## Apply load balancer config to a new database cluster

While creating a new database cluster, a user can expose it using the load balancer and apply the load balancer configuration to it.

Percona Everest UI provides an additional **Load Balancer Configuration** panel on the **Advanced Configuration** step of the DB cluster creation wizard. This panel appears when the selected **Exposure method** is load Balancer. 

In the **Load Balancer Configuration** section, the user can choose the specific load balancer configuration they wish to apply. 

- **If RBAC is disabled:** The system will display all existing load balancer configurations.

- **If RBAC is enabled:** The system will only show the load balancer configurations that the user has permission to access (with **read** permissions).


!!! note
    Only one load balancer config can be applied to a load balancer at any given time.


## Apply and manage load balancer config to an existing database cluster

Users may want to change the Load Balancer Config applied to an existing Load Balancer. This can be done by clicking **Edit** in the **Advanced Configuration** section of the DB cluster **Overview** page.

Within the Load Balancer Configuration section, users can select a different config:

- If RBAC is disabled: All existing Load Balancer Configs are visible.
- If RBAC is enabled: Only the Load Balancer Configs the user has read access to will be displayed.

After selecting a new Load Balancer Config, the user can save the changes:

- If a new config is selected, the system applies it to the Load Balancer.

    !!! note
        This change does not trigger a database restart.

- If the user cancels the changes, no updates are applied.







