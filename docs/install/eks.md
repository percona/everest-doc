# Install Percona Everest on Amazon Elastic Kubernetes Service (EKS)

This guide shows you how to deploy Percona Operator for MongoDB on Amazon
Elastic Kubernetes Service (EKS). The document assumes some experience with the
platform. For more information on the EKS, see the [Amazon EKS official documentation](https://aws.amazon.com/eks/).

## Prerequisites

Before creating an EKS cluster, make sure to:

1. [Install the AWS Command Line Interface (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) for interacting with the different parts of AWS.

2. [Install eksctl](https://github.com/weaveworks/eksctl#installation) to simplify cluster creation on EKS.

3. [Install kubectl](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) to manage and deploy applications on Kubernetes.

4. [Configure AWS CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/) with your credentials.

## Create the EKS cluster

1. Settled the required cluster details:

    * name of your EKS cluster
    * AWS region in which you wish to deploy your cluster
    * the number of nodes you would like to have
    * the desired ratio between [on-demand](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html)
        and [spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html) instances in the total number of nodes.

    !!! note

        [spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html) instances are not recommended for production environment but may be useful for testing purposes.

2. Create your EKS cluster [following the official cluster creation instructions](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html).
3. [Install the Amazon EBS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html) on your cluster. See the [official documentation](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html) on adding it as an Amazon EKS add-on.
