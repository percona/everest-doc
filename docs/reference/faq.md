# Frequently asked questions (FAQ)

This section outlines the most frequently asked questions (FAQs) about Percona Everest.


???+ Question "What is DatabaseEngine?"

    Provide an example of **Database Engine Operations**. Does it manage database operators, such as upgrades, or is it related to Percona Everest resources?
    
    **Answer:**
    The `DatabaseEngine` is a resource that contains compatible PG/PXC/MongoDB versions for the current Everest version. This information can be retrieved and updated.

    Refer to our [API documentation](https://percona-everest.readme.io/reference/getkubernetesclusterresources) for in-depth information.

???+ Question "Do we have logs of the API calls made?"

    - This will help us validate whether an API call was made for a user operation and whether any errors occurred during the process. 
    
    !!! Note
        This is crucial for troubleshooting issues where an operation is completed, but the corresponding Everest operator resource hasn't been created for some reason. 

        **Answer:**
        Yes, the Everest backend has logs. It runs as a `percona-everest` deployment within the `everest-system `namespace. 


    - If we have these logs, where are they stored?

        **Answer:**
        You can retrieve logs from the pods associated with this deployment.


???+ Question "Do we have any logs for frontend actions, like nginx logs, to troubleshoot issues between the frontend and the Percona Everest API" 

    **Answer:**
    The logs will be accessible in the console of the web browser.

???+ Question "Are there any additional resources that are not included in the image?"

    For instance, is there a resource that handles the API calls and interacts with individual resources? Should we check its logs for troubleshooting when issues arise? Alternatively, does the Everest API communicate directly with the Everest operator resources? In that case, should we match the "Percona operator" issue with the corresponding Everest resource and address the problem from there?


    **Answer:**
    All communication with Everest resources begins with the API.

    The API is responsible for updating Everest resources, while the Everest operator continues to create resources for the corresponding database operators. When debugging, start with the API, then proceed to the Everest operator, and finally examine the individual database operators.


???+ Question "Why PMM appears to be absent in this context?"

    While `MonitorConfig` is present, does this resource interact directly with each `ppm-agent` container on the database pods, deploy new PMM Servers, and modify their configuration?

    **Answer:**
    When communicating with PMM, we generate an API key to facilitate data transmission. This API key allows us to configure monitoring endpoints for individual database operators, enabling them to send data to PMM.

    !!! note
        PMM is an external service we support and does not necessarily fit into our architecture.
