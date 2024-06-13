# Manage users

Percona Everest provides user management capabilities, enabling you to securely log in through either the Percona Everest UI or the API.

When you install Percona Everest, an `admin` user is automatically created, granting full access to the system.


!!! note alert alert-primary "Note"

    It is recommended that you use the admin account for the initial configuration and subsequently transition to Single Sign-On (SSO) integration.


## Overview

All user accounts are stored in the YAML format within the `everest-accounts` Secret in the `everest-system` namespace:

??? example "User accounts: YAML format"
        
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

### Retrieve password

You can retrieve the password for the `admin` user by running the following command:

```sh
everestctl accounts initial-admin-password
```

!!! note alert alert-primary "Note"

    The passwords in this Secret are stored as hashes. However, the initial admin user has the password stored as plain text for convenient retrieval later on. We strongly recommend that you update the admin password after installation.



### Update the password

To update the password for an existing user:

```sh
everestctl accounts set-password -u <username> --new-password $PASSWORD
```

### Create a new user

To create a new user:

```sh
everestctl accounts create -u <username> -p $PASSWORD
```

### List the users

To list all the users in the system:

```sh
everestctl accounts list
```

### Delete a user

To delete an existing user:

```sh
everestctl accounts delete -u <username>
```


## JSON Web Token (JWT) and keys

When you log in from the UI, Percona Everest issues a JSON Web Token for authentication of requests. By default, this token is valid for **24** hours, after which you are expected to log in again.


!!! info "Important"

    Since JWT authentication is stateless, it is currently impossible to explicitly revoke specific tokens. Therefore, even a deleted user may continue to request the API as long as they have a valid token.


Everest uses the RSA algorithm for signing and verifying JWT. The RSA keys used in  the backend are automatically generated upon installation and stored in the `everest-jwt `Secret in the `everest-system `namespace.


        apiVersion: v1
        data:
            id_rsa: <PRIVATE KEY>
            id_rsa.pub: <PUBLIC KEY>
        kind: Secret
        metadata:
            name: everest-jwt
            namespace: everest-system
        type: Opaque


To reset the keys:

    ```sh
    everestctl accounts reset-jwt-keys
    ```







