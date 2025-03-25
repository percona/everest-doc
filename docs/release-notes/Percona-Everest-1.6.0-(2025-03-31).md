# What's new in Percona Everest 1.6.0

➡️ **New to Percona Everest?** Get started with our [Quickstart Guide](https://docs.percona.com/everest/quick-install.html).


??? info "🔑 Updates at a glance"

    |**#**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Manual storage scaling](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)|Increase the storage capacity of your S3-compatible storage through manual storage scaling|
    | **2.**|[MongoDB updates](https://docs.percona.com/everest/release-notes/Percona-Everest-1.5.0-%282025-03-04%29.html#__tabbed_1_1)||


## Release highlights

=== "Manual Storage scaling"


## Google Container Registry (GCR)

!!! warning "GCR deprecation"
    GCR is set to be **deprecated**, with its official shutdown scheduled for **March 18, 2025**.

    All Percona Everest versions prior to 1.4.0 depend on images hosted on Google Container Registry (GCR). These images will become unavailable after the shutdown date: **March 18, 2025**.

### Impact of GCR deprecation

Percona Everest versions older than 1.4.0 will cease to function after this date.

### Action required

We strongly recommend upgrading to Percona Everest version 1.4.0 or later as soon as possible. If you do not upgrade, Percona Everest will no longer function.
    
For more details, refer to the [Container Registry Deprecation documentation](https://cloud.google.com/artifact-registry/docs/transition/prepare-gcr-shutdown){:target="_blank"}.


## New features

- [EVEREST-1870](https://perconadev.atlassian.net/browse/EVEREST-1870), [EVEREST-1871](https://perconadev.atlassian.net/browse/EVEREST-1871), [EVEREST-1872](https://perconadev.atlassian.net/browse/EVEREST-1872): Manual storage scaling for MySQL, MongoDB, and PostgreSQL databases respectively.

- [EVEREST-1841](https://perconadev.atlassian.net/browse/EVEREST-1841): DB major version upgrades for MongoDB

- [EVEREST-1841](https://perconadev.atlassian.net/browse/EVEREST-1841) DB major version upgrades for MongoDB

- [EVEREST-1843]: (https://perconadev.atlassian.net/browse/EVEREST-1843) Add support for PG operator v2.6.0

- [EVEREST-1862](https://perconadev.atlassian.net/browse/EVEREST-1862): \[UI\] Topology diagram view.

