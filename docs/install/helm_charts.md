# Helm Chart

!!! warning
    Helm Chart is currently in Technical Preview. Early adopters are advised to use this feature only for testing purposes and not in production environments. Future releases may introduce breaking changes, and we cannot guarantee a migration path.



## Helm chart overview

Helm is a package manager for Kubernetes applications.

The Percona Everest Helm chart can be set up with a single command and includes all the resources required to deploy and manage Percona Everest on your Kubernetes cluster. For more information on Helm, refer to the official [documentation](https://helm.sh/docs/topics/charts/){:target="_blank"}.


### Why use Helm chart?

The Helm chart simplifies the Percona Everest deployment process by packaging the configuration, dependencies, and templates. This streamlined approach ensures that everything can be set up smoothly without any hassle.

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

















