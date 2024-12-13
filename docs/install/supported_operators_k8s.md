# Supported operators and K8s clusters

Percona Everest provides support for various operators and Kubernetes clusters. The following is a list of the specific operators and Kubernetes clusters that are compatible with Percona Everest:

## Operators

* Percona Operator for MySQL Based on Percona XtraDB Cluster (PXC) 1.14.0, 1.15.0
* Percona Operator for MongoDB (PSMDB) 1.15.0
* Percona Operator for PostgreSQL (PG) 2.3.1, 2.4.1

## k8s clusters

Percona Everest works on most of the cloud K8s and on most of the on-prem vanilla K8s.

However, not all the many combinations of K8s distributions and K8s versions might be fully tested and certified. Refer to the matrix below and [reach out to us](SetupPrereqs.md#get-expert-help) should you have any questions.

| Platform              | Kubernetes Version | State                                   |
|:----------------------|:-------------------|:----------------------------------------|
| Google GKE            | 1.28 - 1.30        | Fully tested and certified                |
| Amazon EKS            | 1.28 - 1.30        | Fully tested and certified                |
| Azure AKS             | -                  | Works but not fully certified yet       |
| DigitalOcean          | -                  | Works but not fully certified yet       |
| Vanilla K8s (kubeadm) | -                  | Works but not fully certified yet       |
| OpenShift             | -                  | Coming soon                             |
| Other cloud K8s       | -                  | Should work but not fully certified yet |

!!! note
    Air-gapped environments (i.e. environments physically isolated from unsecured networks such as the public Internet) are not currently supported. Their support is coming soon.
