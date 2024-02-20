# Uninstall Everest

You can run the commands below to remove all Everest resources including:

- All Kubernetes objects created by Everest
- All downloaded binaries and files like **everestctl**.

!!! note alert alert-primary "Warning"
    Uninstalling Everest will remove all database clusters and associated data from the Kubernetes cluster, including backups!

    Before proceeding with Custom Resource Definitions (CRD) cleanup, check that any custom resources linked with CRDs are removed. This is a crucial step because deleting CRDs can potentially cause issues with any custom resources that depend on those definitions within the cluster.

To uninstall Everest:
{.power-number}


1. Uninstall Everest:

    ```sh
    everestctl uninstall
    ```

3. Remove ALL created database clusters:

    ```sh
    kubectl delete db --all -n percona-everest
    ```

4. Remove ALL backups:

    ```sh
    kubectl -n $EVEREST_NS delete job --all
    kubectl -n $EVEREST_NS delete pxc-backup --all
    kubectl -n $EVEREST_NS delete psmdb-backup --all
    kubectl -n $EVEREST_NS delete pg-backup --all
    kubectl -n $EVEREST_NS delete pod --all     
    ```

5. Remove ALL PVCs:

    ```sh
    kubectl delete pvc --all -n $EVEREST_NS
    ```

6. List CSVs and remove those with a "*percona*" and "*everest*" prefix, or remove ALL operators:

    ```sh
    kubectl delete sub --all -n $EVEREST_NS
    kubectl delete ip --all -n $EVEREST_NS
    kubectl delete csv --all -n $EVEREST_NS
    ```

7. List ALL CRDs that will be removed using the following command. 
Keep in mind that this command will exclusively list CRDs linked to Everest and skip any CRDs associated with standalone Percona Operators. This distinction is crucial because if there are instances of standalone Percona Operators existing within any namespace in your Kubernetes environment, you should avoid inadvertently deleting their CRDs.

    ```sh
    kubectl get crd -l="operators.coreos.com/percona-server-mongodb-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' \
    && kubectl get crd -l="operators.coreos.com/percona-postgresql-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' \
    && kubectl get crd -l="operators.coreos.com/percona-xtradb-cluster-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}'
    ```

8. Remove ALL created CRD individually, or use:

    ```sh
     echo $(\
       kubectl get crd -l="operators.coreos.com/percona-server-mongodb-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' \
       && kubectl get crd -l="operators.coreos.com/percona-postgresql-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' \
       && kubectl get crd -l="operators.coreos.com/percona-xtradb-cluster-operator.percona-everest" --ignore-not-found=true --no-headers | awk '{print $1}' \
    ) | xargs --no-run-if-empty kubectl delete crd
    ```

9. Remove Everest OLM catalog:

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.7.0/data/crds/olm/percona-dbaas-catalog.yaml
    ```

10. Remove OLM installation (Do not delete it if it was installed without Everest support):

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.7.0/data/crds/olm/crds.yaml
    ```

    ```sh
    kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.7.0/data/crds/olm/olm.yaml
    ```

11. Remove percona-everest namespace:

    ```sh
    kubectl delete ns $EVEREST_NS
    ```

12. Remove Everest CRDs:

    ```sh
    kubectl get crd --no-headers -o custom-columns=":metadata.name" \
    | grep 'everest.percona.com$' \
    | xargs --no-run-if-empty kubectl delete crd
    ```
