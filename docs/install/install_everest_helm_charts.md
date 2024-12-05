# Install Percona Everest using Helm
This guide demonstrates how to install Percona Everest using [Helm](https://helm.sh/) as an alternative to `everestctl install`. Helm charts simplify deployment by packaging all required resources and configurations, making it an ideal choice for automating and managing installations in Kubernetes environments.

For more info, refer to the official documentation on [Helm charts](https://helm.sh/docs/topics/charts/#helm).

## Install Percona Everest

1. Add the Percona Helm repository:

    ```sh
    helm repo add percona https://percona.github.io/percona-helm-charts/
    helm install everest-core percona/everest --namespace everest-system --create-namespace
    ```

2. Install Percona Everest:

    ```sh
    helm install everest-core percona/everest \
    --namespace everest-system \
    --create-namespace
    ```

    ??? info "What's happening under the hood"
        The command does the following:
        {.power-number}

        1. Deploys the Percona Everest components in the `everest-system` namespace. Currently, specifying a different namespace for Percona Everest is not supported.

        2. Deploys a new namespace called `everest` for your databases and the database operators.

            You can override the name of the database namespace by using the `dbNamespace.namespaceOverride` parameter. If you prefer to deploy just the core components, set `dbNamespace.enabled=false`

3. Once the installation is complete, retrieve the `admin` password:

    ```sh
    kubectl get secret everest-accounts -n everest-system -o jsonpath='{.data.users\.yaml}' | base64 --decode  | yq '.admin.passwordHash'
    ```

4. Connect to the Percona Everest UI by setting up port-forwarding to your local machine:

    ```sh
    kubectl port-forward svc/everest -n everest-system 8080:8080
    ```

    !!! note

        - The default username for logging into the Everest UI is `admin`.
        - You can set a different default admin password by using the `server.initialAdminPassword` parameter during installation.
        - The default admin password is stored in plain text. It is highly recommended to update the password using `everestctl` to ensure that the passwords are hashed.

5. Deploy additional database namespaces:

    Once Everest is successfully running, you can create additional database namespaces using the `everest-db-namespace` Helm chart. 

    If you set `dbNamespaces.enabled=false` in the previous step, you can deploy a database namespace with the following command:

    ```sh
    helm install everest \
    percona/everest-db-namespace \
    --create-namespace \
    --namespace everest
    ```

    !!! note
        -  All database operators are installed in your database namespace by default. You can override this by specifying one or more of the following options: `[dbNamespace.pxc=false, dbNamespace.pg=false, dbNamespace.psmdb=false]`.
        - Installation without chart hooks is currently not supported. The use of `--no-hooks` during installation is not supported.


## Configure parameters

You can customize various parameters in the Percona Everest Helm charts for your deployment to meet your specific needs. Refer to the [Helm documentation](https://helm.sh/docs/chart_best_practices/values/){:target="_blank"} to discover how to configure these parameters.

A few parameters are listed in the following table. For a detailed list of the parameters, see the [README](https://github.com/percona/percona-helm-charts/blob/main/charts/everest/README.md#configuration){:target="_blank"}.

|**Namespace**|**Key**|**Type**|**Default**|**Description**|
|---------|------|---------|------------------|------------|
|everest|`server.initialAdminPassword`|string|""|Initial password configured for admin user.</br></br> If it is not set, a random password is generated. It is recommended to reset the admin password after installation.|
|everest|`server.oidc`|object|{}|OIDC configuration for Everest.</br></br> These settings are applied only during installation. To modify the settings after installation, you have to manually update the everest-settings `ConfigMap`.|
|everest-db-namespace|`pxc`|bool|true| Installs the Percona XtraDB Cluster operator if set.|
|everest-db-namespace|`postgresql`|bool|true| Installs the Percona Postgresql Server operator if set.|
|everest-db-namespace|`psmdb`|bool|true| Installs the Percona Server MongoDB operator if set.|

























