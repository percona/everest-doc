# Install Percona Everest CLI

You can download the latest version of Everest CLI by visiting the latest release page in [this repository](https://github.com/percona/everest/releases/latest).

## Linux and WSL

To install Everest CLI on Linux or WSL, run the following commands:

```bash
# Download the latest version of Everest CLI
curl -sSL -o everestctl-linux-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-linux-amd64

# Install the Everest CLI binary to /usr/local/bin/
sudo install -m 555 everestctl-linux-amd64 /usr/local/bin/everestctl

# Remove the Everest CLI binary to clean up
rm everestctl-linux-amd64
```

## macOS (Apple Silicon)

To install Everest CLI on macOS with Apple Silicon, run the following commands:

```bash
# Download the latest version of Everest CLI for Apple Silicon
curl -sSL -o everestctl-darwin-arm64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-arm64

# Install the Everest CLI binary to /usr/local/bin/
sudo install -m 555 everestctl-darwin-arm64 /usr/local/bin/everestctl

# Remove the Everest CLI binary to clean up
rm everestctl-darwin-arm64
```

## macOS (Intel CPU)

To install Everest CLI on macOS with an Intel CPU, run the following commands:

```bash
# Download the latest version of Everest CLI for Intel CPUs
curl -sSL -o everestctl-darwin-amd64 https://github.com/percona/everest/releases/latest/download/everestctl-darwin-amd64

# Install the Everest CLI binary to /usr/local/bin/
sudo install -m 555 everestctl-darwin-amd64 /usr/local/bin/everestctl

# Remove the Everest CLI binary to clean up
rm everestctl-darwin-amd64
```

### Next steps

Start by installing Percona Everest: 

[Install Everest :material-arrow-right:](installEverest.md){.md-button}

