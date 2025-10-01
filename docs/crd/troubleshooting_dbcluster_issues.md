# Troubleshooting database cluster issues

If your database cluster isn’t behaving as expected, start with these checks:
{.power-number}


1. Check cluster status.

    ```
    kubectl describe databasecluster <cluster-name> -n <your namespace>
    ```

2. Check the operator logs.

    ```
    kubectl logs -n <operator-namespace> deployment/everest-operator-controller-manager -n everest-system
    ```









    










