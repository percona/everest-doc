# Upgrade Percona Everest using the CLI

Percona Everest regularly releases updates that contain bug fixes, security improvements, and other enhancements to improve the overall performance of your database.


## Prerequisites

Ensure that you have installed the latest version of the CLI.

  
## Upgrade

You can upgrade Percona Everest using the CLI.

To upgrade Percona Everest, execute the following command:

    everestctl upgrade

??? example "Expected output"


To upgrade Percona Everest with the **Debug** mode on, execute the following command:

        everestctl -v upgrade

??? example "Expected output"



## How to address a failed upgrade

If the upgrade fails, you can attempt it again. If the issue persists, [create a GitHub issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-a-repository).


## After your upgrade is complete

After you successfuly upgrade your Percona Everest version, launch the Everest UI. In this example, this is [http://127.0.0.1:8080](http://127.0.0.1:8080).














