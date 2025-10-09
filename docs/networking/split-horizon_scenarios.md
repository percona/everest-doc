# Split-Horizon DNS for Percona Operator for MongoDB scenarios


## Create Split-Horizon DNS config

The Percona Everest administrator sets up a set of additional base domains and assigns TLS certificates to them in advance. This allows all Percona Everest users to access these domains later without needing to define custom additional domain names each time they create a Percona Operator for MongoDB cluster. To facilitate this, Percona Everest offers the option to create a Split-Horizon DNS configuration that defines the necessary relationships.

The following applies to Split-Horizon DNS configs:

- Each config has a unique name within the selected namespace.

- It can be applied only to the Percona Operator for MongoDB Engine only.The other database engines do not support this feature.

- Each config is associated with a specific namespace, which the user defines during creation.

**Split-Horizon DNS config parameters**

| Configuration Parameter      | Description                                                                                                         |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------|
| **Name**                      | Each **Split-Horizon DNS config** has a unique name within the selected namespace.                                   |
| **Applicable Engine**         | Can be applied to **Percona Operator for MongoDB** Engine only. Other database engines do not support this feature.                        |
| **Namespace**                 | Kubernetes namespace that this config is applicable to. Defined by the user during config creation.                 |
| **Base domain name**          | Domain name suffix used for generating full domain names for each Pod in the Replica Set. This field is also used as the **Split-Horizon DNS config** name. |
| **TLS certificates**          | TLS certificate files for the provided base domain. See [instructions](https://docs.percona.com/percona-operator-for-mongodb/tls-manual.html#__tabbed_1_1). <br>- `cert.pem` - certificate<br>- `cert-key.pem` - certificate key<br>- `ca.pem` - certificate authority file |

Once all values are entered, Percona Everest administrator saves the configuration in the system.


## Protect Split-Horizon DNS config with RBAC

A Percona Everest administrator may want to restrict access to the Split-Horizon DNS configuration or the ability to apply a specific Split-Horizon DNS config for certain Percona Everest users. To do this, the administrator uses Percona Everest RBAC to define policies that limit access to the selected instances. These RBAC policies apply to the entire Split-Horizon DNS configuration.

### Limit access to Split-Horizon DNS config

A Percona Everest administrator may want to allow specific users (for example, Alice) to fully manage (create, edit, read, delete) Split-Horizon DNS configurations.
Other users can only read the Split-Horizon DNS configs and use them in database clusters, but cannot make any changes.

To implement this, the Percona Everest administrator creates an RBAC policy:

```sh
p, alice, engine-features/split-horizon-dns-config, *, */*
p, role:team-dev, engine-features/split-horizon-dns-config, read, */*
```

### Limit usage of Split-Horizon DNS config by users

A Percona Everest administrator may want to allow a specific user (for example, bob) to use a particular Split-Horizon DNS config (for example, `mycompany.com` in namespace `ns-1`).
All other users are not allowed to use this config at all. That is, they cannot see it in the system and cannot assign it to any database clusters they create or modify.

To implement this, the Percona Everest administrator creates an RBAC policy:

```sh
p, bob, engine-features/split-horizon-dns-config, read, ns-1/mycompany.com
```

## Apply Split-Horizon DNS config to new database cluster

!!! info "important"
    - Only one **Split-Horizon DNS config** can be applied to one database Cluster.
    - **Split-Horizon DNS** feature can be enabled only if **Sharding** is disabled.

When creating a new Percona Operator for MongoDB cluster, a user can choose to enable the Split-Horizon DNS feature.

The system provides an additional **Split-Horizon DNS** panel on the **Advanced Configuration** step of the database cluster creation wizard. By default, the Split-Horizon DNS feature toggle is disabled.

For detailed instructions on applying a Split-Horizon DNS config to a new database cluster, see the section [link].

### Apply Split-Horizon DNS config to an existing database cluster

!!! info "important"
    - Only one Split-Horizon DNS config can be applied to one database Cluster.
    - Enabling or disabling the Split-Horizon DNS feature **does not trigger a restart** of the Percona Operator for MongoDB  cluster.