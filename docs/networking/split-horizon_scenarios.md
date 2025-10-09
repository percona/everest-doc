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
| **Applicable Engine**         | Can be applied to **Percona Operator for MongoDB Engine** only. Other database engines do not support this feature.                        |
| **Namespace**                 | Kubernetes namespace that this config is applicable to. Defined by the user during config creation.                 |
| **Base domain name**          | Domain name suffix used for generating full domain names for each Pod in the Replica Set. This field is also used as the **Split-Horizon DNS config** name. |
| **TLS certificates**          | TLS certificate files for the provided base domain. See [instructions](https://docs.percona.com/percona-operator-for-mongodb/tls-manual.html#__tabbed_1_1). <br>- `cert.pem` - certificate<br>- `cert-key.pem` - certificate key<br>- `ca.pem` - certificate authority file |

Once all values are entered, Percona Everest administrator saves the configuration in the system. 



