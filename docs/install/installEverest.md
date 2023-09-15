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
3. Download the kubeconfig file from the Kubernetes cluster that you want to use with Everest.  By default, Everest uses the file available under *~/.kube/config.*

## Get started

To install and provision Percona Everest:

1. Use the following commands to spin up the backend and frontend:

 - `wget https://raw.githubusercontent.com/percona/percona-everest-backend/v0.3.0/quickstart.yml`

- `docker-compose -f quickstart.yml up -d`
2. Download the latest release of the [everestctl](https://github.com/percona/percona-everest-cli/releases) command to provision Percona Everest.
3. Rename the downloaded file as follows: `mv everestctl-darwin-amd64 everestctl`
4. Modify the file permissions: `chmod +x everestctl`
5. Rename your kubeconfig file to **config.yaml**, and place it in your present working directory.  (Skip this step if you already have your kubeconfig file in **./kube/config/**).

6. Run the following command  from the directory where config.yaml is located. This will install all required operators in headless mode:

```sh
./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --monitoring.enable=false --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --skip-wizard -k config.yaml
```

Alternatively, use the installation wizard:

```sh 
✗ ./everestctl install operators
? Everest URL http://127.0.0.1:8080
? Choose your Kubernetes Cluster name k3d-everest-dev
? Do you want to enable monitoring? No
? Do you want to enable backups? No
? What operators do you want to install? MySQL, MongoDB, PostgreSQL
```
7. Go to [http://127.0.0.1:8080](http://127.0.0.1:8080) to open the Everest UI and create your first database cluster. 