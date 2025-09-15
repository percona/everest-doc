# Creating and managing load balancer configurations


## Create a load balancer configuration

Here's how you can create a load balancer configuration:
{.power-number}

1.  Navigate to the Percona Everest home page and go to <i class="uil uil-cog"></i> **Settings > Policies**.

    ![!image](../images/policies_page.png)

2. In the **Load Balancer Configuration** section, click **Configure**. The **Load Balancer Configuration** page opens.

    ![!image](../images/load_balancer_config_page.png)

3. Click **Create configuration**. A pop-up window appears.

    ![!image](../images/create_config_load_balancer.png)

4. Enter a **Configuration name** and click **Create**.

5. Click **Add new**.

    ![!image](../images/loadbalancer_add_new_config.png)

6. Enter the annotations (key-value pairs) for your load balancer configuration. 

    ![!image](../images/key_value_load_balancer.png)

    !!! note
        The **key** and **value** in a Load Balancer configuration for Percona Everest are derived from your Kubernetes environment and the load balancer implementation by your cloud provider.

    ??? example "Examples of keys and values used for Load balancer configuration"

        ```sh
        service.beta.kubernetes.io/aws-load-balancer-type: "nlb"                    # Use Network Load Balancer (NLB)
        service.beta.kubernetes.io/aws-load-balancer-scheme: "internet-facing"        # Internet-facing vs. internal
        service.beta.kubernetes.io/aws-load-balancer-internal: "true"                   # Internal LB
        service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:..."        # Attach ACM SSL cert
        service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "443"                   # SSL termination ports
        service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "http"        # Protocol between LB and pods
        ```

7. Click **Save configuration**.

8. Click **Back** to view the newly created load balancer configuration.

    ![!image](../images/new_created_load_balancer_configurations.png)

## Manage load balancer configuration

Here's how you can edit the load balancer configuration:
{.power-number}

1.  Navigate to the Percona Everest home page and go to <i class="uil uil-cog"></i> **Settings > Policies**.

2. In the **Load Balancer configuration** section, click **Configure**. The list of existing configurations appears.

3. To add new annotations or for an existing load balancer configuration, click on the specific configuration you want to update and click **Edit configuration**.

4. Click **Add new** and add the annotations. Click **Save configuration**.

5. To modify an existing configuration, click on the specific configuration and click **Edit configuration**. Modify the annotations and click **Save configuration**.

    ![!image](../images/edit_loadbalancer_configuration.png)


## Delete load balancer configuration

Here's how you can delete the load balancer configuration:
{.power-number}

1. Navigate to the Percona Everest home page and go to <i class="uil uil-cog"></i> **Settings > Policies** 

2. In the **Load Balancer configuration** section, click **Configure**. The list of existing configurations appears.

3. Click on the ellipsis next to the load balancer configuration that you want to delete.

4. Click on **Delete**. A confirmation pop-up will be displayed for deleting the load balancer configuration.

5. Enter the **Config name** in the text box and click **Delete**.

    ![!image](../images/del_load_balancer_config.png)

## Configuring load balancer for external database access

You can expose a database cluster outside of the Kubernetes network during database creation:
{.power-number}

1. Log in to the Percona Everest UI.

2. On the Percona Everest homepage, click **Create database**. Select the database that you wish to provision.

3. Continue through the setup until you reach the **Advanced Configurations** page.

4. In the **Enable External Access** section, turn the toggle **ON**. 

5. Select **Load balancer** as the **Exposure method** from the dropdown.

    ![!image](../images/exposure_method_loadbalancer.png)

6. Select the desired **Load balancer configuration** from the dropdown.

7. (Optional) In the **Source range** field, enter trusted IP addresses to restrict access.

    - To add multiple Source ranges, click **Add new**. Enter the specific IP addresses separately.


    !!! note
        Leaving the **Source range** blank will expose the database to all the IP addresses (0.0.0.0/0). This is not recommended for production environments.




 







