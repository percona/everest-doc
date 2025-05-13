# Manage Pod scheduling policies in Percona Everest

A Percona Everest administrator, or anyone with the necessary RBAC permissions, can edit or delete the Pod Scheduling Policies. It may be necessary to update these policies over time to add new affinity rules, modify existing ones, or remove outdated configurations.


## Update Pod scheduling rule

It may be necessary to update the pod scheduling rule for policies over time to add new affinity rules, modify existing ones, or remove outdated configurations.

Here are the steps to update a Pod scheduling policy:
{.power-number}

1. From the Percona Everest home page navigate to the <i class="uil uil-cog"></i> **Settings > Pod scheduling policies** page.

2. Select the policy that you want to update.

3. Click on the **Edit** icon. The **Edit rule** pop-up opens.

4. Make the required changes and click **Save**. 

    Percona Everest will update the policy and apply the changes to all the affected database clusters.


## Delete Pod scheduling policy

If a specific Pod Scheduling Policy is no longer needed, the Percona Everest Administrator or anyone with the proper permissions can delete it.

Here are the steps to delete a Pod scheduling policy:
{.power-number}

1. 1. From the Percona Everest home page navigate to the <i class="uil uil-cog"></i> **Settings > Pod scheduling policies** page.

2. Select the policy that you want to delete.

3. Click on the **Delete** icon. The **Delete Rule** confirmation opens.

4. Click **Delete**.

    !!! note

