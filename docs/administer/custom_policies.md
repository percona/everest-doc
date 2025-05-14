# Custom Pod scheduling policies

Percona Everest allows you to define custom Pod scheduling policies to control how database pods are placed on Kubernetes nodes.

## Create Pod scheduling policy for your DB cluster

Here are the steps to configure pod scheduling rules for the policies for your database clusters:
{.power-number}

1. From the Percona Everest home page, navigate to the <i class="uil uil-cog"></i> **Settings > Pod scheduling policies** page. Here, you can view both default and custom policies.


    ![!image](../images/pod_scheduling_policies.png)


2. Click **Create policy**.

3. In the pop-up that appears, enter a **Policy name** and select the **database technology** from the dropdown. Click **Create**.


4. Click **Add rule**.

5. A pop-up will appear where you need to enter the following details for the **Rule type** and **Rule details** section:

    ![!image](../images/affinity_add_rules.png)

    Refer to the following table for the detailed attribute descriptions.

    ??? info "📋 Custom Pod scheduling rule attributes"
        The table below describes the key attributes used to define pod scheduling rules in Percona Everest:


        | **Attribute**     | **Description** | **Comments** |
        |------------------|-----------------|-----------|
        | **Components**    | The database cluster components the rule applies to:<br>- **DB Node**<br>- **Proxy / Router / PgBouncer**<br>- **Config Server** | - DB Nodes and Proxies are applicable for **MySQL** and **PostgreSQL**.<br>- Config Servers apply to **MongoDB** sharded clusters. |
        | **Priority**      | Defines the distinct level of rule enforcement:<br>- **Preferred**: Percona Everest will *try* to honor the rule but will schedule the pod even if it's not met.<br>- **Required**: The rule *must* be satisfied for the pod to be scheduled. | Use **Preferred** for flexible placement and **Required** for hard constraints. |
        | **Weight (1–100)**| Determines the priority of a **Preferred** rule. Higher values indicate stronger preference. | Only applicable to **Preferred** rules. |
        | **Topology Key**  | Specifies the domain used to group nodes or pods for affinity. Determines the scope (e.g., zone, hostname) for applying scheduling rules. |**Examples:**<br>- `kubernetes.io/hostname`<br>- `topology.kubernetes.io/zone`<br>- `topology.kubernetes.io/region`<br>- Custom: `rack` |
        | **Key**           | The pod label key used in **Pod Affinity** or **Anti-Affinity** rules. Helps target specific pods to influence scheduling decisions. | Should match a label present on existing pods in the cluster.<br>**Examples:**<br>- `app`<br>- `security`<br>- `environment`<br>- Custom: `web-store` |
        | **Operator**      | Logical condition used to evaluate the **Key** and **Values**. Determines how Kubernetes interprets the label match. | **Supported Operators:**<br>- `In`: Matches if the label value is in a specified list<br>- `NotIn`: Matches if not in the list<br>- `Exists`: Matches if the label key exists (regardless of value)<br>- `DoesNotExist`: Matches if the label key does not exist |
        | **Values**        | Specific label values that must match for the rule to apply. Required when using `In` or `NotIn` operators. | **Examples:**<br>- `s2`<br>- `database`<br>- `production`<br>- Custom: `finance`, `cache-tier` |

6. Click **Add** to save the rule. The new pod scheduling policy is now available and can be applied to relevant components.


## Assign pod scheduling policy to a new DB cluster

!!! info "Important"
    If RBAC is enabled, Percona Everest only displays Pod Scheduling Policies applicable to the selected DB Engine type for which the user has read access.

You can assign a Pod scheduling policy when creating a cluster by following these steps:
{.power-number}

1. From the database creation wizard, go to **Advanced Configurations** page. In the **Pod scheduling policy**
section, choose a policy from the dropdown.

    ![!image](../images/assign_policy.png)


2. Click **Continue** till you reach the end of the wizard.

3. Click **Create Database** to apply the policy.

!!! note
    You must first [create the policy](#create-pod-scheduling-policy-for-your-cluster) to see the custom policy in the **Pod scheduling policy** dropdown on the **Advanced Configurations** page. 

## Assign pod scheduling policy to an existing DB cluster

You can assign a Pod scheduling policy for an existing DB cluster by following these steps:
{.power-number}

1. Go to the **Overview** page of the desired cluster and click **Edit** on the **Advanced configuration** panel. The **Edit advanced configuration** pop-up opens.

2. In the **Pod scheduling policy** section, select the policy from the dropdown.

3. Click **Save**. The chosen pod scheduling policy will now be added to your cluster.


    ![!image](../images/assign_policy_existing_cluster.png)  


## Unassign or change Pod scheduling policy for an existing DB cluster

You can unassign or change a Pod scheduling policy for an existing DB cluster by following these steps:
{.power-number}

1. Go to the **Overview** page of the cluster you want to modify and click **Edit** in the **Advanced configuration** panel. The **Edit advanced configuration** pop-up opens.

2. In the **Pod scheduling policy** section, choose the policy you want to apply to the existing cluster.

3. To unassign all the policies from the cluster, turn off the **Enable** toggle in the **Pod scheduling policy **section. This will remove all the policies assigned to the cluster.



## Next steps

[Manage Pod scheduling policies :material-arrow-right:](manage_pod_scheduling_policies.md){.md-button}






















 











