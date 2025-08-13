# Creating and managing load balancer configurations


## How to create and manage load balancer config

Here's how you can create load balancer config:
{.power-number}

1.  Navigate to Percona Everest home page and select <i class="uil uil-cog"></i> **Settings > Policies**.

2. In the **Load balancer configuration** section, click **Configure**. The **Load balancer configuration** page opens.

3. Click **Create configuration**. A pop-up window appears.

4. Enter the desired **Configuration name** and click **Create**. You will return to the **Load balancer configuration** page, where your new configuration is listed.

5. Click the newly created configuration to open it. Add one or more Key–value pairs in the provided fields. To add new Key–value pairs click **Add new**. 

6. Click **Save configuration**.

### Manage load balancer config

Here's how you can edit and delete the load balancer config:



## Configuring load balancer for external database access

You can enable a database cluster available outside of Kubernetes network as while creating a new database cluster as follows:
{.power-number}

1. Log into the Percona Everest UI.

2. On the Percona Everest homepage, click **Create database**. The menu for the different database types will open. Select the database that you wish to provision.

3. Click **Continue** and navigate and enter the information on the upcoming pages until you reach the **Advanced Configurations** page.

4. Turn the toggle on on the **Enable External Access** section.

5. Select **Load balancer** as the **Exposure method** from the dropdown.

6. Select the required Load balancer configuration from the dropdown.

7. Enter the trusted IP addresses to restrict access in the **Source range** field.

    !!! note
        Leaving this blank will expose the datase to all the IP addresses which is not recommended.

8. To add more than one Source range for IP address, click Add new. Enter the specific IP address.





 







