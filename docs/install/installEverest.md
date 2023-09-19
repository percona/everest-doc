# Install Everest

## Setup

Percona Everest has two primary components:

 - [Percona CLI](https://github.com/percona/percona-everest-cli), which connects Percona Everest to your Kubernetes cluster.
- Everest application (UI for simplicity), which you can spin up using the instructions below.

### Supported operators

- Percona Operator for MySQL Based on Percona XtraDB Cluster (PXC) 1.12
- Percona Operator for MongoDB (PSMDB) 1.14
- Percona Operator for PostgreSQL (PG) 2.2

## Before you start

Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a Kubernetes cluster.
Therefore, before installing Everest, ensure that you have a publicly accessible Kubernetes cluster.

We recommend setting one up on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), as it may be difficult to currently spin one up on local Kubernetes installations (minikube, kind, k3d, or similar products).

## Prerequisites

Before getting started with Percona Everest, we recommend that you:

1. Install [Docker](https://docs.docker.com/engine/install/) and docker-compose.
2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
3. Download the kubeconfig file from the Kubernetes cluster that you want to use with Everest. By default, Everest uses the file available under *~/.kube/config.*


## Get started

To install and provision Percona Everest:

1. Download the Docker compose file: `curl https://raw.githubusercontent.com/percona/percona-everest-backend/v0.3.0/deploy/quickstart-compose.yml -o quickstart-compose.yml`.
2. Spin up the Everest container and its internal database (PostgreSQL): `docker-compose -f quickstart-compose.yml up -d`.
3. Verify if the services started correctly: `docker compose -f quickstart-compose.yml ps --services --filter 'status=running'`. 
 ??? example "Expected output"

     everest
   pg
4. Download the latest release of the [everestctl](https://github.com/percona/percona-everest-cli/releases) command to provision Percona Everest.
5. Rename the downloaded file as follows: `mv everestctl-darwin-amd64 everestctl`.
6. Modify the file permissions: `chmod +x everestctl`.
7. Provision and register the Kubernetes cluster in Everest from the installation wizard:
   
!!! note alert alert-primary "Note"
    Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, add the `KUBECONFIG` environment variable before running the command.

    ```sh 
    ✗ KUBECONFIG=~/.kube/config; ./everestctl install operators
    ? Everest URL http://127.0.0.1:8080
    ? Choose your Kubernetes Cluster name k3d-everest-dev
    ? Do you want to enable monitoring? No
    ? Do you want to enable backups? No
    ? What operators do you want to install? MySQL, MongoDB, PostgreSQL
    ```

Alternatively, provision and register the Kubernetes cluster in Everest by running the installation in headless mode. This will create a Percona namespace called `percona-everest`.
        
    ```sh
    KUBECONFIG=~/.kube/config; ./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --monitoring.enable=false --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard
    ```

8. Go to [http://127.0.0.1:8080](http://127.0.0.1:8080) to open the Everest UI and create your first database cluster. 