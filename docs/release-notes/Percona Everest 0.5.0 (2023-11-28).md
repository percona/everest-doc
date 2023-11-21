# What's new in Percona Everest 0.5.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).

Percona Everest is an open source private database-as-a-service that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

## Release highlights

Version 0.5.0 introduces the following enhancements:

### Enhanced Backup scheduling

Previously exclusively available from the **Backups** tab within the database view, backup scheduling is now seamlessly integrated into the database creation wizard as an added step.

This completes the Backup Scheduling functionality and enables you to define a comprehensive setup for your new database from the get-go.

![Backups page](../images/Backups_DB_wizard.png)

### Option to copy database password

We've added a convenient way to copy a database password from the Database cluster list and from the Database cluster overview page.

Since clipboard access is restricted in unsecured contexts, this option is only enabled when you access these pages via HTTPS or localhost.

![Cluster list](../images/Cluster_list.png) ![DB_Overview](../images/DB_Overview.png)

### Option to check Everest version

The Help icon in the upper right corner now also shows the Everest version currently installed:  
![Help menu](../images/Help_icon.png)

## Fixed issues

{.power-number}
- [EVEREST-395](https://jira.percona.com/browse/EVEREST-395) - In specific scenarios, when creating a new database, Everest would reset the specified database name, version, and storage class to automatically generated values. This issue is now fixed.