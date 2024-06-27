# What's new in Percona Everest 1.0.0

We proudly announce that Percona Everest has officially hit the general availability (GA) milestone with the release of version 1.0.0.

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source cloud native database platform that helps provision and manage databases faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

## Upgrading to Percona Everest 1.0.0

!!! info "Important"
    Despite being a major version upgrade, we fully support upgrading from Percona Everest 0.10.1 to 1.0.0.

Check out our comprehensive [documentation](https://docs.percona.com/everest/upgrade_with_cli.html) for all the details on how to upgrade to Percona Everest 1.0.0.

## Release highlights

Version 1.0.0 introduces the following changes:

## Simplified database operator upgrades

We are excited to announce that you can now upgrade database operators and all their components across any namespace with just a single click using our intuitive UI.

![!image](../images/upgrade_operator.png)

Moreover, before initiating the upgrade process, Everest provides a comprehensive list of tasks that must be completed to ensure a seamless transition of your clusters to the next version of the database operators.

![!image](images/operator_upgrade_pending.png)

For a deep dive into this feature, see our comprehensive [documentation](https://docs.percona.com/everest/upgrade/upgrade_operators.html).


## User management

Percona Everest 1.0.0 introduces user management features, enabling you to securely log in to the platform through either the Percona Everest user interface or the API. So, get ready for a more secure and user-friendly experience with this update.
		
Local user management involves administering Percona Everest users to ensure secure access to database resources. This encompasses tasks such as creating and deleting users, updating their passwords, etc.

If you’re looking for in-depth insights into this feature, see our [documentation]().


## IdP integration for enhanced security

Starting with Percona Everest 1.0.0, you can now integrate your Percona Everest instance using an external identity provider (IdP). This enables centralized authentication and authorization management, streamlining and simplifying user access. By tapping into IdP integration, you can ensure that users are authenticated and authorized securely.

Percona Everest uses [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol){:target="_blank"} (OIDC) Protocol to integrate with external Identity Providers (IdP).

![!image](../images/sso_login.png)

To integrate IdP with Percona Everest, first [install Percona Everest](../install/installEverest.md) and then [configure OIDC](../secure/IdP_integration#configure-oidc-on-the-providerss-side) on the IdP's side as well as the [Percona Everest side](../secure/IdP_integration#configure-oidc-on-percona-everest-side).

To explore the depths of this feature, delve into our [documentation](https://docs.percona.com/everest/secure/IdP_integratiopn.html).


## All new components page

We're always striving to enhance user experience, and we're excited to announce our latest addition – the **Components** page! This new page is your go-to destination for in-depth details about the pods and containers, such as their status, type, age, and much more.


## New features

- [EVEREST-816](https://perconadev.atlassian.net/browse/EVEREST-816) - Starting with Percona Everest 1.0.0, you can now upgrade database operators and all their components across any namespace with just a single click using our intuitive UI.


- [EVEREST-1087](https://perconadev.atlassian.net/browse/EVEREST-1087) - You can now integrate your Percona Everest instance using an external identity provider (IdP). This enables centralized authentication and authorization management, streamlining and simplifying user access.


- [EVEREST-1025](https://perconadev.atlassian.net/browse/EVEREST-1025) - We introduced the user management feature with Percona Everest 1.0.0, enabling you to securely log in to the platform through either the user interface or the API.

- [EVEREST-731](https://perconadev.atlassian.net/browse/EVEREST-731) - Added support for customizing load balancer source ranges in PostgreSQL clusters.

- [EVEREST-866](https://perconadev.atlassian.net/browse/EVEREST-866) - In the past, when viewing the DB cluster in the backups list, it was confusing to find information about the Point-in-Time Recovery (PITR) for restores. With the release of Percona Everest 1.0.0, PITR is now visible. However, PITR is only available to select if the chosen backup is the most recent full backup.

- [EVEREST-872](https://perconadev.atlassian.net/browse/EVEREST-872) - When deleting a backup, you can now choose to delete the data from the backup storage as well.


- [EVEREST-873](https://perconadev.atlassian.net/browse/EVEREST-873) - When attempting to delete a database, you now have the option to delete the data as well from the backup storage. However, for PostgreSQL databases, the backup storage data is retained.


- [EVEREST-974](https://perconadev.atlassian.net/browse/EVEREST-974) - Everest now supports editing the DB Engine version after a cluster has been created. However, it's important to note the following restrictions:

    - You are unable to upgrade to a different major version. 
    - Downgrading the DB Engine version is not supported.


- [EVEREST-1069](https://perconadev.atlassian.net/browse/EVEREST-1069) - We've recently introduced a new page - the components page. This page provides detailed information about the pods and containers, including their status, type, age, and more.

## Improvements


- [EVEREST-909](https://perconadev.atlassian.net/browse/EVEREST-909) - Percona Everest now validates scheduled backups if another backup is already scheduled for the same time and location.


- [EVEREST-924](https://perconadev.atlassian.net/browse/EVEREST-924) - Starting with Percona Everest 1.0.0, you now have the option to create multiple backup schedules using the wizard.


- [EVEREST-931](https://perconadev.atlassian.net/browse/EVEREST-931) - When you go through a wizard, return to a specific step, and delete something from a mandatory field, the editing functionality is now disabled.


- [EVEREST-953](https://perconadev.atlassian.net/browse/EVEREST-953) - For an improved user interface (UI) experience, we have consolidated backups and PITR on the same page.


- [EVEREST-971](https://perconadev.atlassian.net/browse/EVEREST-971) - Access and secret key inputs are now visible on the UI when adding a storage location. You can use the eye icon to toggle between making the keys visible or hidden. This feature allows you to conveniently view the S3 keys directly from the UI.



- [EVEREST-1007](https://perconadev.atlassian.net/browse/EVEREST-1007) - For an improved user experience, the **Actions** button has been moved to the **Database Details** tab on the right side of the database name.


- [EVEREST-1055](https://perconadev.atlassian.net/browse/EVEREST-1055) Starting with Percona Everest 1.0.0, we have introduced a new **deleting** state. This state will persist until all resources associated with the database have been removed.


- [EVEREST-937](https://perconadev.atlassian.net/browse/EVEREST-937) - We have made some improvements in our telemetry, including sending telemetry data about the DB cluster every time a user creates one and adding information about the Everest version reported for the instance ID.


### Bugs

- [EVEREST-807](https://perconadev.atlassian.net/browse/EVEREST-807) - Fixed an issue where PITR did not display the storage location being used when enabling PITR during database creation or editing.


- [EVEREST-837](https://perconadev.atlassian.net/browse/EVEREST-837) - We have now updated the help for the Command Line Interface (CLI) commands to include the descriptions.

- [EVEREST-841](https://perconadev.atlassian.net/browse/EVEREST-841) - Fixed an issue where the user interface (UI) could not identify the correct operator/database cluster for different namespaces.

- [EVEREST-869](https://perconadev.atlassian.net/browse/EVEREST-869) - Fixed an issue where `everestctl install` failed to revert to the default namespace when the namespace was left blank.

- [EVEREST-870](https://perconadev.atlassian.net/browse/EVEREST-870) - When running the `everestctl install` command, the installation wizard asked for values such as namespaces and operators, even though the values were already provided by flags `(--namespaces=everest --operator.mongodb=false --operator.postgresql=false --operator.xtradb-cluster=true)`. The issue has been resolved now.



- [EVEREST-1003](https://perconadev.atlassian.net/browse/EVEREST-1003) - Resolved an issue where the installation of operators in a new namespace was failing.


- [EVEREST-1016](https://perconadev.atlassian.net/browse/EVEREST-1016) - We updated the **Last backup** status from **inactive** to **scheduled** because it was confusing for the users.


- [EVEREST-1034](https://perconadev.atlassian.net/browse/EVEREST-1034) - The Restores page did not display the restores in a sorted order. The issue has been resolved now.


- [EVEREST-1050](https://perconadev.atlassian.net/browse/EVEREST-1050) - The information about the restores was not correctly updated on the restores page. The issue has been fixed now.


- [EVEREST-1143](https://perconadev.atlassian.net/browse/EVEREST-1143) - Resolved an issue where `everestctl uninstall` command uninstalled Percona Everest despite the user selecting `no`.


- [EVEREST-1145](https://perconadev.atlassian.net/browse/EVEREST-1145) - The issue with enabling external access to a DB running in EKS, where the provisioned LB was of the **classic** type instead of the required network type **NLB**, has been fixed.


## Known limitations

Check out the [known limitations](https://docs.percona.com/everest/reference/known_limitations.html) section for in-depth details about the constraints of Percona Everest.
















