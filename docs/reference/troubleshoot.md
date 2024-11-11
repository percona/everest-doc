# Troubleshooting strategies for Percona Everest


This section is your go-to resource for tackling common issues and finding solutions. For additional troubleshooting tips and known issues, see the Percona Everest [Release Notes](../release-notes/release_notes_index.md) and [known limitations](../reference/known_limitations.md) section.


## Troubleshooting checklist

Here’s a high level checklist to help you identify some potential issues you might encouner while using Percona Everest.
{.power-number}

1. Are you using the recommended Percona Everest and compatible operator versions?
2. Did you check the known issues section in the [Release Notes](../release-notes/release_notes_index.md) for that particular Percona Everest release?

3. Do the logs contain any messages about the problem? See Message logs and Trace logs for more information.
4. Does the problem occur while you deploy a specific database?
5. Does the problem occur when you perform a particular task, like backups, restores etc?
6. Are you using the [authentication](../administer/Idp_integration.md) correctly?
7. Have you allocated enough resources for deploying your databases on Percona Everest?
8. Are you using a Technical Preview feature? Technical Preview features are not production-ready and should only be used in testing environments. For more information, see the relevant [Release Notes](../release-notes/release_notes_index.md).



## Troubleshooting topics

We have organized the topics into distinct categories to assist you in exploring the information more easily. 


### Installation

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/) to manage the operators. OLM is deployed explicitly to the `everest-olm` namespace. 

The main components are:

- olm-operator
- catalog-operator
- packageserver

??? example "What happens under the hood"
    
    1. When you install Percona Everest, the `olm-operator`, `catalog-operator`, and  `packageserver` gets installed in the `everest-olm` namespace:

    Running the following command, will list all deployments in the everest-olm namespace

        ```
        $ kubectl get deploy -n everest-olm
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    olm-operator       1/1     1            1           5m38s
    catalog-operator   1/1     1            1           5m37s
    packageserver      2/2     2            2           3m2s
    ```
    2. Next,  the `everest-catalog` is installed, which serves as the repository for all the operators that Percona Everest supports. 

    Running the following command will list all `CatalogSources` in the `everest-olm ` namespace:

    ```sh
    kubectl get catalogsources -n everest-olm
    NAME              DISPLAY           TYPE   PUBLISHER   AGE
    everest-catalog   Everest Catalog   grpc   Percona     6m5s
    ```

