# Prepare storage location

Before working with backups, create a backup location as a backup destination for creating and storing your backup artifacts.  

Everest supports S3-compatible backup locations, which means you can use [AWS S3](https://aws.amazon.com/s3/) or any other storage solutions that support S3 API, like [min.io](https://min.io/).

!!! caution alert alert-warning "Important"

     - Currently, Everest does not support S3 buckets with S3 Object Lock. Make sure your backup destination you are registering does not have S3 Object Lock enabled.

     - Make sure you have read/write/delete permissions to the S3 bucket.

To create a backup storage location:
{.power-number}

1. Go to **Settings:

    Navigate to **Settings > Backup storages**, then click **Add Backup storage**.

2. Fill in the Required Fields:
   - **Name**: Enter a name using only lowercase letters, numbers, or hyphens.
   - **Description**: (Optional) Add a short description for this backup storage.
   - **Namespace**: Select where this backup storage will be available.
   - **Type**: Choose S3 Compatible.
   - **Bucket Name**: Provide the S3 bucket name where backups will be stored.
   - **Region**: Specify the bucket's region (e.g., us-east-1).
   - **Endpoint**: Enter the S3-compatible URL (e.g., https://s3.us-east-1.amazonaws.com).
   - **Access Key**: Input the access key for your S3 account.
   - **Secret Key**: Input the corresponding secret key.

3. Additional Options:
   - **Verify TLS Certificate**: Enable this to validate secure connections.
   - **Force Path-Style URL Access**: Use this if your storage provider uses path-style URLs.

4. Click **Add** to save your configuration.

## Next steps

[Create backups :material-arrow-right:](../use/createBackups/CreateOnDemand.md){.md-button}
[Enable PITR :material-arrow-right:](../use/createBackups/EnablePITR.md){.md-button}