# Getting started with DBaaS

!!! caution alert alert-warning "Caution"
DBaaS functionality is currently in [technical preview](../details/glossary.md#technical-preview) and is subject to change. Only AWS EKS, Minikube and CIVO clusters are supported.

The DBaaS dashboard is where you add, remove, and operate on Kubernetes and database clusters.

## Activate DBaaS

The DBaaS feature is turned off by default. To turn it on:

1. Go to <i class="uil uil-cog"></i> _Configuration_ → <i class="uil uil-setting"></i> _Settings_ → _Advanced Settings_.

2. Click the <i class="uil uil-toggle-off"></i> toggle in the _Technical preview features_ section of the page.

## Open the DBaaS dashboard

From the left menu, select <i class="uil uil-database"></i> _DBaaS_.

![!](../images/PMM_DBaaS_Kubernetes_Cluster_Panel.png)

## Kubernetes clusters

## Add a Kubernetes cluster automatically

!!! note alert alert-primary "Availability"
Automatic addition of k8s cluster in PMM is available starting with PMM 2.34.0.

In order to simplify DBaaS, k8s clusters can now be automatically added to PMM as follows:

**Prerequisites:** Helm Chart/Manifest installed

1. Use [Helm](https://github.com/helm/helm) to install PMM server on Kubernetes clusters. For more information, see [documentation](../setting-up/server/helm.md).

   ```sh
   helm install pmm --set service.type="LoadBalancer" --set image.repository=percona/pmm-server --set image.tag=2.34.0 --set secret.pmm_password=admin percona/pmm
   ```

2. Log in to PMM.

3. [Enable PMM](get-started.md#activate-dbaas) in DBaaS.

4. You should see the default k8s cluster added in DBaaS.

## Add a Kubernetes cluster

!!! caution alert alert-warning "Caution"
Ensure that you set PMM _Public Address_ under <i class="uil uil-cog"></i> _Configuration_ → <i class="uil uil-setting"></i> _Settings_ → _Advanced Settings_ before creating a Kubernetes cluster. Otherwise, PMM would **not** monitor the Kubernetes cluster along with the associated database clusters.

!!! note alert alert-primary ""
[Percona Operator for MySQL](https://docs.percona.com/percona-operator-for-mysql/pxc/index.html) and [Percona Operator for MongoDB](https://docs.percona.com/percona-operator-for-mongodb/index.html are installed as part of the Kubernetes cluster registration process. It enables you to deploy database clusters into the Kubernetes cluster.

    If a public address is set the [VictoriaMetrics Operator](https://docs.victoriametrics.com/operator/) is also installed as part of the Kubernetes cluster registration process. It lets you monitor a kubernetes cluster via PMM.

1. Click _Register new Kubernetes Cluster_.

2. Copy the value of _Kubeconfig file_ and click _Paste from clipboard_ to copy the content of the kubeconfig file in the corresponding field. The value of _Kubernetes Cluster Name_ gets auto-populated from the contents of the _kubeconfig file_.

!!! note alert alert-primary "Availability"
This feature is available starting with PMM 2.30.0.

!!! note alert alert-primary ""
This feature is available only in [secure contexts](https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts) (HTTPS) and some [supporting browsers](https://developer.mozilla.org/en-US/docs/Web/API/Clipboard#browser_compatibility).

![!](../images/PMM_DBaaS_Kubernetes_Cluster_Details.png)

!!! note alert alert-info ""
For a Kubernetes cluster, when using Amazon Elastic Kubernetes Service (EKS) and the _kubeconfig file_ does not contain the AWS
access key ID and AWS secret access key. Select the _Using Amazon Elastic Kubernetes Service (EKS)_
checkbox and enter the access key ID and secret access key in the respective fields.
Please refer to the [AWS documentation](https://docs.aws.amazon.com/) for instructions on how to get these.

![!](../images/PMM_DBaaS_Kubernetes_Cluster_EKS.png)

3. Click _Register_.

4. A message will momentarily display telling you whether the registration was successful or not.

   ![!](../images/PMM_DBaaS_Kubernetes_Cluster_Added.png)

## Unregister a Kubernetes cluster

!!! caution alert alert-warning "Important"
You can't unregister a Kubernetes cluster if there DB clusters associated with it.

1. Click _Unregister_.

2. Confirm the action by clicking _Proceed_, or abandon by clicking _Cancel_.

## View a Kubernetes cluster's configuration

1. Find the row with the Kubernetes cluster you want to see.

2. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Show configuration_.

## Manage allowed component versions

Administrators can select allowed and default versions of components for each cluster.

1. Find the row with the Kubernetes cluster you want to manage.

2. In the _Actions_ column, open the <i class="uil uil-ellipsis-v"></i> menu and click _Manage versions_.

   ![!](../images/PMM_DBaaS_Kubernetes_Manage_Versions.png)

3. Select an _Operator_ and _Component_ from the drop-down menus.

   ![!](../images/PMM_DBaaS_Kubernetes_Manage_Components_Versions.png)

4. Activate or deactivate allowed versions, and select a default in the _Default_ menu.

5. Click _Save_.

## Kubernetes operator status

The Kubernetes Cluster tab shows the status of operators.

![!](../images/PMM_DBaaS_Kubernetes_Cluster_Operator_Status.png)

## Kubernetes operator update

When a new version of the operator is available the _Operators_ column shows a message with this information. Click the message to go to the operator release notes to find out more about the update.

![!](../images/PMM_DBaaS_Kubernetes_Cluster_Operator_Update.png)

To update the cluster:

1. Find the row with the operator you want to update.

2. Click the _Update_ button in front of the operator.

3. Confirm the action by clicking _Update_, or abandon by clicking _Cancel_.

   ![!](../images/PMM_DBaaS_Kubernetes_Cluster_Operator_Update_Confirmation.png)
