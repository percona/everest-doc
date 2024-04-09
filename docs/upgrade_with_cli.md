# Upgrade Percona Everest using the CLI

Percona Everest regularly releases updates that contain bug fixes, security improvements, and other enhancements to improve the overall performance of your database.


## Before you upgrade

!!! note
     Ensure that you have installed the latest version of the CLI.

Percona Everest supports upgrading to the next version only starting from version 0.9.0. For instance, you can upgrade from version 0.9 to version 0.10.0. However, upgrading directly from version 0.8 to version 0.10 or from version 0.8.0 to 0.9.0 is not possible.
  
## Upgrade

During the upgrade of Percona Everest, only Everest and Everest operators are upgraded, whereas the databases and backups remain unchanged.

!!! note
    It is recommended that you create backups of your databases prior to upgrading Percona Everest.

To upgrade Percona Everest using the CLI, execute the following command:

    everestctl upgrade

??? example "Expected output"


To upgrade Percona Everest with the **Debug** mode on, execute the following command:

    everestctl -v upgrade

??? example "Expected output"



## How to address a failed upgrade

If the upgrade fails, you can attempt it again. If the issue persists, [create a GitHub issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-repository).


## After your upgrade is complete

After you successfuly upgrade your Percona Everest version, launch the Everest UI. In this example, this is [http://127.0.0.1:8080](http://127.0.0.1:8080).














