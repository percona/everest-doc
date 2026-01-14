# What's new in OpenEverest 0.9.1

To begin your journey with OpenEverest, check out the [Quickstart Guide for OpenEverest](../quickstart-guide/quick-install.md).

OpenEverest is an open source cloud native database platform that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 0.9.1 introduces the following changes:



## Release highlights

!!! warning
    OpenEverest introduces a breaking change that prevents you from directly upgrading to version 0.9.1.

To install OpenEverest 0.9.1, make sure to [uninstall](https://docs.percona.com/everest/install/uninstallEverest.html) any previous versions by running the command:

    everestctl uninstall


## Fixed issues

- [EVEREST-949](https://perconadev.atlassian.net/browse/EVEREST-949) - We have updated the quick install script to correct the URL for downloading the CLI (`everestctl`). Previously, the script failed because of an incorrect URL.




