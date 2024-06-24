# User authentication

Percona Everest provides user authentication to ensure that only authorized users can access the databases hosted on Percona Everest. Securing access to these databases is crucial to safeguard sensitive data and restrict database access to authorized users only. 

To access Percona Everest:
{.power-number}

1. When you [install Percona Everest](../install/installEverest.md), an `admin` user is automatically created. To retrieve the password for the `admin` user, run the following command:

     ```sh
    everestctl accounts initial-admin-password
    ```

    We strongly recommend that you update the `admin` password after installation.

3. Update the password for the `admin` user:

    ```sh
    everestctl accounts set-password --username admin
    ```

    For detailed information on user management, see the section [Manage users in Percona Everest](../manage_users.md).

4. Navigate to the Everest UI.

5. Enter the password you received in step 1. If you changed the initial password, enter the updated one.

6. Click **Log in**.


## Reset authorization token

If you forget to copy the authorization token while installing Everest or misplace it, you can reset the token by executing the following command:

```sh
everestctl token reset
```

??? example "Expected output"

    ```
    Here's your authorization token for accessing the Everest UI and API:

    74xm9CdEAD7iVtsqolBsSMNXvJHrMpJekUpPmZhXCAbGsMMFJVrGe7MyCvSV2qhSAgLMiTVRUKn363QTzVJNFL6a8cY4MPTwbb3rO87joikqvAHnQeyrDLZLSsglHmCP

    Store this token securely as you will not be able to retrieve it later. If you ever need to reset it, use the following command:

    everestctl token reset
    ```






