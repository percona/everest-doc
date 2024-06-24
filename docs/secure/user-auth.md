# User authentication

Percona Everest provides user authentication to ensure that only authorized users can access the databases hosted on Percona Everest. Securing access to these databases is crucial to safeguard sensitive data and restrict database access to authorized users only. 
{.power-number}

1. When you [install Percona Everest](../install/installEverest.md), an `admin` user is automatically created. To retrieve the password for the `admin` user, run the following command:

    ```sh
    everestctl accounts initial-admin-password
    ```

    We strongly recommend that you reset the  initial `admin` password after installation.

    
    !!! note " Note"
        To access Percona Everest, you can also create a [new user account](manage_users.md#create-a-new-user). Once the account is created, you can then log in using your newly created user credentials.


2. Navigate to the Everest UI.

3. Enter the password you received in step 1. If you changed the initial password, enter the updated one.

4. Click **Log in**.


## Reset initial password

To reset the initial admin password:

```sh
everestctl accounts set-password --username admin
```







