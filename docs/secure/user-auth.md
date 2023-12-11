# Authentication

Percona Everest provides user authentication to ensure that only authorized users can access the databases hosted on Percona Everest. Securing access to these databases is crucial to safeguard sensitive data and restrict database access to authorized users only. 

To access Percona Everest:

1. Copy the authorization token that is displayed on the terminal while [installing Percona Everest](../install/installEverest.md).

    ![!image](../images/everest_user-auth-token.png)

2. Navigate to the Everest UI.

3. Enter the authorization token that you copied in step 1.

    ![!image](../images/everest_user-auth-login.png)


4. Click **Log in**.


## Reset password

If you forget to copy the authorization token while installing Everest or misplace it, a solution is available to reset the token and receive a new one. 

You can reset the authorization token by executing the following command:

```sh
go run cmd/everest/main.go password reset
```

??? example "Expected output"    
        Your new password is:
        Xw6lSUKXm6LJ8CusbJ4X2PjpRfWAiydV2zS90p7QPifz4QakJM2AISxuS97zriM9qfZtoPBjWbgciDXtXmaHSHv87cGBG7idNjUKsMdUP7NgjBRgCTXhDiMH7kvMGVfZ






