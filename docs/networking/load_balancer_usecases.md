# Load balancer use cases


## Create load balancer configs

Percona Everest administrators create load balancer configurations suitable for their infrastructure in advance, allowing all Percona Everest users to utilize them later without having to define rules for each database cluster creation.

**Key characteristics:**

-  Load balancer config has a globally unique name across the entire Percona Everest deployment.

- It can be applied to the Proxy component of any supported database Engine.

- It is not associated with a specific namespace, so the same configuration to be applied across all namespaces managed by Percona Everest.

- It consists of a set of key-value pairs representing annotations that need to be applied to the appropriate load balancer.


After all required values are configured, the Percona Everest administrator saves the configuration to make it available for use throughout the platform.





