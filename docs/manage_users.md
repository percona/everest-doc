# Manage users



Percona Everest provides user management capabilities, enabling you to securely log in through either the Percona Everest UI or the API.


When you install Percona Everest, an `admin` user is automatically created, granting full access to the system.


!!! note alert alert-primary "Note"

    It is recommended that you use the admin account for the initial configuration and subsequently transition to Single Sign-On (SSO) integration.


## Overview

All user accounts are stored in the YAML format within the `everest-accounts` Secret in the `everest-system` namespace:

??? example "YAML"
        
    ```{.text .no-copy}
    apiVersion: v1
    kind: Secret
    metadata:
        name: everest-accounts
        namespace: everest-system
    data:                    
      users.yaml: YWRtaW46CiAgcGFzc3dvcmRIYXNoOiBhZG1pbgogIGVuYWJsZWQ6IHRydWUKICBjYXBhYmlsaXRpZXM6CiAgICAtIGxvZ2lu
    ```
Decoding the base64 encoded value will yield a YAML that appears as follows:


??? example "YAML after decoding"

    ```{.text .no-copy}
    admin:
        passwordHash: <password>
    enabled: true
    capabilities:
        - login
    ```

## Commands for user management

When installing Everest for the first time, an `admin` user is created by default.


### Retrieve password for admin user

You can retrieve the password for the `admin` user by running the following command:

```sh
everestctl accounts initial-admin-password
```

!!! note alert alert-primary "Note"

    The passwords in this Secret are stored as hashes. However, the initial admin user has the password stored as plain text for convenient retrieval later on. We strongly recommend that you update the admin password after installation.


### Create a new user

To create a new user:

```sh
everestctl accounts create -u <username> -p $PASSWORD
```







