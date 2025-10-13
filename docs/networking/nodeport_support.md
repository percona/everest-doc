# NodePort exposure for database access


## Overview

[NodePort   :octicons-link-external-16:](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport){:target="_blank"} is a Kubernetes service type that enables access to a database using `NODE_IP:NODE_PORT`. With NodePort, each node in the cluster opens a port that redirects incoming requests to the database.


!!! info "Important"
    - NodePort is not recommended for production environments due to the following reasons:
        - It does **not** support **High Availability**. If a node goes down, its `NODE_IP` becomes unavailable.
        - It provides unlimited access to the service. The service is exposed to all sources that can reach the node, which may pose security risks.
    - NodePort is suitable for development, testing, or custom environments where advanced service routing is not configured.


