# Uninstall Everest

No matter why you need to uninstall Everest, you can run the commands below to remove all the Everest resources including:

- All Kubernetes objects created by Everest
- All docker containers created by Everest
- All downloaded binaries and files like **everestctl**, **quickstart.yml**.

!!! note alert alert-primary "Warning"
Uninstalling Everest will remove all database clusters and associated data from the Kubernetes cluster! 

Before proceeding with Custom Resource Definitions (CRD) cleanup, check that any custom resources linked with CRDs are removed. This is a crucial step because deleting CRDs can potentially cause issues with any custom resources that depend on those definitions within the cluster.
  Please validate before deleting any CRD as deleting the CRD will break the dependent custom resources (if any) present on the cluster

To uninstall Everest:
{.power-number}

!!! note alert alert-primary "Warning"
Follow these cleanup instructions after unprovisioning Everest via CLI.

1. Remove ALL created database clusters:

    ```sh
    kubectl delete db --all -n percona-everest
    ```
2. Remove ALL PVCs:

    ```sh
    kubectl delete pvc --all -n percona-everest
    ```


3. List CSVs and remove those with a "*percona*" and "*everest*" prefix, or remove ALL operators:

    ```sh
    kubectl delete sub --all -n percona-everest
    kubectl delete ip --all -n percona-everest
    kubectl delete csv --all -n percona-everest
    ```

4. Remove ALL created CRD individually, or use:

    ```sh
     echo $(kubectl get crd -l="operators.coreos.com/percona-server-mongodb-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' &&  kubectl get crd -l="operators.coreos.com/percona-postgresql-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' && kubectl get crd -l="operators.coreos.com/percona-xtradb-cluster-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}') | xargs  kubectl delete crd
    ```

5. Remove Everest OLM catalog:

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/percona-dbaas-catalog.yaml
    ```

6. Remove OLM installation (Do not delete it if it was installed without Everest support):

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/crds.yaml
    ```

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/olm.yaml
    ```

7. Stop docker containers

  ```
     docker-compose -f quickstart.yml down
  ```

8. Remove percona-everest namespace

  ```sh
  kubectl delete ns percona-everest
  ```
