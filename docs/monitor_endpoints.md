# Monitoring endpoints

Percona Everest provides monitoring capabilities with PMM to maintain a reliable and secure database infrastructure.

Here are some key values you'll get with monitoring of Percona Everest:

- Monitoring helps track database availability and uptime
- Monitoring provides insights into database performance
- Monitoring helps detect and address issues proactively
- Continuous monitoring helps maintain a stable and reliable database environment.


## Prerequisites

To use monitoring in Percona Everest you should have a PMM instance up and running.

For information on installing PMM, see [documentation] (https://docs.percona.com/percona-monitoring-and-management/setting-up/index.html).

## Add monitoring from the UI

To add monitoring in Percona Everest from the UI:
{.power-number}

1. From the Percona Everest Homepage navigate to **Settings > Monitoring endpoints**. **Add monitoring endpoint** dialogue box opens.

2. On the **Add monitoring endpoint screen**, enter a PMM instance name. In the **User** and **Password** field, enter the credentials received upon installing PMM. In the **Endpoint** field, enter the PMM URL.

    ![!image](images/everest_add_endpoint.png)

3. Click **Add**. The endpoint will be added.

    ![!image](images/everest_endpoint_added.png)


## Edit monitoring endpoint from the UI

To edit a monitoring endpoint from Percona Everest UI:
{.power-number}

1. From the Percona Everest Homepage navigate to **Settings > Monitoring endpoints**.

2. Click on the ellipsis (three dots) next to the endpoint that you need to edit. **Edit monitoring endpoint** dialogue box opens.

    ![!image](images/everest_endpoint_edit.png)

3. Click **Add**.


## Add monitoring from the CLI

To add monitoring in Percona Everest from the CLI:

1. Run the following command:


    ```sh
    everestctl monitoring enable
    ```

    Alternatively navigate to the `percona-everest-cli` directory and run the following command:

    ```sh
    go run cmd/everest/main.go monitoring enable
    ```

2. Enter the following information:

    - Everest URL Endpoint - URL of the Everest instance
    - Everest Token - The authorization token received while installing Everest
    - PMM URL Endpoint - URL of the PMM instance
    - Username and Password - Credentials for the PMM instance
    - Name for the new monitoring instance - Any name that you want to give to the monitoring instance

3. Go to Percona Everest UI and navigate to **Settings > Monitoring endpoints**. This monitoring instance will be added on this page.










