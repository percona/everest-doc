# Uninstall Everest

No matter why you need to uninstall Everest, you can run the commands below to remove all the Everest resources including: 

- All Kubernetes objects created by Everest
- All docker containers created by Everest
- All downloaded binaries and files like **everestctl**, **quickstart.yml**.


To uninstall Everest: 

1. Remove ALL PVCs: `kubectl delete pvc --all -n percona-everest`
2. Remove ALL created database clusters: `kubectl delete db --all -n percona-everest`
3. List CSVs and remove those with a "*percona*" and "*everest*" prefix, or remove ALL operators:
```sh 
kubectl delete sub --all -n percona-everest
kubectl delete ip --all -n percona-everest
kubectl delete csv --all -n percona-everest
```
4. Remove ALL created CRD individually, or use: `kubectl get crd -n percona-everest -o name | grep .percona.com$ | awk -F '/' {'print $2'} | xargs --no-run-if-empty kubectl delete crd -n percona-everest`

5. Remove Everest OLM catalog: `kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/percona-dbaas-catalog.yaml`

6. Remove OLM installation:
- `kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/olm.yaml`
- `kubectl delete -f https://raw.githubusercontent.com/percona/percona-everest-cli/v0.3.0/data/crds/olm/crds.yaml`