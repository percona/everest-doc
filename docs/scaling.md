# Scaling your database deployment

Scaling in Percona Everest allows for easy adjustment of database capacity and performance to meet the changing demands.

* Vertical scaling
            
    Vertical scaling is essential for addressing increased workloads or performance demands. You can scale up or scale down as per your requirements. 
        
    * Scale up

        You can vertically scale up your Percona Everest instance by modifying its configuration to a higher performance tier. This involves increasing the memory and/or CPU threshold. To increase the performance of your cluster, you can create a cluster with bigger disk size and memory that can hold more data.
        
        **Example**
        
        For optimal cluster performance, select **Large** as the **Resource size per node** when creating a database cluster. It has higher preset thresholds for CPU, memory, and disk as comapared to **Small**.
            
        ![!image](images/everest_scale_vertically_up.png)

    * Scale down 

        Similarly, you can scale down (downsize) your database instance when the resource requirements decrease, which can help optimize costs.
            
        **Example**
      
      If performance is not a criteria and resource requirements are low, opt for **Small** as the **Resource size per node** when creating a database cluster. This option has lower preset thresholds for CPU, Memory, and Disk compared to the **Large**.
        
        ![!image](images/everest_db_scaling.png)

* Horizontal scaling

    To scale Percona Everest horizontally, add database nodes to the existing cluster. These nodes share the workload, distributing queries and transactions more evenly, which can lead to improved performance as well as availability and datbaase resilience.

    ![!image](images/everest_scale_horizontally.png)

## How to scale your database clusters

To scale your database instances:

### For new database clusters

To scale new database clusters:

1. Log into the Percona Everest UI. 

   The Percona Everest homepage will be displayed.

2. Click **Create Database**.

    The Basic information page will be displayed.

3. Select the **Database type**: PostgreSQL, MySQL, or MongoDB.

4. Choose a name for your database. The name is auto-populated, but you can modify it according to your needs.

5. Select the **Database version** from the dropdown.

6. Select the **[Storage class]()**.

7. Click **Continue**.

    The **Resources** page will be displayed.

8. Select the **Number of nodes**. 

    ![!image](images/everest_db_scaling.png)

9. Select the **Resources per node**. When you select the Resources per node, the threshold values are automatically populated in the CPU, MEMORY, and DISK fields. However, you can also manually enter the values for these fields.

        
9. Click **Continue** till you come to the page where **Create database** option is seen.

10. Click **Go to list of my databases**. You will see the database that you provisioned.

11. Click on expand next to the database that you created. You can see the resources that you allocated for your database.

    ![!image](images/everest_resources_allocated.png)

# For existing database clusters

To scale existing database clusters:

1. From the Percona Everest Homepage, click on the three dots next to the database that you want to scale. A list of actions will be displayed.
2. Click **Edit**.
3. Navigate to the **Resources** page.
4. Select the **Number of nodes**. 
5. Select the **Resources per node**. When you select the Resources per node, the threshold values are automatically populated in the CPU, MEMORY, and DISK fields. However, you can also manually enter the values for these fields.
6. Click **Continue** till you come to the page where **Edit database** option is seen.

7. Click **Go to list of my databases**.

8. Click on expand next to the database that you edited. You can see the resources that you allocated for your database.

    ![!image](images/everest_resources_allocated.png)




