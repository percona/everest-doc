# Frequently asked questions

**What is the DatabaseEngine and what is an example of the "Database Engine Operations". Is that where it manages the database operators and an example would be upgrading the operator? Or is that Everest resources or something?**

You can refer to our API documentation at https://percona-everest.readme.io/reference/getkubernetesclusterresources
The DatabaseEngine is a resource which holds the PG/PXC/Mongo versions compatible with the current Everest version. You can retrieve and update this information.

**Everest API: Do we have any logs of the API calls done, so we can validate if an API call was done for a user operation, and if it received any errors (to troubleshoot problems where an operation is done but the respective Everest operator resource is not created for some reason)? If yes, where are they stored?**

Yes, there are logs in the Everest backend. It runs as a "percona-everest" deployment in the "everest-system" namespace.

You can get logs from the pods associated with the deployment.

**Frontend: Do we have any logs for the frontend actions (nginx logs or something similar) to troubleshoot problems between Frontend -> Everest API**

Such logs would be available in the web browser's console.

**Regarding the Everest operator part of the image: are there any other resources that are not in the image? For example, is there a resource that receives the API calls and interacts with the individual resources that we should look to troubleshoot/check its logs when issues arise or does the Everest API directly interact with those Everest operator resources, and we should just match the "Percona operator" issue with the responsible Everest resource and go from there?**

All communication with the Everest resources starts with the API.

The API updates Everest resources and Everest operator continues to create resources for the respective db operators. Debugging shall start with the API, then the Everest operator and then individual database operators.

**PMM seems to be missing in this. We see they have MonitorConfig, but does this resource directly interact with each ppm-agent container on database pods as well as deploy new PMM Servers and modify its configuration?**

When talking to PMM, we create an API key to send data to PMM.

The API key is used to configure monitoring endpoints for individual database operators and they send data to PMM.

PMM does not necessarily have a place in the architecture - it's an external service we support.