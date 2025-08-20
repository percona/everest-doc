# Frequently asked questions (FAQ)

This section outlines the most frequently asked questions (FAQs) about Percona Everest.


## What is DatabaseEngine?

The `DatabaseEngine` is a resource that represents the installed engines (MySQL, MongoDB, PostgreSQL). Each `DatabaseEngine` indicates the operator version currently installed and defines the compatible engine versions for that operator. 

Refer to our [API documentation](https://percona-everest.readme.io/reference/getkubernetesclusterresources-1){:target="_blank"} for usage information.

## Do we have logs of the API calls made?

Yes, the Percona Everest backend has logs. It runs as an `everest-server` deployment within the `everest-system` namespace.

- Accessing these logs helps us verify whether an API call was initiated for a specific user operation.

- Identify any errors that may have occurred during that process.

!!! note
    Percona Everest logs are crucial for troubleshooting issues where an operation has completed, but the corresponding Everest operator resource was not created.

You can retrieve the logs from the pods associated with this deployment.

To access them, run:

```sh
kubectl logs -f deploy/percona-everest -n everest-system
```


## How to troubleshoot issues between the UI and the Percona Everest API? 

You can view the logs by running the following command:

```sh
kubectl logs -f deploy/percona-everest -n everest-system
```

## How do I find out which component is not working?

All communication with Percona Everest resources begins with the API.

The API is responsible for updating Everest resources, while the Everest operator continues to create resources for the corresponding database operators. 

### Troubleshooting flow

When debugging, start with the API, proceed to the Everest operator, and examine the individual database operators.


## Does Percona Everest deploy PMM servers?

Percona Everest doesn't deploy PMM (Percona Monitoring and Management). However, you can deploy a PMM server while installing Percona Everest. You need to set `pmm.enabled=true`. 

We configure PMM agents in each DB deployment to communicate with an existing PMM server.

The following table shows the [configurable parameters](https://github.com/percona/percona-helm-charts/tree/main/charts/everest#configuration){:target="_blank"} of Percona Everest chart and their default values.

The important points are:

- `MonitoringConfig` contains all necessary details to connect to the PMM Server, including URL and API key.

-  An API key is generated to facilitate data transmission. This API key allows us to configure monitoring endpoints for individual database operators, enabling them to send data to PMM.

!!! note
    PMM is an external service we support.