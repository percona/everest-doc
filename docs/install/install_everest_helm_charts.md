# Helm Chart

Helm is a package manager for Kubernetes applications.

The Percona Everest Helm chart can be set up with a single command and includes all the resources required to deploy and manage Percona Everest on your Kubernetes cluster. 

The Helm chart simplifies the Percona Everest deployment process by packaging the configuration, dependencies, and templates. This streamlined approach ensures that everything can be set up smoothly without any hassle. For more information on Helm, refer to the official [documentation](https://helm.sh/docs/topics/charts/){:target="_blank"}.

## Install Percona Everest using Helm chart

You can install Percona Everest using Helm as an alternative method.
{.power-number}

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

            You can override the name of the database namespace by using the `dbNamespace.namespaceOverride` parameter.

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

[Here](https://github.com/percona/percona-helm-charts/blob/main/charts/everest/README.md#configuration){:target="_blank"} is a list of all the configurable parameters for Percona Everest Helm charts. A few parameters are listed in the following table:

|**Namespace**|**Key**|**Type**|**Default**|**Description**|
|---------|------|---------|------------------|------------|
|everest|`server.initialAdminPassword`|string|""|Initial password configured for admin user.</br></br> If it is not set, a random password is generated. It is recommended to reset the admin password after installation.|
|everest|`server.oidc`|object|{}|OIDC configuration for Everest.</br></br> These settings are applied only during installation. To modify the settings after installation, you have to manually update the everest-settings `ConfigMap`.|
|everest-db-namespace|`pxc`|bool|true| Installs the Percona XtraDB Cluster operator if set.|
|everest-db-namespace|`postgresql`|bool|true| Installs the Percona Postgresql Server operator if set.|
|everest-db-namespace|`psmdb`|bool|true| Installs the Percona Server MongoDB operator if set.|
























