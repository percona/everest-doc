# NodePort exposure for database access


## Overview

[NodePort   :octicons-link-external-16:](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport){:target="_blank"} is a Kubernetes service type that enables access to a database using `NODE_IP:NODE_PORT`. With NodePort, each node in the cluster opens a port that redirects incoming requests to the database.



