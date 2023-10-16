# Create Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS)

## Prerequisites

Before creating an EKS cluster, make sure to:
{.power-number}

1. [Install the AWS Command Line Interface (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html){:target="_blank"} for interacting with the different parts of AWS.

2. [Install eksctl](https://github.com/weaveworks/eksctl#installation){:target="_blank"} to simplify cluster creation on EKS.

3. [Install kubectl](https://kubernetes.io/docs/tasks/tools/){:target="_blank"} to manage and deploy applications on Kubernetes.

4. [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html){:target="_blank"} with your credentials.

## Create the EKS cluster

!!! caution alert alert-warning "Important"
    To run a 3-node pxc cluster, you will need at least a 3-node cluster with 2vCPUs available. The database will not be created if you attempt to create a database cluster in a Kubernetes cluster without sufficient resources.


To create the EKS cluster, do the following steps:
{.power-number}

1. Settled the required cluster details:

    * name of your EKS cluster
    * AWS region in which you wish to deploy your cluster
    * the number of nodes you would like to have
    * the desired ratio between [on-demand](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html){:target="_blank"}
        and [spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html){:target="_blank"} instances in the total number of nodes.

    !!! note

        [spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html){:target="_blank"} instances are not recommended for production environment but may be useful for testing purposes.

2. Create your EKS cluster [following the official cluster creation instructions](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html){:target="_blank"}.
3. [Install the Amazon EBS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html){:target="_blank"} on your cluster. See the [official documentation](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html){:target="_blank"} on adding it as an Amazon EKS add-on.

