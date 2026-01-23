# What's new in Percona Everest 1.12.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).

## MongoDB Security update: Mitigation of heap memory disclosure vulnerability 

This release fixes security vulnerability [CVE-2025-14847: CWE-130](https://radar.offseq.com/threat/cve-2025-14847-cwe-130-improper-handling-of-length-dd0a4a45) in how MongoDB uses `zlib` compression library. Attackers with network access to `mongod` or `mongos` can extract fragments of uninitialized server memory without authentication if zlib compression is enabled. This memory may contain sensitive data, which poses a serious information disclosure risk. 

### Affected versions

This vulnerability affects the following versions of MongoDB Community Edition and Percona Server for MongoDB:

* Percona Server for MongoDB 8.0.4-1 through 8.0.16-5
* Percona Server for MongoDB 7.0.2-1 through 7.0.26-14
* Percona Server for MongoDB 6.0.2-1 through 6.0.25-20
* Percona Server for MongoDB 5.0.2-1 through 5.0.29-25
* Percona Server for MongoDB 4.4.0-1 through 4.4.29-28
* All Percona Server for MongoDB 4.2 versions
* All Percona Server for MongoDB 4.0 versions
* All Percona Server for MongoDB 3.6 versions

The issue is fixed upstream and is included in Percona Server for MongoDB 7.0.28-15 and 8.0.17-6. We strongly recommend upgrading Percona Server for MongoDB to this latest minor version to ensure your deployments remain secure.

### Workaround 

If upgrading is not possible right away, disable `zlib` compression by configuring `networkMessageCompressors` (or `net.compression.compressors`) in configuration or startup parameters. Safe alternatives are `snappy` or `zstd`. 

To disable `zlib` compression, edit the "Database Engine Parameters" configuration in the "Advanced Configurations" section and set the `net.compression.compressors` parameter as follows:

```yaml
net:
    compression:
    compressors: snappy,zstd
```

Verify that `zlib` is disabled using the `db.adminCommand({ getCmdLineOpts: 1 })`. Ensure logs show no zlib negotiation when you try to connect to the server with a client that explicitly requests `zlib`.

## 🚀 Ready to Upgrade?

Upgrade to **Percona Everest 1.12.0** to benefit from this important security fix.

📖 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.
