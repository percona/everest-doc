# What's new in Percona Everest 1.1.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 1.1.0 introduces the following changes:


## Release highlights



## New features

- [EVEREST-1239](https://perconadev.atlassian.net/browse/EVEREST-1239) Add support for PSMDB Operator v1.16.2

- [EVEREST-1240](https://perconadev.atlassian.net/browse/EVEREST-1240) Add support for PG Operator v2.4.0


## Improvement

- [EVEREST-247](https://perconadev.atlassian.net/browse/EVEREST-247) \[UI\] Postgresql icon on databases UI should be improved

- [EVEREST-1070](https://perconadev.atlassian.net/browse/EVEREST-1070) \[UI\] \[S-Alex\] Update 'restore' icon everywhere

- [EVEREST-1071](https://perconadev.atlassian.net/browse/EVEREST-1071) Add Backup "deleting" state

- [EVEREST-1088](https://perconadev.atlassian.net/browse/EVEREST-1088) \[UI\] \[S-Daniel\] Update technology column in DB list table

- [EVEREST-1092](https://perconadev.atlassian.net/browse/EVEREST-1092) Forbid running an on-demand backup if another backup is already running

- [EVEREST-1134](https://perconadev.atlassian.net/browse/EVEREST-1134) DB engine upgrade should be available in the Namespaces page

- [EVEREST-1153](https://perconadev.atlassian.net/browse/EVEREST-1153) \[CLI\] Improve CLI UX for install/upgrade/uninstall commands

- [EVEREST-1157](https://perconadev.atlassian.net/browse/EVEREST-1157) Implement rate limit for the /session endpoint

- [EVEREST-1165](https://perconadev.atlassian.net/browse/EVEREST-1165) Upgrade all operators in a given namespace at the same time

- [EVEREST-1196](https://perconadev.atlassian.net/browse/EVEREST-1196) \[UI\] Add confirmation dialog when leaving the wizard through the side navigation

- [EVEREST-1211](https://perconadev.atlassian.net/browse/EVEREST-1211) \[UI\] Edit resources \(logic\)

- [EVEREST-1214](https://perconadev.atlassian.net/browse/EVEREST-1214) Remove PG schedules deletion restriction

- [EVEREST-1217](https://perconadev.atlassian.net/browse/EVEREST-1217) Remove the PG "maximum 3 schedules" warning 

- [EVEREST-1220](https://perconadev.atlassian.net/browse/EVEREST-1220) PG: restrict usage of 4th storage when there are already 3 storages used

- [EVEREST-1223](https://perconadev.atlassian.net/browse/EVEREST-1223) Restrict editing backup storages 

- [EVEREST-1226](https://perconadev.atlassian.net/browse/EVEREST-1226) Restrict creating backup storages with the same bucket, region, url 

- [EVEREST-1229](https://perconadev.atlassian.net/browse/EVEREST-1229) \[UI\] Show storage in the schedules list and in the backups list

- [EVEREST-1259](https://perconadev.atlassian.net/browse/EVEREST-1259) \[UI\] Show rate limit error message on /session endpoint
