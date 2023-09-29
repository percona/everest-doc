# Welcome to Percona Everest [Alpha]

We are excited to welcome you to the very first release of Percona Everest, designed to demonstrate the core capabilities of our new open source private Database-as-a-Service (DBaaS) solution!

Before its general availability, Percona Everest will provide a complete suite of database services so you can enjoy ultimate performance for database setup, deployment, monitoring, management, backup, restoring, scaling, and other crucial database operations.

## Why Everest?

Percona Everest is an open source private database-as-a-service that helps developers deploy code faster, scale deployments rapidly, and reduce database administration overhead while regaining control over their data, database configuration, and DBaaS costs.

Percona Everest is designed for those who want to break free from vendor lock-in, ensure optimal database performance, enable cost-effective and right-sized database deployments, and reduce database administration overhead.

The solution automates day-one and day-two database operations for Postgres, MySQL, and MongoDB databases within Kubernetes clusters.

Here's why you should try Percona Everest:

- **Launch database instance with just a few clicks**: Percona Everest simplifies the entire database lifecycle, making it effortless to provision, configure, and manage your database instances.
- **Enable your team to develop faster and reduce time to market**: Save valuable time and resources that would otherwise be spent on database management, allowing your team to focus on building applications and growing your business.
- **Scale seamlessly**: As your application's demands grow, your team can scale your database instances up or down effortlessly. Whether your team needs more processing power, storage, or replicas, you can adjust your setup without compromising security and performance.
- **Simplify maintenance**: Routine maintenance tasks, such as software updates and patch management, are handled by Percona Everest, reducing downtime and the risk of human error.
- **Monitor and optimize**: Gain insights into your database’s performance with native integration with Percona Monitoring and Management. This provides real-time metrics and analytics, helping you identify bottlenecks and optimize your database for peak efficiency.

- **Automate backups**: Create on-demand and set up automated backup schedules effortlessly. Percona Everest ensures that your critical data is regularly backed up and readily available for recovery when needed. *[Scheduled backups coming soon]*
- **Collaborate effortlessly**: Collaborate with your team by granting access to the database instances they need, all while maintaining control and visibility over who can do what within your database environment. *[Coming soon]*
- **Ensure data security**: Percona Everest comes with robust security measures to keep your data protected and give you peace of mind.
- **Data sovereignty in an environment you control**: Pecona Everest is built with open source software to provide complete freedom from vendor lock-in.
  
## Ready to test drive Percona Everest?

How about checking Percona Everest features in action?

Get started by [Installing Percona Everest](quickstart-guide/qs-overview.md) and [manage your first cluster](use/cluster-management.md)!

## Known limitations

Here are the limitations associated with this release. Some of them you might encounter depending on your settings, and some of them will be addressed in a future release: 

- If you're using PostgreSQL, make sure not to share the same backup storage location for multiple database clusters. Use a unique storage location for backing up PostgreSQL clusters.
- The options to define default database configuration will be available on the **Settings** view soon.
- Scheduled backups are planned for a future release ([EVEREST-224](https://jira.percona.com/browse/EVEREST-224)). 
- No support for database cluster management via CLI yet  ([EVEREST-141](https://jira.percona.com/browse/EVEREST-141), [EVEREST-315](https://jira.percona.com/browse/EVEREST-315),  [EVEREST-199](https://jira.percona.com/browse/EVEREST-199)).
- No support for adding backup storages via CLI yet ([EVEREST-386](https://jira.percona.com/browse/EVEREST-386)).
- No current support for K8s clusters without a public API server ([EVEREST-300](https://jira.percona.com/browse/EVEREST-300)).
- No current support for adding monitoring instances via the UI ([EVEREST-135](https://jira.percona.com/browse/EVEREST-135)). 
- Information regarding Percona Monitoring Management (PMM) monitoring is not yet visible on the UI ([EVEREST-388](https://jira.percona.com/browse/EVEREST-388)).
- No current support for using https for connecting to PMM instances that use a self-signed certificate ([EVEREST-396](https://jira.percona.com/browse/EVEREST-396)).
- Information regarding CPU/Memory resources doesn’t clearly state that is applied per replica and not per database cluster  ([EVEREST-394](https://jira.percona.com/browse/EVEREST-394)).