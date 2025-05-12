# Percona Everest API

Percona Everest provides a set of APIs that enable you to access its features programmatically. These APIs provide a convenient and efficient way for developers to interact with the various functionalities of Percona Everest. 

## Using the API

The API is accessible on the same host and port as the Percona Everest Web UI. You can find detailed information about connecting to the Percona Everest Web UI in the [installation guides](install/installEverest). For instance, if you are connecting to your Percona Everest instance using port forwarding:

```sh
kubectl port-forward svc/everest 8080:8080 -n everest-system
```

You can then connect to the API via the `http://127.0.0.1:8080 endpoint`.

### Authentication

Currently, the API only supports authentication via a JWT token. You can obtain this JWT token from the Web UI after logging in. The JWT token is stored in the everestToken variable within the browser's local storage.

## Readme.io API documentation

While you can achieve many tasks using either the Percona Everest user interface or CLI, leveraging the API allows for easier integration into your technology infrastructure.

Check out our API endpoints for Percona Everest, where you can perform a wide range of functions.

To access the API documentation, click [Percona Everest API](https://percona-everest.readme.io/){:target="_blank"}.


