# What's new in Percona Everest 1.1.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.


## Release highlights

Version 1.1.0 introduces the following changes:


## Known limitations


# Release notes - Everest - 1.1.0

### Improvement

[EVEREST-247](https://perconadev.atlassian.net/browse/EVEREST-247) \[UI\] Postgresql icon on databases UI should be improved

[EVEREST-877](https://perconadev.atlassian.net/browse/EVEREST-877) Block namespace removal from monitoring config's allowed namespaces if the monitoring config is being used

[EVEREST-1052](https://perconadev.atlassian.net/browse/EVEREST-1052) \[UI\] \[S-Daniel\] Update technology selection cards

[EVEREST-1070](https://perconadev.atlassian.net/browse/EVEREST-1070) \[UI\] \[S-Alex\] Update 'restore' icon everywhere

[EVEREST-1071](https://perconadev.atlassian.net/browse/EVEREST-1071) Add Backup "deleting" state

[EVEREST-1088](https://perconadev.atlassian.net/browse/EVEREST-1088) \[UI\] \[S-Daniel\] Update technology column in DB list table

[EVEREST-1092](https://perconadev.atlassian.net/browse/EVEREST-1092) Forbid running an on-demand backup if another backup is already running

[EVEREST-1134](https://perconadev.atlassian.net/browse/EVEREST-1134) DB engine upgrade should be available in the Namespaces page

[EVEREST-1153](https://perconadev.atlassian.net/browse/EVEREST-1153) \[CLI\] Improve CLI UX for install/upgrade/uninstall commands

[EVEREST-1165](https://perconadev.atlassian.net/browse/EVEREST-1165) Upgrade all operators in a given namespace at the same time

[EVEREST-1196](https://perconadev.atlassian.net/browse/EVEREST-1196) \[UI\] Add confirmation dialog when leaving the wizard through the side navigation

[EVEREST-1211](https://perconadev.atlassian.net/browse/EVEREST-1211) \[UI\] Edit resources \(logic\)

[EVEREST-1214](https://perconadev.atlassian.net/browse/EVEREST-1214) Remove PG schedules deletion restriction

[EVEREST-1217](https://perconadev.atlassian.net/browse/EVEREST-1217) Remove the PG "maximum 3 schedules" warning 

[EVEREST-1220](https://perconadev.atlassian.net/browse/EVEREST-1220) PG: restrict usage of 4th storage when there are already 3 storages used

[EVEREST-1223](https://perconadev.atlassian.net/browse/EVEREST-1223) Restrict editing backup storages 

[EVEREST-1226](https://perconadev.atlassian.net/browse/EVEREST-1226) Restrict creating backup storages with the same bucket, region, url 

[EVEREST-1229](https://perconadev.atlassian.net/browse/EVEREST-1229) \[UI\] Show storage in the schedules list and in the backups list

[EVEREST-1230](https://perconadev.atlassian.net/browse/EVEREST-1230) \[UI\] Resources \(widget\) \+ common card updation

[EVEREST-1250](https://perconadev.atlassian.net/browse/EVEREST-1250) Allow enforcing RBAC for monitoring-instances and backup-storages based on namespaces

### Bug

[EVEREST-307](https://perconadev.atlassian.net/browse/EVEREST-307) \[CLI\] Errors should not contain exceptions or stack traces

[EVEREST-740](https://perconadev.atlassian.net/browse/EVEREST-740) \[UI\] Mysql is not the selected engine in database creation when it is not installed as the first operator

[EVEREST-859](https://perconadev.atlassian.net/browse/EVEREST-859) \[CLI\] Uninstall gives error during namespace deletion

[EVEREST-910](https://perconadev.atlassian.net/browse/EVEREST-910) \[UI\] Schedule name and storage location information not visible on backup dashboard

[EVEREST-1000](https://perconadev.atlassian.net/browse/EVEREST-1000) \[UI\] Advanced Configurations toggle buttons alignment is incorrect

[EVEREST-1050](https://perconadev.atlassian.net/browse/EVEREST-1050) \[UI\] Restore information does not get updated on the restores page

[EVEREST-1074](https://perconadev.atlassian.net/browse/EVEREST-1074) \[UI\] Backups page is slow in adding/editing scheduled backups

[EVEREST-1141](https://perconadev.atlassian.net/browse/EVEREST-1141) Backup files are not deleted from S3 if database is deleted

[EVEREST-1144](https://perconadev.atlassian.net/browse/EVEREST-1144) Editing a backup storage in a backup schedule for a postgresql database displays an error when 3 backup schedules have been created

[EVEREST-1161](https://perconadev.atlassian.net/browse/EVEREST-1161) PG operator crashed after pg db restore

[EVEREST-1175](https://perconadev.atlassian.net/browse/EVEREST-1175) minor UI issues with fields and descriptions

[EVEREST-1179](https://perconadev.atlassian.net/browse/EVEREST-1179) No confirmation msg on cancelling creating a DB cluster by clicking on setting or Databases page 

[EVEREST-1181](https://perconadev.atlassian.net/browse/EVEREST-1181) \[UI\] DB engine major version upgrade/downgrade should be disabled

[EVEREST-1197](https://perconadev.atlassian.net/browse/EVEREST-1197) Mongodb database is not able to come up

[EVEREST-1204](https://perconadev.atlassian.net/browse/EVEREST-1204) \[UI\] Use \`Gi\` for storage size, not \`G\`

[EVEREST-1233](https://perconadev.atlassian.net/browse/EVEREST-1233) \[API\] Trying to downgrade a major version returns incorrect error message

[EVEREST-1244](https://perconadev.atlassian.net/browse/EVEREST-1244) \[UI\] Recovery message and actions are inconsistent

### Admin & Maintenance Task

[EVEREST-1238](https://perconadev.atlassian.net/browse/EVEREST-1238) Ensure release pipeline uses "percona" dockerhub repo instead of "perconalab"

### New Feature

[EVEREST-1103](https://perconadev.atlassian.net/browse/EVEREST-1103) Restrict actions based on RBAC

[EVEREST-1142](https://perconadev.atlassian.net/browse/EVEREST-1142) \[CLI\] Add command for validating RBAC policy

[EVEREST-1239](https://perconadev.atlassian.net/browse/EVEREST-1239) Add support for PSMDB Operator v1.16.2

[EVEREST-1240](https://perconadev.atlassian.net/browse/EVEREST-1240) Add support for PG Operator v2.4.0

### Technical task

[EVEREST-992](https://perconadev.atlassian.net/browse/EVEREST-992) \[UI\] \[Storybook\] \[S\] TextFields

[EVEREST-997](https://perconadev.atlassian.net/browse/EVEREST-997) \[UI\] \[Storybook\] \[S\] Radio

[EVEREST-1039](https://perconadev.atlassian.net/browse/EVEREST-1039) \[UI\] \[Storybook\] \[S\] Checkbox

[EVEREST-1043](https://perconadev.atlassian.net/browse/EVEREST-1043) \[UI\] \[Storybook\] \[S\] Stepper

[EVEREST-1072](https://perconadev.atlassian.net/browse/EVEREST-1072) \[Operator\] Add Backup "deleting" state

[EVEREST-1073](https://perconadev.atlassian.net/browse/EVEREST-1073) \[UI\] Add Backup "deleting" state

[EVEREST-1096](https://perconadev.atlassian.net/browse/EVEREST-1096) \[BE\] Implement casbin RBAC enforcer

[EVEREST-1104](https://perconadev.atlassian.net/browse/EVEREST-1104) \[BE\] Create endpoint that provides the authenticated user's permissions

[EVEREST-1105](https://perconadev.atlassian.net/browse/EVEREST-1105) \[UI\] Restrict actions based on RBAC

[EVEREST-1110](https://perconadev.atlassian.net/browse/EVEREST-1110) \[UI\] Block namespace removal from monitoring config's allowed namespaces if the monitoring config is being used

[EVEREST-1215](https://perconadev.atlassian.net/browse/EVEREST-1215) \[UI\] Remove PG schedules deletion restriction

[EVEREST-1216](https://perconadev.atlassian.net/browse/EVEREST-1216) \[API\] Remove PG schedules deletion restriction

[EVEREST-1218](https://perconadev.atlassian.net/browse/EVEREST-1218) \[UI\] Remove the PG "maximum 3 schedules" warning

[EVEREST-1219](https://perconadev.atlassian.net/browse/EVEREST-1219) \[DOCS\] Change the PG "maximum 3 schedules" warning

[EVEREST-1221](https://perconadev.atlassian.net/browse/EVEREST-1221) \[UI\] PG: restrict usage of 4th storage

[EVEREST-1222](https://perconadev.atlassian.net/browse/EVEREST-1222) \[API\] PG: restrict usage of 4th storage 

[EVEREST-1224](https://perconadev.atlassian.net/browse/EVEREST-1224) \[UI\] Restrict editing backup storages 

[EVEREST-1225](https://perconadev.atlassian.net/browse/EVEREST-1225) \[API\] Restrict editing backup storages in use

[EVEREST-1228](https://perconadev.atlassian.net/browse/EVEREST-1228) \[API\] Restrict creating backup storages with the same bucket, region, url

[EVEREST-1246](https://perconadev.atlassian.net/browse/EVEREST-1246) \[UI\] Upgrade all operators in a given namespace at the same time

[EVEREST-1247](https://perconadev.atlassian.net/browse/EVEREST-1247) \[API\] Upgrade all operators in a given namespace at the same time

### Epic

[EVEREST-1022](https://perconadev.atlassian.net/browse/EVEREST-1022) Role Based Access Control

[EVEREST-1213](https://perconadev.atlassian.net/browse/EVEREST-1213) Improve PG backups/restore configuration flow 