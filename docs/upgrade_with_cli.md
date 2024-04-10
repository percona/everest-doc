# Upgrade Percona Everest using the CLI

Percona Everest regularly releases updates that contain bug fixes, security improvements, and other enhancements to improve the overall performance of your database.


## Before you upgrade

!!! note
     Ensure that you have installed the latest version of the CLI.

Upgrades to Percona Everest are supported from version 0.9.0 onwards. However, you can only upgrade to one version at a time. For instance, you can upgrade from version 0.9.1 to version 0.10.0, but not directly from version 0.8 to version 0.10.  

## Upgrade

During the upgrade of Percona Everest, only Everest and Everest operator are upgraded, whereas the database operators, database clusters and backups remain unchanged.

!!! note
    It is recommended that you create backups of your databases prior to upgrading Percona Everest.

To upgrade Percona Everest using the CLI, execute the following command:

    everestctl upgrade

??? example "Expected output"





## How to address a failed upgrade

If the upgrade fails, you can attempt it again. If the issue persists, [create a GitHub issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-repository).


## After your upgrade is complete

After you successfuly upgrade your Percona Everest version, launch the Everest UI. In this example, this is [http://127.0.0.1:8080](http://127.0.0.1:8080).













