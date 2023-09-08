# Database engine configuration

Percona Everest provides configuration settings and options, which are essential for tailoring the database behavior and performance to meet the needs of various applications. You can fine-tune your database operations using these settings and options, thus increasing efficiency and productivity.

To configure your database engine in Percona Everest:

1. From the Percona Everest main page, navigate to **Create databases > Advanced Configurations** page.
2. To update the database engine configuration for your existing database, go to the Everest main page and click on the three dots next to the database you want to update. Then select **Edit**.
3. You can optimize your database's performance using **Database Engine Parameters** on the **Advanced configurations** page.
4. Enable Database engine parameters by moving the slider to the right.
5. Configure specific values to optimize performance, security, and functionality according to your requirements by entering the values in the text box.

    ![!image](images/everest_adv_config.png)

6. To enable external access beyond the Kubernetes cluster network, move the slider to the right.

    !!! note alert alert-primary "Note"
        Enabling remote access to your database can lead to serious security risks such as unauthorized access, data breaches, and compliance violations.
    
    ![!image](images/everest_adv_config_ip_source.png)

7. Click **Add new** to add the IP addresses in the **Source Range** field.

8 Click **Continue**.