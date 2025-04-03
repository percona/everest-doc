# Install Percona Everest on Openshift

This section explains how to install Percona Everest using Openshift.


!!! info "Important"
    We’re still refining OpenShift support for Percona Everest, which means some things might not work as intended. If you encounter any issues, help us improve by creating a new issue [here](https://github.com/percona/everest/issues/new){:target="_blank"}.

## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    [Google Container Registry (GCR) is scheduled to be deprecated](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"} and will officially shut down on **May 20, 2025**. All versions of Percona Everest prior to 1.4.0 depend on images hosted on GCR, meaning that downloading those images will fail after the shutdown date.

**Action required**

We strongly recommend upgrading to Percona Everest version 1.4.0 as soon as possible.

## Install Percona Everest

1. Here are the steps to install Percona Everest with OpenShift compatibility enabled:
{.power-number}

    ```sh
    helm install everest-core percona/everest \
        --namespace everest-system \
        --create-namespace \
        --set compatibility.openshift=true \
        --set dbNamespace.compatibility.openshift=true \
        --set kube-state-metrics.securityContext.enabled=false \
        --set kube-state-metrics.rbac.create=false
    ```

2. (Optional) Update RBAC for kube-state-metrics:

    If you're running a chart version prior to 1.5.0, it's essential to manually create a `ClusterRoleBinding` for `kube-state-metrics` to ensure proper functionality. Use the following YAML:

    ```sh
    cat <<EOF | kubectl apply -f -
    apiVersion: rbac.authorization.k8s.io/v1
    kind: ClusterRoleBinding
    metadata:
        name: ksm-openshift-cluster-role-binding
    roleRef:
        kind: "ClusterRole"
        apiGroup: "rbac.authorization.k8s.io"
        name: kube-state-metrics
    subjects:
        - kind: "ServiceAccount"
        name: kube-state-metrics
        namespace: everest-monitoring
    EOF
    ```

    !!! note 
        Starting from version 1.5.0 and onwards, a `ClusterRoleBinding` is created automatically when you enable the setting `compatibility.openshift=true`.


3. (Optional) Deploy additional database namespaces:

    If you need to add database namespaces, run the following command with OpenShift compatibility enabled:

    ```sh
    helm install everest \
        percona/everest-db-namespace \
        --create-namespace \
        --namespace everest \
        --set compatibility.openshift=true
    ```

    For detailed instructions, refer to the [installation section](install_everest_helm_charts.md) and adjust the installation parameters according to the values specified here.