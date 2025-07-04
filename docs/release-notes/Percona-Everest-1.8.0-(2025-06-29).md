# 📦 What's new in Percona Everest 1.8.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Expand to unleash the key updates"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[GKE Autopilot clusters](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_1)|Deploy Percona Everest on Google Kubernetes Engine (GKE) Autopilot clusters|
    | **2.**|[Pod Scheduling policies](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_2)|Pod Scheduling for optimized Kubernetes scheduling¶|
    | **3.**|[TLS support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_3)|Improved Security with TLS support|
    | **4.**|[Operator Upgrades](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#__tabbed_1_4)|Support for Percona XtraBackup Operator 1.17.0|
    | **5.**|[Breaking Changes](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#breaking-changes)|Learn about the breaking changes introduced in Percona Everest 1.7.0|
    | **6.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#new-features)|Check out the new features introduced in Percona Everest 1.7.0|
    | **7.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.7.0|
    | **8.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#bug-fixes)|Find out about all the bugs fixed in Percona Everest 1.7.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.7.0-%282025-05-29%29.html#known-limitation)|Discover all the known limitations in Percona Everest 1.7.0|


## 🌟 Release highlights

=== ":material-database-import: Seamlessly import external backups into Percona Everest clusters"

Starting with Percona Everest 1.8.0, we are excited to roll out a new feature that enables you to directly import database backups from external object storage into clusters managed by Percona Everest. This feature leverages an extensible framework that simplifies your backup process.

=== " :simple-mongodb: MongoDB"
    
    ### Support for PSMDB operator v1.20.1

    Percona Everest 1.8.0 now includes support for PSMDB operator version 1.20.1.



### OIDC Integration with Microsoft Entra ID

If you are using Microsoft Entra ID as your OIDC provider for Percona Everest, please be aware of a breaking change in the way access tokens are validated. 

The access tokens issued by Microsoft Entra ID must now include the `aud` claim with the value set to the correct application identifier. This can be achieved by requesting the `<your-app-client-id>/.default` scope when obtaining the access token.
Please ensure you configure Everest's OIDC settings requesting the correct scope to avoid any disruptions in your authentication flow:

```sh
everestctl settings oidc configure \
--issuer-url=http://url.com \
--client-id=<your-app-client-id> \
--scopes=openid,profile,email,<your-app-client-id>/.default
```

📘 For detailed information, see our [documentation](https://docs.percona.com/everest/reference/known_limitations.html#oidc-integration-with-microsoft-entra).

## New Features

- [EVEREST-1908](https://perconadev.atlassian.net/browse/EVEREST-1908) Add support for PSMDB operator v1.20.1

- [EVEREST-2068](https://perconadev.atlassian.net/browse/EVEREST-2068) DataImporter for PGRestore

- [EVEREST-2069](https://perconadev.atlassian.net/browse/EVEREST-2069) DataImporter for PXCRestore

- [EVEREST-2070](https://perconadev.atlassian.net/browse/EVEREST-2070) DataImporter for PSMDBRestore


## Improvements

[EVEREST-1806](https://perconadev.atlassian.net/browse/EVEREST-1806) \[UI\] Improve Visibility of Proxy Validation Message for MySQL Database Creation 

[EVEREST-1909](https://perconadev.atlassian.net/browse/EVEREST-1909) Prevent duplicate IP/Netmask entries for external access in DB clusters

[EVEREST-1946](https://perconadev.atlassian.net/browse/EVEREST-1946) Add confirmation dialog before performing disk size update

[EVEREST-1958](https://perconadev.atlassian.net/browse/EVEREST-1958)  \[UI\] Auto-expand sections containing fields with error when revisiting a wizard step

[EVEREST-1964](https://perconadev.atlassian.net/browse/EVEREST-1964) \[UI\] Change label in basic details widget 

[EVEREST-2002](https://perconadev.atlassian.net/browse/EVEREST-2002) \[Helm Upgrade Flow\] Pre-check and validate CRD compatibility before Helm upgrade to prevent cluster breakage

[EVEREST-2003](https://perconadev.atlassian.net/browse/EVEREST-2003) \[UI\] Remove expandable section in DB overview

[EVEREST-2005](https://perconadev.atlassian.net/browse/EVEREST-2005) \[UI\] Add 'view details' in the actions menu


## Bug Fixes

- [EVEREST-1838](https://perconadev.atlassian.net/browse/EVEREST-1838) The 'Edit' option for PITR is disabled for MySQL and MongoDB clusters, even when PITR is enabled.


- [EVEREST-1890](https://perconadev.atlassian.net/browse/EVEREST-1890) \[UI\] Number of Proxies changes from 'X' to '1' while creating a mysql db cluster

- [EVEREST-1895](https://perconadev.atlassian.net/browse/EVEREST-1895) \[UI\] PITR time can't be changed from the last successful backup

- [EVEREST-1948](https://perconadev.atlassian.net/browse/EVEREST-1948) \[UI\] Component Age isn't displayed properly

- [EVEREST-1961](https://perconadev.atlassian.net/browse/EVEREST-1961) \[BE\] Edit monitoring instance does not work

- [EVEREST-2001](https://perconadev.atlassian.net/browse/EVEREST-2001) \[UI\] Resource edit fields \(Disk, CPU, Memory\) behaves inconsistently and becomes difficult to edit when a large value is entered

- [EVEREST-2030](https://perconadev.atlassian.net/browse/EVEREST-2030) \[UI\] User not logged out after deletion - UI stays active even though API token is invalidated

- [EVEREST-2037](https://perconadev.atlassian.net/browse/EVEREST-2037) \[UI\] Policy is being used message is displayed when it is not associated with any db


- [EVEREST-2043](https://perconadev.atlassian.net/browse/EVEREST-2043) \[CLI\] setting pmm.enabled=true results in PMM getting deployed in the \`default\` namespace

- [EVEREST-2052](https://perconadev.atlassian.net/browse/EVEREST-2052) PMM client getting OOM killed


## Known limitation

When integrating Microsoft Entra ID as your OIDC provider for Percona Everest, it's essential to ensure that the access tokens issued are compatible with Percona Everest's token validation logic.

📘 For detailed information, see our [documentation](https://docs.percona.com/everest/reference/known_limitations.html#oidc-integration-with-microsoft-entra).

## 🚀 Upgrade now

Upgrade to **Percona Everest 1.7.0** to access these new features and improvements. 

📘 Explore our [Upgrade section](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html) for the upgrade steps.
