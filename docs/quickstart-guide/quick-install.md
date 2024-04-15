# Install Percona Everest using the Quick-Install script

## Procedure

As soon as you create a Kubernetes cluster on Amazon Elastic Kubernetes Service (EKS) or Google Kubernetes Engine (GKE), you can install Percona Everest.

For more information, see the [Prerequisites](qs-prerequisites.md) section.
{.power-number}

## Before you start

Before running the commands in the **Installation** section, note that Everest will search for the **kubeconfig** file in the `~/.kube/config` path. If your file is located elsewhere, use the export command below to set the `KUBECONFIG` environment variable:
    
```sh
export KUBECONFIG=~/.kube/config
```

## Installation

1. Install Everest CLI.

    You can download the latest version of Everest CLI by visiting the latest release page in this repository.
    {.power-number}

    === "Linux and WSL"
                        
        ```sh
        curl -sSL -o everestctl-linux-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-linux-amd64
        sudo install -m 555 everestctl-linux-amd64 /usr/local/bin/everestctl
        rm everestctl-linux-amd64       
        ``` 

    === "macOS (Apple Silicon)"
                        
        ```sh
        curl -sSL -o everestctl-darwin-arm64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-arm64
        sudo install -m 555 everestctl-darwin-arm64 /usr/local/bin/everestctl
        rm everestctl-darwin-arm64      
        ```


    === "macOS (Intel CPU)"
                        
        ```sh
        curl -sSL -o everestctl-darwin-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-amd64
        sudo install -m 555 everestctl-darwin-amd64 /usr/local/bin/everestctl
        rm everestctl-darwin-amd64        
        ``` 



2. The Percona Everest app will be available at [http://127.0.0.1:8080](http://127.0.0.1:8080). 

    Now, you can open your browser and create databases in Percona Everest.

    ![!image](../images/everest_site.png)

## Video tutorial

You can also learn about installing Percona Everest via the Quick-Install script by following the video tutorial below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vxhNon-el9Q?si=8toRQZ-Z1-prU9vC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
## Next steps

[Create a database :material-arrow-right:](../use/db_provision.md){.md-button}

<!-- 
[Monitor the database with PMM :material-arrow-right:](../use/monitorDBs.md){.md-button}
-->
