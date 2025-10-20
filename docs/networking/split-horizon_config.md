# Configure split-horizon DNS


Here's how you can configure a split-horizon DNS for MongoDB
{.power-number}

1.  Navigate to the Percona Everest home page and go to <i class="uil uil-cog"></i> **Settings > Policies & configurations**.

    ![!image](../images/policies_page.png)

2. In the **Split-Horizon DNS** section, click **Configure**. The **Split-Horizon DNS** page opens.

    ![!image](../images/split-horizon_config_page.png)

3. Click **Create configuration**. A pop-up window appears.

    ![!image](../images/create_config_split-horizon.png)


4. Enter the following:

    - **Domain**: A domain represents how your database endpoint is identified (for example, mydb.everest.local).
    - **Certificate**: Upload your **Transport Layer Security 
    (TSL)** certificate. 
    For information on how to obtain a TSL certificate, refer to the [TLS Certificate page]().
    - **key**: Upload your Private key file. The private key pairs with the TLS certificate and is used to establish encrypted connections.
    - **Ca cert**: Upload your Certificate Authority (CA) Certificate. A CA certificate is the root or intermediate certificate from the Certificate Authority (CA) that signed your TLS certificate. It helps clients verify that your database’s certificate is valid and trustworthy.

5. Click **Create**.


8. Click **Back to all policies** to view the newly created split-horizon configuration.








 







