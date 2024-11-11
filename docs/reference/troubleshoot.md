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


### Percona Everest installation

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/) to manage the operators. OLM is deployed explicitly to the `everest-olm` namespace. 

The main components are:

- olm-operator
- catalog-operator
- packageserver

    
1. When you install Percona Everest, the `olm-operator`, `catalog-operator`, and  `packageserver` gets installed in the `everest-olm` namespace:

    Execute the following command, all the three deployments should be present in the `everest-olm` namespace

    ```
    $ kubectl get deploy -n everest-olm
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    olm-operator       1/1     1            1           5m38s
    catalog-operator   1/1     1            1           5m37s
    packageserver      2/2     2            2           3m2s
    ```
    
2. Next,  the `everest-catalog` is installed, which serves as the repository for all the operators that Percona Everest supports. 

    Execute the following command, `everest-catalog` should be present in the `everest-olm` namespace:

    ```sh
    kubectl get catalogsources -n everest-olm
    NAME              DISPLAY           TYPE   PUBLISHER   AGE
    everest-catalog   Everest Catalog   grpc   Percona     6m5s
    ```

#### OLM subscription

The process of installing an operator with OLM (Operator Lifecycle Manager) begins with creating a [subscription](https://olm.operatorframework.io/docs/concepts/crds/subscription/). OLM will reconcile this subscription and generate an installation plan. Once the installation plan is approved, OLM will create a Cluster Service Version (CSV), which installs everything necessary for the operator to function properly.


In addition to OLM, Everest consists of five different operators:

- Everest
- VictoriaMetrics
- Percona Operator for MySQL (PXC)
- Percona Operator for MongoDB (PSMDB)
- Percona Operator for PostgreSQL (PG)

=== "Everest"
    The Everest Operator is always installed to the `everest-system` namespace. If the operator is installed properly, you should find a subscription, an install plan and a cluster service version for this operator:

    ??? example "Examples"
        ```sh
        $ kubectl get sub -n everest-system
        NAME               PACKAGE            SOURCE            CHANNEL
        everest-operator   everest-operator   everest-catalog   stable-v0
        ```

        ```
        $ kubectl get ip -n everest-system
        NAME            CSV                       APPROVAL   APPROVED
        install-69g62   everest-operator.v0.10.1  Manual     true
        ```

        ```
        $ kubectl get csv -n everest-system
        NAME                      DISPLAY            VERSION   REPLACES                   PHASE
        everest-operator.v0.10.1  Everest operator   0.10.1    everest-operator.v0.9.0    Succeeded
        ```

        ```
        $ kubectl get deploy -n everest-system
        NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
        everest-operator-controller-manager   1/1     1            1           12m
        percona-everest                       1/1     1            1           11m
        ```
    
        !!! note

            In the last command, besides the Everest operator, you also see the `percona-everest` deployment in the `everest-system `namespace; this is the Percona Everest UI/API deployment.


=== "VictoriaMetrics"
    We use the Victoria Metrics stack along with kube-state-metrics for monitoring. Both can be found in the `everest-monitoring` namespace.

    ??? example "Examples"
        ```
        $ kubectl get sub -n everest-monitoring
        NAME                   PACKAGE                    SOURCE            
        CHANNEL
        victoriametrics-operator   victoriametrics-operator   everest-  
        catalog   stable-v0
        ```

        ```
        $ kubectl get ip -n everest-monitoring
        NAME            CSV                                APPROVAL   
        APPROVED
        install-nw6sf   victoriametrics-operator.v0.29.1   Manual     true
        ```
        
        ```
        $ kubectl get csv -n everest-monitoring
        NAME                               DISPLAY                    
        VERSION   REPLACES                           PHASE
        victoriametrics-operator.v0.29.1   VictoriaMetrics Operator  0.29.1  
        victoriametrics-operator.v0.27.2   Succeeded
        ```

        ```
        $ kubectl get deploy -n everest-monitoring
        NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
        vm-operator-vm-operator   1/1     1            1           19m
        kube-state-metrics        1/1     1            1           19m
        ```








