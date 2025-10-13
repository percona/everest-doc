# NodePort exposure for database access


## Overview

[NodePort   :octicons-link-external-16:](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport){:target="_blank"} is a Kubernetes service type that enables access to a database using `NODE_IP:NODE_PORT`. With NodePort, each node in the cluster opens a port that redirects incoming requests to the database.


!!! info "Important"
    - NodePort is not recommended for production environments due to the following reasons:
        - It does **not** support **High Availability**. If a node goes down, its `NODE_IP` becomes unavailable.
        - It provides unlimited access to the service. The service is exposed to all sources that can reach the node, which may pose security risks.
    - NodePort is suitable for development, testing, or custom environments where advanced service routing is not configured.



## Why use NodePort?

Here are the benefits of using NodePort:

- NodePort is straightforward to configure and requires minimal setup.

- It is useful for quick testing or exposing services without a full Ingress or LoadBalancer setup.

- Allows clients to access a service directly using `NODE_IP:NODE_PORT`.

- It is useful for development, debugging, or custom environments where service routing is limited.


## Retrieving NODE_IP

Run the following command to identify the `NodePort` assigned to your database service:

```sh
kubectl get node -o wide
```

- Use the `EXTERNAL-IP` if accessing the database from outside the cluster (e.g., outside the VPC).
- Use the `INTERNAL-IP` if accessing from within the cluster (inside the VPC). However, if you are accessing from within the cluster, you can access the database similarly to the ClusterIP method (using the service name and the internal port).


!!! note
    Some Kubernetes providers may require additional firewall rules to allow external NodePort access. Check your provider’s documentation.


## Retrieving NODE_PORT

Run the following command to identify the NodePort assigned to your database service:

```sh
kubectl get svc -n DB_NAMESPACE | grep '^DB_NAME' | grep NodePort | awk '{print $5}' | grep -oE '[0-9]+/TCP'`
```

Replace:

- `DB_NAME` with the name of your database service
- `DB_NAMESPACE` with the namespace of your database


??? example "Example"
    ```sh
    kubectl get svc -n ns1 | grep '^mongodb-123' | grep NodePort | awk '{print $5}' | grep -oE '[0-9]+/TCP'
    ```

    **Output**
    `30179/TCP`

    This indicates that the database can be accessed on port **30179** on any node listed in the [Node IP section](../networking/nodeport_support.md#retrieving-node_ip).

