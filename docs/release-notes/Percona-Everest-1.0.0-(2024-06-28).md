# What's new in Percona Everest 1.0.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

Version 1.0.0 introduces the following changes:


## Release highlights

## Simplified database operator upgrades

We are excited to announce that you can now upgrade database operators and all their components across any namespace with just a single click using our intuitive UI.

![!image](../images/upgrade_operator.png)

Morever, before initiating the upgrade process, Everest provides a comprehensive list of tasks that must be completed to ensure a seamless transition of your clusters to the next version of the database operators.

![!image](images/operator_upgrade_pending.png)

For deep dive into this feature, see our comprehensive [documentation](https://docs.percona.com/everest/upgrade/upgrade_operators.html).



## User management

Percona Everest 1.0.0 introduces user management features, enabling you to securely log in to the platform through either the Percona Everest user interface or the API. So, get ready for a more secure and user-friendly experience with this update.
		
Local user management involves administering Percona Everest users to ensure secure access to database resources. This encompasses tasks such as creating and deleting users, updating their passwords, etc.

If you’re looking for in-depth insights into this feature, see our [documentation]() 


## IdP integration for enhanced security

Starting with Percona Everest 1.0.0, you can now integrate your Percona Everest instance using an external identity provider (IdP). This enables centralized authentication and authorization management, streamlining and simplifying user access. By tapping into IdP integration, you can ensure that users are authenticated and authorized securely.

Percona Everest uses [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol){:target="_blank"} (OIDC) Protocol to integrate with external Identity Providers (IdP).

![!image](../images/sso_login.png)

To integrate IdP with Percona Everest, first, [install Percona Everest](../install/installEverest.md) and then [configure OIDC](../secure/IdP_integration#configure-oidc-on-the-providerss-side) on the IdP's side as well as the [Percona Everest side](../secure/IdP_integration#configure-oidc-on-percona-everest-side).

To explore the depths of this feature, delve into our [documentation](https://docs.percona.com/everest/secure/IdP_integratiopn.html).


## New features

- [EVEREST-731](https://perconadev.atlassian.net/browse/EVEREST-731) Add support for new Load balancer setting

- [EVEREST-866](https://perconadev.atlassian.net/browse/EVEREST-866) Restore action form backup - improved UX

- [EVEREST-867](https://perconadev.atlassian.net/browse/EVEREST-867) Create DB from backup - UX improvements

- [EVEREST-872](https://perconadev.atlassian.net/browse/EVEREST-872) Give users the option to delete the data from backup storage when deleting a backup

- [EVEREST-873](https://perconadev.atlassian.net/browse/EVEREST-873) Give users the option to delete the data from backup storage when deleting a DB

- [EVEREST-900](https://perconadev.atlassian.net/browse/EVEREST-900) \[Tech Debt\] \[operator\] Create common interface for reconciliation of the different DB operators


- [EVEREST-1087](https://perconadev.atlassian.net/browse/EVEREST-1087) OIDC configuration

- [EVEREST-1095](https://perconadev.atlassian.net/browse/EVEREST-1095) Settings API


## Improvements

- [EVEREST-884](https://perconadev.atlassian.net/browse/EVEREST-884) Add Everest version to our telemetry

- [EVEREST-909](https://perconadev.atlassian.net/browse/EVEREST-909) - Validate scheduled backups for same time on the same storage location

- [EVEREST-924](https://perconadev.atlassian.net/browse/EVEREST-924) \[UI\] Allow multiple backup schedules in the wizard

- [EVEREST-931](https://perconadev.atlassian.net/browse/EVEREST-931) \[UI\] \[S-Daniel\] Wizard - disable all editing/continuing fields when required input is deleted 

- [EVEREST-937](https://perconadev.atlassian.net/browse/EVEREST-937) \[BE\] Improving Everest telemetry

- [EVEREST-953](https://perconadev.atlassian.net/browse/EVEREST-953) \[UI\] Combine backups and PITR in the same wizard step


- [EVEREST-971](https://perconadev.atlassian.net/browse/EVEREST-971) \[UI\] Hide S3 keys


- [EVEREST-974](https://perconadev.atlassian.net/browse/EVEREST-974) Allow updating db engine version

- [EVEREST-975](https://perconadev.atlassian.net/browse/EVEREST-975) \[UI\] Allow editing the db engine property

- [EVEREST-1007](https://perconadev.atlassian.net/browse/EVEREST-1007) \[UI\] Move "actions" button in DB details


- [EVEREST-1055](https://perconadev.atlassian.net/browse/EVEREST-1055) Add DB "deleting" state

- [EVEREST-1069](https://perconadev.atlassian.net/browse/EVEREST-1069) Create components page

- [EVEREST-1093](https://perconadev.atlassian.net/browse/EVEREST-1093) \[UI\] Hide "Delete backups storage data" option while deleting DBs that have no backups


### Bugs

[EVEREST-807](https://perconadev.atlassian.net/browse/EVEREST-807) \[UI\] Storage location name should be displayed in PITR

[EVEREST-837](https://perconadev.atlassian.net/browse/EVEREST-837) \[CLI\] Commands displayed in help do not have a description

[EVEREST-841](https://perconadev.atlassian.net/browse/EVEREST-841) UI not able to detect the correct operator/DB-cluster for different namespaces

[EVEREST-859](https://perconadev.atlassian.net/browse/EVEREST-859) \[CLI\] Uninstall gives error during namespace deletion

[EVEREST-869](https://perconadev.atlassian.net/browse/EVEREST-869) \[CLI\] everestctl install should fallback to the default namespace in case its blank

[EVEREST-870](https://perconadev.atlassian.net/browse/EVEREST-870) \[CLI\] everestctl install does not recognize the option to install the operators


[EVEREST-983](https://perconadev.atlassian.net/browse/EVEREST-983) \[UI\] Backup schedules remain active after backups are disabled

[EVEREST-1003](https://perconadev.atlassian.net/browse/EVEREST-1003) \[CLI\] Installation of operators in a new namespace fails

[EVEREST-1016](https://perconadev.atlassian.net/browse/EVEREST-1016) Last backup 'inactive' status


[EVEREST-1034](https://perconadev.atlassian.net/browse/EVEREST-1034) \[UI\] Restores page should display the restores in a sorted order


[EVEREST-1050](https://perconadev.atlassian.net/browse/EVEREST-1050) \[UI\] Restore information does not get updated on the restores page


[EVEREST-1060](https://perconadev.atlassian.net/browse/EVEREST-1060) \[UI\] Backup schedules more than three should not be created for postgresql database


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

















