# Frequently asked questions (FAQ)

This section outlines the most frequently asked questions (FAQs) about Percona Everest.


## What is DatabaseEngine?

Provide an example of **Database Engine Operations**. Does it manage database operators, such as upgrades, or is it related to Percona Everest resources?
    
**Answer:**
The `DatabaseEngine` is a resource that contains compatible PG/PXC/MongoDB versions for the current Percona Everest version. This information can be retrieved and updated.

Refer to our [API documentation](https://percona-everest.readme.io/reference/getkubernetesclusterresources) for in-depth information.

### Do we have logs of the API calls made?

- Accessing these logs will enable us to confirm whether an API call was initiated for a specific user operation and to identify any errors that may have occurred during that process.

    **Answer:**
    Yes, the Percona Everest backend has logs. It runs as a `percona-everest` deployment within the `everest-system `namespace. 

    !!! Note
        Percona Everest logs are crucial for troubleshooting issues where an operation is completed, but the corresponding Everest operator resource hasn't been created for some reason. 

- Where are these logs stored?

    **Answer:**
    You can retrieve the logs from the pods associated with this deployment.


### Do we have any logs for front end actions to troubleshoot issues between the front end and the Percona Everest API? 

**Answer:**
You can view these logs in the console of your web browser.

### Are there any resources that are not a part of the Percona Everest operator image that we need to troubleshoot?

- Is there a resource that receives API calls and interacts with individual resources that we should check for troubleshooting and logs when issues arise?

- Does the Percona Everest API communicate directly with the Percona Everest operator resources? 

- Should we correlate the **Percona operator** issue with the corresponding Percona Everest resource and address the problem from that point?

    **Answer:**
    All communication with Everest resources begins with the API.

    The API is responsible for updating Everest resources, while the Everest operator continues to create resources for the corresponding database operators. When debugging, start with the API, then proceed to the Everest operator, and finally examine the individual database operators.


### Does Percona Everest deploy PMM servers?

While `MonitorConfig` is present, does this resource interact directly with each `pmm-agent` container on the database pods, deploy new PMM Servers, and modify their configuration?

**Answer:**

Percona Everest doesn't deploy PMM. Instead, we configure PMM agents in each DB deployment to communicate with an existing PMM server.

When communicating with PMM, we generate an API key to facilitate data transmission. This API key allows us to configure monitoring endpoints for individual database operators, enabling them to send data to PMM.

!!! note
    PMM is an external service we support and does not necessarily fit into our architecture.
