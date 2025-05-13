# Install Percona Everest CLI

!!! info "Important"
    Installing the Percona Everest CLI is only necessary if you want to use it to install Percona Everest; it is **not** required if you prefer to install Percona Everest with Helm.

You can download the latest version of Everest CLI by visiting the latest release page in [this repository](https://github.com/percona/everest/releases/latest){:target="_blank"}.


=== "Linux and WSL"

    To install Everest CLI on Linux or WSL, run the following commands:
    {.power-number}

    1. Download the latest version of Everest CLI.

        ```sh
        curl -sSL -o everestctl-linux-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-linux-amd64
        ```

    2. Install the Everest CLI binary to /usr/local/bin/.

        ```sh
        sudo install -m 555 everestctl-linux-amd64 /usr/local/bin/everestctl
        ```

    3. Remove the Everest CLI binary to clean up.

        ```sh
        rm everestctl-linux-amd64
        ```         

=== "macOS (Apple Silicon)"

    To install Everest CLI on macOS with Apple Silicon, run the following commands:
    {.power-number}

    1. Download the latest version of Everest CLI for Apple Silicon.

        ```sh
        curl -sSL -o everestctl-darwin-arm64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-arm64
        ```

    2. Install the Everest CLI binary to /usr/local/bin/.

        ```sh
        sudo install -m 555 everestctl-darwin-arm64 /usr/local/bin/everestctl
        ```
    3. Remove the Everest CLI binary to clean up

        ```sh
        rm everestctl-darwin-arm64
        ```

=== "macOS (Intel CPU)"

    To install Everest CLI on macOS with an Intel CPU, run the following commands:
    {.power-number}


    1. Download the latest version of Everest CLI for Intel CPUs.

        ```sh
        curl -sSL -o everestctl-darwin-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-amd64
        ```

    2. Install the Everest CLI binary to /usr/local/bin/.

        ```sh
        sudo install -m 555 everestctl-darwin-amd64 /usr/local/bin/everestctl
        ```

    3. Remove the Everest CLI binary to clean up.

        ```sh
        rm everestctl-darwin-amd64
        ```

## Next steps

Start by installing Percona Everest:

[Install Everest :material-arrow-right:](../install/installEverest.md){.md-button}
