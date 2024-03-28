# Install Percona Everest using the Quick-Install script

## Procedure

As soon as you create a Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), you can install Percona Everest.

For more information, see the [Prerequisites](qs-prerequisites.md) section.
{.power-number}

## Before you start

Before running the commands in the **Installation** section, note that Everest will search for the **kubeconfig** file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable:
    
```sh
export KUBECONFIG=~/.kube/config
```

## Installation

1. To install Percona Everest, run the following command:

    ```{.bash data-prompt="$"}
    $ curl -sfL "https://raw.githubusercontent.com/percona/everest/v0.9.0/install.sh" | bash
    ```

    ??? example "Expected output"

        ```{.text .no-copy}
        Downloading the latest release of Percona Everest CLI
        https://github.com/percona/everest/releases/download/v0.9.0/everestctl-linux-amd64
        KUBECONFIG is not set. Using default k8s cluster

        2024-02-20T10:15:46Z    info    install/install.go:430  Installing Operator Lifecycle Manager   {"component": "install"}
        2024-02-20T10:16:01Z    info    install/install.go:435  OLM has been installed  {"component": "install"}
        2024-02-20T10:16:01Z    info    install/install.go:436  Installing Percona OLM Catalog  {"component": "install"}
        2024-02-20T10:16:23Z    info    install/install.go:441  Percona OLM Catalog has been installed  {"component": "install"}
        2024-02-20T10:16:23Z    info    install/install.go:419  Creating namespace everest-monitoring   {"component": "install"}
        2024-02-20T10:16:23Z    info    install/install.go:425  Namespace everest-monitoring has been created   {"component": "install"}
        2024-02-20T10:16:23Z    info    install/install.go:238  Preparing k8s cluster for monitoring    {"component": "install", "action": "monitoring"}
        2024-02-20T10:16:23Z    info    install/install.go:208  Creating operator group for everest     {"component": "install"}
        2024-02-20T10:16:23Z    info    install/install.go:212  Installing victoriametrics-operator operator    {"component": "install"}
        2024-02-20T10:16:46Z    info    install/install.go:228  victoriametrics-operator operator has been installed    {"component": "install"}
        2024-02-20T10:16:50Z    info    install/install.go:246  K8s cluster monitoring has been provisioned successfully        {"component": "install", "action": "monitoring"}
        2024-02-20T10:16:50Z    info    install/install.go:419  Creating namespace everest      {"component": "install"}
        2024-02-20T10:16:50Z    info    install/install.go:425  Namespace everest has been created      {"component": "install"}
        2024-02-20T10:16:50Z    info    install/install.go:311  Installing operators into everest namespace     {"component": "install"}
        2024-02-20T10:16:50Z    info    install/install.go:478  Installing percona-xtradb-cluster-operator operator     {"component": "install"}
        2024-02-20T10:17:13Z    info    install/install.go:520  percona-xtradb-cluster-operator operator has been installed     {"component": "install"}
        2024-02-20T10:17:13Z    info    install/install.go:478  Installing percona-server-mongodb-operator operator     {"component": "install"}
        2024-02-20T10:17:34Z    info    install/install.go:520  percona-server-mongodb-operator operator has been installed     {"component": "install"}
        2024-02-20T10:17:34Z    info    install/install.go:478  Installing percona-postgresql-operator operator {"component": "install"}
        2024-02-20T10:17:59Z    info    install/install.go:520  percona-postgresql-operator operator has been installed {"component": "install"}
        2024-02-20T10:17:59Z    info    install/install.go:315  Creating role for the Everest service account   {"component": "install"}
        2024-02-20T10:18:00Z    info    install/install.go:321  Binding role to the Everest Service account     {"component": "install"}
        2024-02-20T10:18:00Z    info    install/install.go:419  Creating namespace everest-system       {"component": "install"}
        2024-02-20T10:18:00Z    info    install/install.go:425  Namespace everest-system has been created       {"component": "install"}
        2024-02-20T10:18:00Z    info    install/install.go:255  Creating operator group for everest     {"component": "install"}
        2024-02-20T10:18:00Z    info    install/install.go:478  Installing everest-operator operator    {"component": "install"}
        2024-02-20T10:18:37Z    info    install/install.go:520  everest-operator operator has been installed    {"component": "install"}
        2024-02-20T10:18:37Z    info    install/install.go:278  Deploying Everest to everest-system     {"component": "install"}
        2024-02-20T10:18:50Z    info    install/install.go:293  Updating cluster role bindings for everest-admin        {"component": "install"}
        2024-02-20T10:18:50Z    info    install/install.go:577  Creating token for Everest      {"component": "install"}
        2024-02-20T10:18:50Z    info    install/install.go:185
        Here's your authorization token for accessing the Everest UI and API:

        SPL6dp9uUNjlTGcgvCbwzdPWmqjks01YGe5AwUpXTx8hciycT7avxSMY2moDs7i876RMW5kfRCMImYNVhhGWooHEFZAYMWjcaG1IotH6cgJFsyh7EcAfPevDqnotd1A7

        Store this token securely as you will not be able to retrieve it later. If you ever need to reset it, use the following command:
        everestctl token reset

                {"component": "install"}
        Your provisioned Everest instance will be available at http://127.0.0.1:8080
        Exposing Everest using kubectl port-forwarding. You can expose it manually
        Forwarding from 127.0.0.1:8080 -> 8080
        Forwarding from [::1]:8080 -> 8080
        ```
    !!! note alert alert-primary "Important"
        Ensure to copy the authorization token displayed on the terminal in this step. You will need this token to log in to the Percona Everest UI.    

3. The Percona Everest app will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). 

    Now, you can open your browser and create databases in Percona Everest.

    ![!image](../images/everest_site.png)

## Video tutorial

You can also learn about installing Percona Everest via the Quick-Install script by following the video tutorial below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vxhNon-el9Q?si=8toRQZ-Z1-prU9vC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
## Next steps

[Create a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
