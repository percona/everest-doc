# What's new in Percona Everest 0.4.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md)

Percona Everest is an open source private database-as-a-service that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead. Plus, you can regain control over your data, database configuration, and DBaaS costs.

## Release highlights

Version 0.4.0 introduces several exciting features, enhancements, and notable changes:

### Scheduled backups

You can now schedule automatic backups to run automatically at predefined times. 

This automatic backup will repeat within the time frame given, ensuring you have a backlog of database snapshots to roll back to if needed.

To set up a backup schedule, head over to the **Backups** tab in the database view. Here, you'll find the option to initiate a backup right away, or schedule one for later. Keep an eye out for future releases, as we'll soon enable backup scheduling from the database creation wizard as well.

For more information about working with backups, see [Back up and restore databases](../use/backupRestore.md).

    ![!image](../images/everestschedule_backups.png)

### Option to provide anonymous usage statistics enabled

In creating Percona Everest, we leveraged our years of experience in open-source database development, and collaborated closely with the Percona community through interviews to ensure our new product will meet user needs.

With our latest release, we're adding in product telemetry to fill-in the gaps in our understanding of how users are actually using Everest, and ultimately ensure that we're building the best-in-class DBaaS software for the open-source community.

Participation in this anonymous program is optional, and you can opt-out if prefer not to share any information. 
Read our [privacy statement](https://www.percona.com/privacy-policy#h.e34c40q8sb1a) and [telemetry documentation](../reference/telemetry.md) to learn more.
