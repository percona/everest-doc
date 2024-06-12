# Manage users



Percona Everest provides user management capabilities, enabling you to securely log in through either the Percona Everest UI or the API.


When you install Percona Everest, an admin user is automatically created, granting full access to the system.


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
    users.yaml:YWRtaW46CiAgcGFzc3dvcmRIYXNoOiBhZG1pbgogIGVuYWJsZWQ6IHRydWUKICBjYXBhYmlsaXRpZXM6CiAgICAtIGxvZ2lu
    ```



