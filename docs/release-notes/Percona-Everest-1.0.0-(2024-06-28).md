# What's new in Percona Everest 1.0.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 1.0.0 introduces the following changes:


## Release highlights

## Simplified database operator upgrades

We are excited to announce that you can now upgrade database operators and all their components across any namespace with just a single click using our intuitive UI.

Morever, before initiating the upgrade process, Everest provides a comprehensive list of tasks that must be completed to ensure a seamless transition of your clusters to the next version of the database operators.

For deep dive into this feature, see our comprehensive [documentation](https://docs.percona.com/everest/upgrade/upgrade_operators.html).


## User management

Percona Everest 1.0.0 introduces user management features, enabling you to securely log in to the platform through either the Percona Everest user interface or the API. So, get ready for a more secure and user-friendly experience with this update.
		
Local user management involves administering Percona Everest users to ensure secure access to database resources. This encompasses tasks such as creating and deleting users, updating their passwords, etc.

If you’re looking for in-depth insights into this feature, see our [documentation]() 


## IdP integration for enhanced security

Starting with Percona Everest 1.0.0, you can now integrate your Percona Everest instance using an external identity provider (IdP). This enables centralized authentication and authorization management, streamlining and simplifying user access. By tapping into IdP integration, you can ensure that users are authenticated and authorized securely.

Percona Everest uses [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol){:target="_blank"} (OIDC) Protocol to integrate with external Identity Providers (IdP).

To integrate IdP with Percona Everest, first, [install Percona Everest](../install/installEverest.md) and then [configure OIDC](../secure/IdP_integration#configure-oidc-on-the-providerss-side) on the IdP's side as well as the [Percona Everest side](../secure/IdP_integration#configure-oidc-on-percona-everest-side).

To explore the depths of this feature, delve into our [documentation](https://docs.percona.com/everest/secure/IdP_integratiopn.html).


## New features and improvements

- [EVEREST-731](https://perconadev.atlassian.net/browse/EVEREST-731) Add support for new Load balancer setting

- [EVEREST-766](https://perconadev.atlassian.net/browse/EVEREST-766) \[Peak\) Create Chip component

- [EVEREST-770](https://perconadev.atlassian.net/browse/EVEREST-770) \[UI\] Add namespaces to settings

- [EVEREST-783](https://perconadev.atlassian.net/browse/EVEREST-783) \[UI\] Add namespace page with DB type selector and corresponding table

- [EVEREST-804](https://perconadev.atlassian.net/browse/EVEREST-804) \[UI\] Add upgrade modal

- [EVEREST-806](https://perconadev.atlassian.net/browse/EVEREST-806) Support locking a namespace before an operator upgrade

- [EVEREST-817](https://perconadev.atlassian.net/browse/EVEREST-817) Endpoint to monitor progress of operator upgrade

- [EVEREST-866](https://perconadev.atlassian.net/browse/EVEREST-866) Restore action form backup - improved UX

- [EVEREST-867](https://perconadev.atlassian.net/browse/EVEREST-867) Create DB from backup - UX improvements

- [EVEREST-872](https://perconadev.atlassian.net/browse/EVEREST-872) Give users the option to delete the data from backup storage when deleting a backup

- [EVEREST-873](https://perconadev.atlassian.net/browse/EVEREST-873) Give users the option to delete the data from backup storage when deleting a DB

- [EVEREST-900](https://perconadev.atlassian.net/browse/EVEREST-900) \[Tech Debt\] \[operator\] Create common interface for reconciliation of the different DB operators

- [EVEREST-960](https://perconadev.atlassian.net/browse/EVEREST-960) Add support for operator upgrades through DatabaseEngine CR

- [EVEREST-961](https://perconadev.atlassian.net/browse/EVEREST-961) Expose list of available operator upgrades in DatabaseEngine status

- [EVEREST-1023](https://perconadev.atlassian.net/browse/EVEREST-1023) \[CLI\] List, create and delete accounts

- [EVEREST-1024](https://perconadev.atlassian.net/browse/EVEREST-1024) \[CLI\] Update account password

- [EVEREST-1025](https://perconadev.atlassian.net/browse/EVEREST-1025) Account authentication

- [EVEREST-1086](https://perconadev.atlassian.net/browse/EVEREST-1086) Implement access token validation middleware in the Everest server

- [EVEREST-1087](https://perconadev.atlassian.net/browse/EVEREST-1087) OIDC configuration

- [EVEREST-1094](https://perconadev.atlassian.net/browse/EVEREST-1094) \[UI\] OIDC integration

- [EVEREST-1095](https://perconadev.atlassian.net/browse/EVEREST-1095) Settings API

- [EVEREST-909](https://perconadev.atlassian.net/browse/EVEREST-909) - Validate scheduled backups for same time on the same storage location

- [EVEREST-924](https://perconadev.atlassian.net/browse/EVEREST-924) \[UI\] Allow multiple backup schedules in the wizard

- [EVEREST-931](https://perconadev.atlassian.net/browse/EVEREST-931) \[UI\] \[S-Daniel\] Wizard - disable all editing/continuing fields when required input is deleted 

- [EVEREST-937](https://perconadev.atlassian.net/browse/EVEREST-937) \[BE\] Improving Everest telemetry

- [EVEREST-951](https://perconadev.atlassian.net/browse/EVEREST-951) \[UI\] Insert backup schedules into table's header

- [EVEREST-953](https://perconadev.atlassian.net/browse/EVEREST-953) \[UI\] Combine backups and PITR in the same wizard step

- [EVEREST-954](https://perconadev.atlassian.net/browse/EVEREST-954) \[UI\] Invert tooltip dark mode & light mode

- [EVEREST-971](https://perconadev.atlassian.net/browse/EVEREST-971) \[UI\] Hide S3 keys

- [EVEREST-972](https://perconadev.atlassian.net/browse/EVEREST-972) Improved version logic

- [EVEREST-974](https://perconadev.atlassian.net/browse/EVEREST-974) Allow updating db engine version

- [EVEREST-1005](https://perconadev.atlassian.net/browse/EVEREST-1005) \[UI\] \[S\] Expand divider in tabs component

- [EVEREST-1007](https://perconadev.atlassian.net/browse/EVEREST-1007) \[UI\] Move "actions" button in DB details

[EVEREST-1013](https://perconadev.atlassian.net/browse/EVEREST-1013) Validate upgrade preconditions before running an upgrade

[EVEREST-1049](https://perconadev.atlassian.net/browse/EVEREST-1049) \[UI\] \[S-Daniel\] Change 'insert' to 'enter in all fields

[EVEREST-1055](https://perconadev.atlassian.net/browse/EVEREST-1055) Add DB "deleting" state

[EVEREST-1069](https://perconadev.atlassian.net/browse/EVEREST-1069) Create components page

[EVEREST-1093](https://perconadev.atlassian.net/browse/EVEREST-1093) \[UI\] Hide "Delete backups storage data" option while deleting DBs that have no backups

[EVEREST-1099](https://perconadev.atlassian.net/browse/EVEREST-1099) Allow skipping authentication for APIs by specifying in the swagger spec

[EVEREST-1100](https://perconadev.atlassian.net/browse/EVEREST-1100) \[UI\] Update subject names to bold in the dialogs

[EVEREST-1102](https://perconadev.atlassian.net/browse/EVEREST-1102) Everest uninstall should not depend on reading namespaces from everest-operator deployment

[EVEREST-1112](https://perconadev.atlassian.net/browse/EVEREST-1112) \[CLI\] Add command for getting the initial password

[EVEREST-1122](https://perconadev.atlassian.net/browse/EVEREST-1122) Add command for resetting Everest JWT keys

[EVEREST-1123](https://perconadev.atlassian.net/browse/EVEREST-1123) Reorganise CLI commands

[EVEREST-1131](https://perconadev.atlassian.net/browse/EVEREST-1131) API for post-upgrade checks

[EVEREST-1132](https://perconadev.atlassian.net/browse/EVEREST-1132) \[UI\] render list of post-upgrade checks

### Bug

[EVEREST-310](https://perconadev.atlassian.net/browse/EVEREST-310) \[BE\] Error messages should be improved for create backup storage api

[EVEREST-573](https://perconadev.atlassian.net/browse/EVEREST-573) \[Operator\] Mongodb backup status is not consistent with mysql and postgresql

[EVEREST-807](https://perconadev.atlassian.net/browse/EVEREST-807) \[UI\] Storage location name should be displayed in PITR

[EVEREST-837](https://perconadev.atlassian.net/browse/EVEREST-837) \[CLI\] Commands displayed in help do not have a description

[EVEREST-841](https://perconadev.atlassian.net/browse/EVEREST-841) UI not able to detect the correct operator/DB-cluster for different namespaces

[EVEREST-859](https://perconadev.atlassian.net/browse/EVEREST-859) \[CLI\] Uninstall gives error during namespace deletion

[EVEREST-869](https://perconadev.atlassian.net/browse/EVEREST-869) \[CLI\] everestctl install should fallback to the default namespace in case its blank

[EVEREST-870](https://perconadev.atlassian.net/browse/EVEREST-870) \[CLI\] everestctl install does not recognize the option to install the operators

[EVEREST-943](https://perconadev.atlassian.net/browse/EVEREST-943) \[UI\] Align AM/PM selector on PITR date picker 

[EVEREST-963](https://perconadev.atlassian.net/browse/EVEREST-963) \[operator\] PMM missing k8s\_cluster\_id label on GKE

[EVEREST-966](https://perconadev.atlassian.net/browse/EVEREST-966) \[UI\] New fonts and spaces need to be consistent, aligned

[EVEREST-978](https://perconadev.atlassian.net/browse/EVEREST-978) \[UI\] \[S-Alex\] page is failing because of undefined

[EVEREST-983](https://perconadev.atlassian.net/browse/EVEREST-983) \[UI\] Backup schedules remain active after backups are disabled

[EVEREST-984](https://perconadev.atlassian.net/browse/EVEREST-984) \[UI\] Error should be displayed if retention copies limit is exceeded

[EVEREST-986](https://perconadev.atlassian.net/browse/EVEREST-986) \[UI\] \[S-Daniel\] Monitoring Endpoints - Warning Message for TLS certificate not working as expected

[EVEREST-987](https://perconadev.atlassian.net/browse/EVEREST-987) \[UI\] Scheduled Backups Repeats text is not aligned properly

[EVEREST-991](https://perconadev.atlassian.net/browse/EVEREST-991) \[UI\] Add monitoring endpoint displays incorrect description text for Name field

[EVEREST-1003](https://perconadev.atlassian.net/browse/EVEREST-1003) \[CLI\] Installation of operators in a new namespace fails

[EVEREST-1009](https://perconadev.atlassian.net/browse/EVEREST-1009) \[UI\] GitHub issues link opening on the same tab

[EVEREST-1015](https://perconadev.atlassian.net/browse/EVEREST-1015) everesctl uninstall should ignore NotFound errors

[EVEREST-1016](https://perconadev.atlassian.net/browse/EVEREST-1016) Last backup 'inactive' status

[EVEREST-1019](https://perconadev.atlassian.net/browse/EVEREST-1019) Mongodb restore status is different than mysql and postgresql

[EVEREST-1030](https://perconadev.atlassian.net/browse/EVEREST-1030) PG restores stopped working after using destination from PerconaPGBackup

[EVEREST-1031](https://perconadev.atlassian.net/browse/EVEREST-1031) \[UI\] 0 \(infinite\) Retention copies not showing any detail about backup retention on schedule backups

[EVEREST-1033](https://perconadev.atlassian.net/browse/EVEREST-1033) \[CLI\] Cli should run install with a minimum one operator flag set as true

[EVEREST-1034](https://perconadev.atlassian.net/browse/EVEREST-1034) \[UI\] Restores page should display the restores in a sorted order

[EVEREST-1045](https://perconadev.atlassian.net/browse/EVEREST-1045) \[UI\] Login page gets stuck after upgrade to 0.10.0

[EVEREST-1047](https://perconadev.atlassian.net/browse/EVEREST-1047) Backup Schedules - Daily, Weekly, Monthly schedule date and time issue 

[EVEREST-1050](https://perconadev.atlassian.net/browse/EVEREST-1050) \[UI\] Restore information does not get updated on the restores page

[EVEREST-1057](https://perconadev.atlassian.net/browse/EVEREST-1057) \[UI\] "not found" flashes momentarily on some pages

[EVEREST-1059](https://perconadev.atlassian.net/browse/EVEREST-1059) \[UI\] Cleanup backup storage option should be provided as a query parameter while deleting backups/DB

[EVEREST-1060](https://perconadev.atlassian.net/browse/EVEREST-1060) \[UI\] Backup schedules more than three should not be created for postgresql database

[EVEREST-1075](https://perconadev.atlassian.net/browse/EVEREST-1075) \[UI\] Restores page displays error

[EVEREST-1079](https://perconadev.atlassian.net/browse/EVEREST-1079) Invalid/incorrect links on Everest installation docs

[EVEREST-1080](https://perconadev.atlassian.net/browse/EVEREST-1080) 'everest-olm' namespace not added in the default namespaces

[EVEREST-1081](https://perconadev.atlassian.net/browse/EVEREST-1081) \[UI\] Restore gets disabled for backups if PITR time is not the latest

[EVEREST-1091](https://perconadev.atlassian.net/browse/EVEREST-1091) \[UI\] Database is temporarily removed from list when getting deleted

[EVEREST-1101](https://perconadev.atlassian.net/browse/EVEREST-1101) Everest operator crashes and databases do not come up

[EVEREST-1117](https://perconadev.atlassian.net/browse/EVEREST-1117) \[operator\] Backup state is flip-floping

[EVEREST-1118](https://perconadev.atlassian.net/browse/EVEREST-1118) \[CLI\] User delete option without username flag giving an error \+ incorrect example in help

[EVEREST-1120](https://perconadev.atlassian.net/browse/EVEREST-1120) Components page displays pg backups

[EVEREST-1121](https://perconadev.atlassian.net/browse/EVEREST-1121) Running upgrade leads to the JWT keys getting overwritten from the quickstart manifests

[EVEREST-1126](https://perconadev.atlassian.net/browse/EVEREST-1126) \[CLI\] Cli should not display the command to get the password if it is changed

[EVEREST-1127](https://perconadev.atlassian.net/browse/EVEREST-1127) PXC operator gets upgraded but displays errors while upgrading

[EVEREST-1128](https://perconadev.atlassian.net/browse/EVEREST-1128) Namespace installation error on CLI after upgrading from 0.10.1 to 0.11.0 

[EVEREST-1133](https://perconadev.atlassian.net/browse/EVEREST-1133) Unable to upgrade to 0.11.0 rc1

[EVEREST-1136](https://perconadev.atlassian.net/browse/EVEREST-1136) \[CLI\] Upgrade should display the way for user to login in UI

[EVEREST-1137](https://perconadev.atlassian.net/browse/EVEREST-1137) External IP for mysql is not displayed if external access is enabled

[EVEREST-1139](https://perconadev.atlassian.net/browse/EVEREST-1139) Postgresql database gets stuck during deletion

[EVEREST-1143](https://perconadev.atlassian.net/browse/EVEREST-1143) Everest gets uninstalled on selecting "no"

[EVEREST-1145](https://perconadev.atlassian.net/browse/EVEREST-1145) \[operator\] PSMDB and PG should use AWS's NLB instead of "classic" LB


### New Feature



### Technical task

[EVEREST-874](https://perconadev.atlassian.net/browse/EVEREST-874) \[Operator\] Add DB "deleting" state

[EVEREST-955](https://perconadev.atlassian.net/browse/EVEREST-955) \[BE\] Give users the option to delete the data from backup storage when deleting a backup

[EVEREST-957](https://perconadev.atlassian.net/browse/EVEREST-957) \[UI\] Give users the option to delete the data from backup storage when deleting a backup

[EVEREST-958](https://perconadev.atlassian.net/browse/EVEREST-958) \[BE\] Give users the option to delete the data from backup storage when deleting a DB

[EVEREST-959](https://perconadev.atlassian.net/browse/EVEREST-959) \[UI\] Give users the option to delete the data from backup storage when deleting a DB

[EVEREST-975](https://perconadev.atlassian.net/browse/EVEREST-975) \[UI\] Allow editing the db engine property

[EVEREST-1026](https://perconadev.atlassian.net/browse/EVEREST-1026) \[UI\] Login screen with username and password

[EVEREST-1027](https://perconadev.atlassian.net/browse/EVEREST-1027) \[API\] Create session endpoint

[EVEREST-1028](https://perconadev.atlassian.net/browse/EVEREST-1028) \[API\] Authenticate requests using session token

[EVEREST-1042](https://perconadev.atlassian.net/browse/EVEREST-1042) \[UI\] \[Storybook\] \[S\] Icons

[EVEREST-1056](https://perconadev.atlassian.net/browse/EVEREST-1056) \[UI\] Add DB "deleting" state

[EVEREST-1062](https://perconadev.atlassian.net/browse/EVEREST-1062) \[UI\] Validation for the duplicated schedules

[EVEREST-1063](https://perconadev.atlassian.net/browse/EVEREST-1063) \[BE\] Validation for the duplicated schedules

[EVEREST-1083](https://perconadev.atlassian.net/browse/EVEREST-1083) \[UI\] Create components page

[EVEREST-1084](https://perconadev.atlassian.net/browse/EVEREST-1084) \[API\] Create components endpoint


## Fixed issues



## Known limitations

Backups for PostgreSQL do not work with GCP S3 compatible API.

















