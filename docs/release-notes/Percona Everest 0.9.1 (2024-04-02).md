# What's new in Percona Everest 0.9.1

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.9.1 introduces the following changes:



## Release highlights

!!! warning
    Percona Everest introduces a breaking change that prevents you from directly upgrading to version 0.9.1.

To install Percona Everest 0.9.1, make sure to [uninstall](https://docs.percona.com/everest/install/uninstallEverest.html) any previous versions by running the command:

    everestctl uninstall


## Fixed issues

- [EVEREST-949](https://perconadev.atlassian.net/browse/EVEREST-949) - We have updated the quick install script to correct the URL for downloading the CLI (`everestctl`). Previously, the script failed because of an incorrect URL.




