# Prepare storage location

Before working with backups, create a backup location as a backup destination for creating and storing your backup artifacts.  

Everest supports S3-compatible backup locations, which means you can use [AWS S3](https://aws.amazon.com/s3/) or any other storage solutions that support S3 API, like [min.io](https://min.io/).

!!! caution alert alert-warning "Important"

     - Currently, Everest does not support S3 buckets with S3 Object Lock. Make sure your backup destination you are registering does not have S3 Object Lock enabled.

     - Make sure you have read/write/delete permissions to the S3 bucket.

To create a backup storage location:
{.power-number}

1. Go to **Settings > Backup storages** and click **Add Backup storage**.  
2. In the **Name** field, specify a location name using only lowercase alphanumeric characters or hyphens. 
3. Select the **Namepaces** where the backup storage should be available.
4. Enter your credentials, making sure to use regional AWS STS endpoints instead of the global endpoint: `https://s3.<region>.amazonaws.com`.
    Using an endpoint that is geographically closer to your application reduces latency and provides better response times.

## Next steps

[Create backups :material-arrow-right:](../use/createBackups/CreateOnDemand.md){.md-button}
[Enable PITR :material-arrow-right:](../use/createBackups/EnablePITR.md){.md-button}