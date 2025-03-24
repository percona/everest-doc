# Manual storage scaling

## Overview

You can increase the capacity of your S3-compatible storage through manual storage scaling. This is done by either adjusting existing resources or allocating new ones. This feature gives you precise control over your storage to accommodate increasing data demands.

In the Kubernetes environment used by Percona Everest, storage is managed using Persistent Volumes (PVs) and Persistent Volume Claims (PVCs). Manual scaling involves adjusting the underlying PV resources to meet the demands specified in the PVC.

For detailed information on PVs and PVCs, refer to the official [Kubernetes documentation](https://kubernetes.io/docs/concepts/storage/persistent-volumes/).

## Current limitation and enhancement

While you can adjust CPU and memory allocations for your databases, the disk size is fixed after the initial database provisioning. This enhancement allows you to manage expanding database workloads effectively while maintaining system stability and robust data security.

## Prerequisites

When scaling storage manually for a database managed by Percona Everest in a Kubernetes cluster, ensure that the StorageClass used by the database's PersistentVolumeClaim (PVC) supports volume expansion.

!!! note
    In Kubernetes, manual disk scaling only works if the associated `StorageClass` has the following setting:

    ```sh
    allowVolumeExpansion: true
    ```

To verify if your storage class allows for volume expansion, execute the following command:

```sh
kubectl get storageclass
kubectl describe storageclass <your-storage-class>
```

??? example "Expected output"
    ```
        apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
        name: expandable-storage
        provisioner: kubernetes.io/aws-ebs
        allowVolumeExpansion: true
    ```

## Editing storage capacity

To modify storage capacity, follow these steps:
{.power-number}

1. From the **Overview** page, navigate to the **Resources** panel.

2. Click **Edit**. The **Edit Topology** pop-up will be displayed.

3. In the **Resource size per node** section, find the **DISK** field. Modify the disk value (in Gi ) to the desired capacity.

4. Click **Save**.







