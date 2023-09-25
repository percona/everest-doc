# Scaling your database deployment

Scaling in Percona Everest allows for easy adjustment of database capacity and performance to meet the changing demands.

## Vertical scaling
            
Vertical scaling is essential for addressing increased workloads or performance demands. You can scale up or scale down as per your requirements. 
        
* Scale up

    You can vertically scale up your Percona Everest instance by modifying its configuration to a higher performance tier. This involves increasing the memory and/or CPU threshold.       
    
    **Example**
        
    For optimal cluster performance, select **Large** as the **Resource size per node** when creating a database cluster. It has higher preset thresholds for CPU, memory, and disk as compared to **Small**.            
    
    ![!image](images/everest_scale_vertically_up.png)

* Scale down 

    Similarly, you can scale down (downsize) your database instance when the resource requirements decrease, which can help optimize costs.
            
    **Example**
      
    If performance is not a criterion and resource requirements are low, opt for **Small** as the **Resource size per node** when creating a database cluster. This option has lower preset thresholds for CPU, Memory, and Disk compared to the **Large**.        
    
    ![!image](images/everest_db_scaling.png)

## Horizontal scaling

To scale Percona Everest horizontally, add database nodes to the existing cluster. These nodes share the workload, distributing queries and transactions more evenly, which can lead to improved performance, availability, and database resilience.

![!image](images/everest_scale_horizontally.png)

## How to scale your database clusters

To scale your database instances:


1. From the Percona Everest Homepage, click on the three dots next to the database that you want to scale. A list of actions will be displayed.
2. Click **Edit**.
3. Navigate to the **Resources** page.
4. Select the **Number of nodes**. 
5. Select the **Resources per node**. When selecting the **Resources per node**, the threshold values are automatically populated in the CPU, MEMORY, and DISK fields.
6. Click **Continue** until you reach the page where **Edit database** option is seen.

7. Click **Go to list of my databases**.

8. Click on expand next to the database that you edited. You can see the resources that you allocated for your database.

    ![!image](images/everest_resources_allocated.png)




