# Upgrade Percona Everest using the CLI

Percona Everest regularly releases updates that contain bug fixes, security improvements, and other enhancements to improve the overall performance of your database.


## Before you upgrade

!!! note
     It is recommended to install the latest version of the CLI .

You can only upgrade one minor version at a time. For instance, you can upgrade from version 1.0.0 to version 1.1.0 but you cannot directly upgrade from version 1.0.0 to version 1.2.0.  

## Upgrade

!!! note
    It is recommended that you create backups of your databases prior to upgrading Percona Everest.

During the upgrade of Percona Everest, only Everest and Everest operator are upgraded, whereas the database operators, database clusters and backups remain unchanged.
{.power-number}

1. If you are using everestctl v1.1.0 or newer to upgrade from a version prior to v1.0.0, you need to execute the following command:

        kubectl get deployments everest-operator-controller-manager -n everest-system -o jsonpath='{.spec.template.spec.containers[?(@.name=="manager")].env[?(@.name=="DB_NAMESPACES")].value}' | tr ',' '\n' | xargs -I {} kubectl label namespaces {} app.kubernetes.io/managed-by=everest

2. To upgrade Percona Everest, use the following command:

    ```sh
    everestctl upgrade
    ```

    ??? example "Expected output"
        ```
        everestctl upgrade
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:156  Current Everest version is 0.9.1        {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:164  Found available upgrade to Everest version 0.10.0   {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:167  Checking requirements for upgrade to Everest 0.10.0 {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:310  Checking cli version requirements       {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:339  Checking operator requirements in namespace n1  {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:121  Upgrading Percona Catalog to 0.10.0 {"component": "upgrade"}
        2024-05-03T12:06:47Z    info    upgrade/upgrade.go:130  Waiting for install plan for Everest operator   {"component": "upgrade"}
        2024-05-03T12:07:14Z    info    upgrade/upgrade.go:139  Upgrading Everest to 0.10.0 in namespace everest-system     {"component": "upgrade"}
        2024-05-03T12:07:26Z    info    upgrade/upgrade.go:400  Approving install plan install-nv76r for Everest operator       {"component": "upgrade"}
        2024-05-03T12:07:26Z    info    upgrade/upgrade.go:406  Waiting for install plan installation of Everest operator to finish     {"component": "upgrade"}
        2024-05-03T12:07:28Z    info    upgrade/upgrade.go:148  Everest has been upgraded to version 0.10.0 {"component": "upgrade"}
        ```

3. After upgrading, refresh the Percona Everest UI to access the new version.


### Upgrading to Percona Everest 1.2.0

When upgrading to 1.2.0 using the CLI command `everestctl upgrade`, all your existing backup storages and monitoring instances will be automatically migrated to the namespaces specified in their `.spec.allowedNamespaces` fields.

Following the upgrade, your databases should not experience any downtime. Your backup, restore, and monitoring functionalities should continue to operate normally. 

In the unlikely event that your upgrade fails, and you need to manually migrate these resources, follow the in the []() section.


## How to address a failed upgrade

If the upgrade fails, you can attempt it again. If the issue persists, [create a GitHub issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-repository).

### How to resolve upgrade failures in Percona Everest 1.2.0

In the unlikely event that your upgrade fails and you need to manually migrate these resources, follow the steps below:
{.power-number}

1. List the existing backup-storages:

    ```
    kubectl get backupstorages -n everest-system -oyaml > new-backupstorages.yaml
    ```

2. Check whether the backup storage has been retrieved.

    ```sh
    cat new-backupstorages.yaml

    apiVersion: everest.percona.com/v1alpha1
    kind: BackupStorage
    metadata:
    name: s3
    namespace: everest-system
    spec:
    allowedNamespaces:
    - my-cool-namespace
    - another-cool-namespace
    bucket: my-cool-bucket
    credentialsSecretName: s3
    description: s3
    endpointURL: https://s3.us-west-2.amazonaws.com
    forcePathStyle: false
    region: us-west-2
    type: s3
    verifyTLS: true
    ```

    !!! note
        You may see more than one object, depending on the number of objects created.


3. Edit `new-backupstorages.yaml` as follows:

    a. For each `BackupStorage` retrieved, create a copy in each namespace specified under `.spec.allowedNamespaces`.
    b. Remove (or unset) `.spec.allowedNamespaces` in each copy of the `BackupStorages` object.
    c. Ensure that `.metadata` contains only `name` and `namespace`.

    ??? example "Example"
        ```sh
        apiVersion: everest.percona.com/v1alpha1
        kind: BackupStorage
        metadata:
        name: s3
        namespace: my-cool-namespace
        spec:
        allowedNamespaces: []
        bucket: my-cool-bucket
        credentialsSecretName: s3
        description: s3
        endpointURL: https://s3.us-west-2.amazonaws.com
        forcePathStyle: false
        region: us-west-2
        type: s3
        verifyTLS: true
        ---
        apiVersion: everest.percona.com/v1alpha1
        kind: BackupStorage
        metadata:
        name: s3
        namespace: another-cool-namespace
        spec:
        allowedNamespaces: []
        bucket: my-cool-bucket
        credentialsSecretName: s3
        description: s3
        endpointURL: https://s3.us-west-2.amazonaws.com
        forcePathStyle: false
        region: us-west-2
        type: s3
        verifyTLS: true
        ```



## After your upgrade is complete

After upgrading your Percona Everest version, follow the instructions in step 3 and step 4 of the [installation](install/installEverest.md) section. 














