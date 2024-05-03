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


2. Create your EKS cluster following the official [cluster creation instructions](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html){:target="_blank"}. 

    Example:

    ``` {.bash data-prompt="$" }
    eksctl create cluster --name my-cluster --region region-code --version 1.28 --vpc-private-subnets subnet-ExampleID1,subnet-ExampleID2 --without-nodegroup
    ```
3. [Install the Amazon EBS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html){:target="_blank"} on your cluster. See the [official documentation](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html){:target="_blank"} on adding it as an Amazon EKS add-on. 

    Example:

    1. [Create your Amazon EBS CSI plugin IAM role](https://docs.aws.amazon.com/eks/latest/userguide/csi-iam-role.html) with eksctl

            eksctl create iamserviceaccount \
            --name ebs-csi-controller-sa \
            --namespace kube-system \
            --cluster $cluster_name \
            --role-name AmazonEKS_EBS_CSI_DriverRole \
            --role-only \
            --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
            --approve

    
    2. [Add the Amazon EBS CSI add-on using eksctl](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html). (Replace 111122223333 with your account ID)
    
            eksctl create addon --name aws-ebs-csi-driver --cluster my-cluster --service-account-role-arn arn:aws:iam::111122223333:role/AmazonEKS_EBS_CSI_DriverRole --force
            

4. [Add nodes to your EKS cluster](https://docs.aws.amazon.com/eks/latest/userguide/eks-compute.html). 

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
        