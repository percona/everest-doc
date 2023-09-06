# Quickstart guide

Important! 
!!! caution alert alert-warning "Important"
    Although Percona Everest helps install all the required operators and packages to run properly, it does not assist with spinning up a Kubernetes cluster.

This procedure simplifies the deployment of Everest instances, reducing the installation flow to running a single command.

## Prerequisites
To spin up an Everest instance, you first need to have a Kubernetes cluster that is publicly accessible.

We recommend setting one up on the Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), as it may be difficult to spin one up on local Kubernetes installations (minikube, kind, k3d, or similar products).

**Spin up a Percona Everest instance**
To spin up a Percona Everest instance, run the following command: 
`curl -sfL "https://raw.githubusercontent.com/percona/percona-everest-cli/v0.2.0/install.sh" | bash`

!!! note alert alert-primary ""
    Everest will search for the kubeconfig file in the ~/.kube/config pathdirectory. If your file is located elsewhere, add the KUBECONFIG environment variable before running the install.sh script: `curl -sfL "https://raw.githubusercontent.com/percona/percona-everest-cli/v0.2.0/install.sh" | KUBECONFIG=<path/to/config/file> bash`