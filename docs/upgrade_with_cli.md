# Upgrade Percona Everest using the CLI

Percona Everest regularly releases updates that contain bug fixes, security improvements, and other enhancements to improve the overall performance of your database.


## Before you upgrade

!!! note
     It is recommended to install the latest version of the CLI .

You need to download CLI version >=0.10.0 for the upgrade command to work. You can only upgrade one minor version at a time. For instance, you can upgrade from version 0.9.0 to version 0.10.0, but not directly from version 0.8.0 to version 0.10.0.  

## Upgrade

!!! note
    It is recommended that you create backups of your databases prior to upgrading Percona Everest.

During the upgrade of Percona Everest, only Everest and Everest operator are upgraded, whereas the database operators, database clusters and backups remain unchanged.
{.power-number}

1. To upgrade Percona Everest using the CLI, execute the following command:

    ```sh
    everestctl upgrade
    ```

    ??? example "Expected output"
        ```
        ./everestctl_0.10.0 upgrade --version-metadata-url https://check-dev.percona.com
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

2. After upgrading, refresh the Percona Everest UI to access the new version.


## How to address a failed upgrade

If the upgrade fails, you can attempt it again. If the issue persists, [create a GitHub issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-repository).


## After your upgrade is complete

After upgrading your Percona Everest version, follow the instructions in step 3 and step 4 of the [installation](install/installEverest.md) section. 













