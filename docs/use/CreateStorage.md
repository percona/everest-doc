# Prepare storage location

Before working with backups, create a backup location as a backup destination for creating and storing your backup artifacts.  

Everest supports S3-compatible backup locations, which means you can use [AWS S3](https://aws.amazon.com/s3/) or any other storage solutions that support S3 API, like [min.io](https://min.io/).

!!! caution alert alert-warning "Important"

     - Currently, Everest does not support S3 buckets with S3 Object Lock. Make sure your backup destination you are registering does not have S3 Object Lock enabled.
     - Only virtual-hosted style bucket names are supported. This format integrates the bucket name into the domain name in the URL: *https://<span style="color: red;">bucket-name</span>.s3.<span style="color: red;">region-code</span>.amazonaws.com/<span style="color: red;">key-name</span>*
     Path-style bucket name access is not supported. 
     For more information about format access, see [Path-style requests in the Amazon documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/VirtualHosting.html#path-style-access).
     - Make sure you have read/write/delete permissions to the S3 bucket.

To create a backup storage location:
{.power-number}

1. Go to **Settings > Backup storage** and click **Add backup storage**.  
2. In the **Name** field, specify a location name using only lowercase alphanumeric characters or hyphens. 
3. Enter your credentials, making sure to use regional AWS STS endpoints instead of the global endpoint: `https://s3.<region>.amazonaws.com`.
    Using an endpoint that is geographically closer to your application reduces latency and provides better response times.

## Next steps

[Create backups :material-arrow-right:](../use/createBackups/CreateOnDemand.md){.md-button}
[Enable PITR :material-arrow-right:](../use/createBackups/EnablePITR.md){.md-button}