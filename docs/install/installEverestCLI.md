# Install Everest CLI

You can download the latest version of Everest CLI by visiting the latest release page in [this repository](https://github.com/percona/percona-everest-cli/releases/latest).

## Linux and WSL
    
```sh
curl -sSL -o everestctl-linux-amd64 https://github.com/percona/percona-everest-cli/releases/latest/download/everestctl-linux-amd64
sudo install -m 555 everestctl-linux-amd64 /usr/local/bin/everestctl
rm everestctl-linux-amd64
```

## macOS (Apple Silicon)

```sh
curl -sSL -o everestctl-darwin-arm64 https://github.com/percona/percona-everest-cli/releases/latest/download/everestctl-darwin-arm64
sudo install -m 555 everestctl-darwin-arm64 /usr/local/bin/everestctl
rm everestctl-darwin-arm64
```

## macOS (Intel CPU)

```sh
curl -sSL -o everestctl-darwin-amd64 https://github.com/percona/percona-everest-cli/releases/latest/download/everestctl-darwin-amd64
sudo install -m 555 everestctl-darwin-amd64 /usr/local/bin/everestctl
rm everestctl-darwin-amd64
```
