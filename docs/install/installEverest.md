# Install Everest

## Setup

Percona Everest has two primary components:

- [Percona CLI](https://github.com/percona/percona-everest-cli), which connects Percona Everest to your Kubernetes cluster.
- Everest application (UI for simplicity), which you can spin up using the instructions below.

### Supported operators

- Percona Operator for MySQL Based on Percona XtraDB Cluster (PXC) 1.13.0
- Percona Operator for MongoDB (PSMDB) 1.14.0
- Percona Operator for PostgreSQL (PG) 2.2.0

## Before you start

Percona Everest assists with installing all the necessary operators and required packages, but does not currently help with spinning up a Kubernetes cluster.
Therefore, before installing Everest, ensure that you have a publicly accessible Kubernetes cluster.

We recommend [setting one up on the Amazon Elastic Kubernetes Service (EKS)](../install/eks.md) or on [Google Kubernetes Engine (GKE)](../install/GKE-k8s-cluster), as it may be difficult to currently spin one up on local Kubernetes installations (minikube, kind, k3d, or similar products).

## Prerequisites

Before getting started with Percona Everest, we recommend that you:

1. Install [Docker](https://docs.docker.com/engine/install/) and its compose plugin (included by default in the aforementioned docker engine installation instructions).
2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for EKS or the [gcloud CLI](https://cloud.google.com/sdk/docs/install) for GKE.
3. Verify that you have access to the Kubernetes cluster that you want to use with Everest. By default, Everest uses the kubeconfig file available under *~/.kube/config*. Run the following command:
    `kubectl get nodes`

    ??? example "Expected output"
        ```
            NAME                                       STATUS   ROLES    AGE   VERSION
             gke-<name>-default-pool-75d48bfc-bx8g   Ready    <none>   11h   v1.26.7-gke.500
             gke-<name>-default-pool-75d48bfc-c2df   Ready    <none>   11h   v1.26.7-gke.500
             gke-<name>-default-pool-75d48bfc-zl7k   Ready    <none>   11h   v1.26.7-gke.500
    ```

## Get started

To install and provision Percona Everest:

1. Download the Docker compose file:
```
curl https://raw.githubusercontent.com/percona/percona-everest-backend/release-0.3.0/deploy/quickstart-compose.yml -o quickstart-compose.yml
```
2. Initialize the Everest container and its internal PostgreSQL database by executing one of the following commands, each offering distinct access configurations:

    - to limit access to the localhost interface (default):
    ```sh
    docker compose -f quickstart-compose.yml up -d
    ```
    - to expose Everest though a specific interface, use that interface's IP address: 
    ```sh
    EVEREST_BIND_ADDR=<ip address>; docker compose -f quickstart-compose.yml up -d
    ```
    - to allow access from any interface on the host machine (not recommended):
    ```sh
    EVEREST_BIND_ADDR=0.0.0.0; docker compose -f quickstart-compose.yml up -d
    ```
  
3. (Optional) Verify if the services started correctly:
```sh 
docker compose -f quickstart-compose.yml ps --services --filter 'status=running'
```

    ??? example "Expected output"
        ```
            everest
            pg
        ```

4. Download the latest release of the [everestctl](https://github.com/percona/percona-everest-cli/releases) command to provision Percona Everest.
5. Rename the downloaded file using the following command and replacing the placeholder `everestctl-darwin-amd64` to match the file downloaded in the previous step: 
    ```sh
    mv everestctl-darwin-amd64 everestctl
    ```
6. Modify the file permissions: 
    ```sh
    chmod +x everestctl
    ```
7. From the installation wizard, provision and register the Kubernetes cluster in Everest using the following command. Everest will search for the kubeconfig file in the `~/.kube/config` path. If your file is located elsewhere, add the `KUBECONFIG` environment variable before running the command.

    !!! note alert alert-primary "Note"
          - If you don't enable monitoring during this provisioning step then you won't be able to enable it from the UI later. Make sure to fill in the monitoring details in the wizard.
          - If you are using a PMM server instance with a self-signed certificate you cannot use HTTPS in the PMM URL endpoint.

    ```sh
    KUBECONFIG=~/.kube/config; ./everestctl install operators
    ```
This will install all needed components in a namespace called `percona-everest`.
       

    ??? example "Expected output"
            
            ? Everest URL http://127.0.0.1:8080
            ? Choose your Kubernetes Cluster name k3d-dbaas-tilt
            ? Do you want to enable monitoring? Yes
            ? PMM URL Endpoint http://127.0.0.1
            ? Username admin
            ? Password *****
            ? Name for the new monitoring instance my-pmm
            ? Do you want to enable backups? No
            ? What operators do you want to install? MySQL, MongoDB, PostgreSQL
            

    Alternatively, you can provision and register the Kubernetes cluster by running the installation in headless mode:
        
    ```
    KUBECONFIG=~/.kube/config; ./everestctl install operators --backup.enable=false --everest.endpoint=http://127.0.0.1:8080 --operator.mongodb=true --operator.postgresql=true --operator.xtradb-cluster=true --monitoring.enable=true --monitoring.type=pmm --monitoring.new-instance-name=my-pmm --monitoring.pmm.endpoint=http://127.0.0.1 --monitoring.pmm.username=admin --monitoring.pmm.password=admin  --skip-wizard
    ```

1. Go to [http://127.0.0.1:8080](http://127.0.0.1:8080) to open the Everest UI and create your first database cluster. 