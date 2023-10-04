# Uninstall Everest

No matter why you need to uninstall Everest, you can run the commands below to remove all the Everest resources including:

- All Kubernetes objects created by Everest
- All docker containers created by Everest
- All downloaded binaries and files like **everestctl**, **quickstart.yml**.

!!! note alert alert-primary "Warning"
  Performing these actions will remove all database clusters and data from the Kubernetes cluster
  Please validate before deleting any CRD as deleting the CRD will break the dependent custom resources (if any) present on the cluster

To uninstall Everest:
{.power-number}

!!! note alert alert-primary "Warning"
These cleanup instructions are needed after running unprovisioning of Everest via CLI

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

6. Remove OLM installation:

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/olm.yaml
    ```
   During the run of the command above run

    ```sh
    kubectl delete apiservices.apiregistration.k8s.io v1.packages.operators.coreos.com
    ```

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/crds.yaml
    ```
7. Stop docker containers

  ```
     docker-compose -f quickstart.yml down
  ```

8. Remove percona-everest namespace

  ```sh
  kubectl delete ns percona-everest
  ```
