# Create Kubernetes cluster on Google Kubernetes Engine (GKE)

## Prerequisites

All commands from this guide can be run either in the **Google Cloud shell** or in **your local shell**.

To use *Google Cloud shell*, you need nothing but a modern web browser.

If you would like to use *your local shell*, install the following:

1. [gcloud](https://cloud.google.com/sdk/docs/quickstarts). This tool is
    part of the Google Cloud SDK. To install it, select your operating
    system on the [official Google Cloud SDK documentation page](https://cloud.google.com/sdk/docs)
    and then follow the instructions.

2. [kubectl](https://cloud.google.com/kubernetes-engine/docs/quickstart#choosing_a_shell).
    It is the Kubernetes command-line tool you will use to manage and deploy
    applications. To install the tool, run the following command:

    ``` {.bash data-prompt="$" }
    $ gcloud auth login
    $ gcloud components install kubectl
    ```