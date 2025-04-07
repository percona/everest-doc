# Edit backup storage


To create a backup storage location:
{.power-number}

1. Go to Backup storage settings:

    Navigate to <i class="uil uil-cog"></i> **Settings > Backup storages**, then click **Add Backup storage**.

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