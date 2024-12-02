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

        1. This command deploys the Percona Everest components in the `everest-system` namespace. Currently, specifying a different namespace for Percona Everest is not supported.

        2. It also deploys a new namespace called `everest` for your databases and the database operators.

        3. You can override the name of the database namespace by using the `dbNamespace.namespaceOverride` parameter.

        4. All database operators are installed in your database namespace by default. You can override this by specifying one or more of the following options: `[dbNamespace.pxc=false, dbNamespace.pg=false, dbNamespace.psmdb=false]`.

        5. Installation without chart hooks is currently not supported. The use of `--no-hooks` during installation is not supported.
















