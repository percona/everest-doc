# Create Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS)

This guide will walk you through creating a Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS). You'll learn how to configure your environment, create a cluster, and set up your nodes.

## Prerequisites

Before creating an EKS cluster, make sure to:
{.power-number}

1. **AWS Command Line Interface (AWS CLI)**: This tool allows you to interact with AWS services from your terminal. [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html){:target="_blank"}.

2. **eksctl**: A command-line tool to simplify the creation and management of EKS clusters. [Install eksctl](https://github.com/weaveworks/eksctl#installation){:target="_blank"}.

3. **kubectl**: The Kubernetes command-line tool for managing and deploying applications. [Install kubectl](https://kubernetes.io/docs/tasks/tools/){:target="_blank"}.

4. **Configure AWS CLI**: Ensure your AWS CLI is configured with your credentials. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html){:target="_blank"}.

## Create the EKS cluster

!!! caution alert alert-warning "Important"
    To run a 3-node PXC cluster, you need at least a 3-node EKS cluster with 2 vCPUs available per node. The database will not be created if you attempt to create a database cluster in a Kubernetes cluster without sufficient resources.


To create the EKS cluster, do the following steps:
{.power-number}

1. Set up your cluster details:
   
   Before creating your cluster, determine the following details:

    * **Cluster Name**: Choose a name for your EKS cluster.
    * **AWS Region**: Specify the AWS region where you want to deploy your cluster.
    * **Number of Nodes**: Decide how many nodes you need.
    * **On-Demand and Spot Instances**:  Determine the desired ratio between [on-demand](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html){:target="_blank"}
        and [spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html){:target="_blank"} instances in the total number of nodes.

    !!! note

        [Spot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html){:target="_blank"} instances are not recommended for production environment but may be useful for testing purposes.

2. Create Your EKS Cluster

    Use the following `eksctl` command to create your cluster:
    
    Example:

    ``` {.bash data-prompt="$" }
    eksctl create cluster --name my-cluster --region region-code --version 1.28 --vpc-private-subnets subnet-ExampleID1,subnet-ExampleID2 --without-nodegroup
    ```

    * --name: The name of your cluster.
    * --region: The AWS region where the cluster will be deployed.
    * --version: The Kubernetes version for your cluster.
    * --vpc-private-subnets: The private subnets where the nodes will be deployed.
    * --without-nodegroup: Creates the cluster without a default node group. You will add nodes later.

    For more detailed options and instructions, refer to the official [EKS cluster creation documentation](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html){:target="_blank"}.

3. [Install the Amazon EBS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html){:target="_blank"} on your cluster. See the [official documentation](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html){:target="_blank"} on adding it as an Amazon EKS add-on.
   
    3.1 [Create your Amazon EBS CSI plugin IAM role with eksctl](https://docs.aws.amazon.com/eks/latest/userguide/csi-iam-role.html)    

        eksctl create iamserviceaccount \
        --name ebs-csi-controller-sa \
        --namespace kube-system \
        --cluster $cluster_name \
        --role-name AmazonEKS_EBS_CSI_DriverRole \
        --role-only \
        --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
        --approve

    
    3.2 [Add the Amazon EBS CSI add-on using eksctl](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html). (Replace 111122223333 with your account ID)
    
            eksctl create addon --name aws-ebs-csi-driver --cluster my-cluster --service-account-role-arn arn:aws:iam::111122223333:role/AmazonEKS_EBS_CSI_DriverRole --force
            

4. [Add nodes to your EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/eks-compute.html)

      Here's an example using a managed node group:

        eksctl create nodegroup \
        --cluster my-cluster \
        --region region-code \
        --name my-mng \
        --node-ami-family ami-family \
        --node-type m5.large \
        --nodes 3 \
        --nodes-min 2 \
        --nodes-max 3 \
        --ssh-access \
        --ssh-public-key my-key

Congratulations! You have successfully created and configured a Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS).

## Next Steps

Now that your Kubernetes cluster is running, you might want to deploy **Percona Everest**. Follow our [installing Everest using the quick install script](quick-install.md) to get started quickly and easily.
        
