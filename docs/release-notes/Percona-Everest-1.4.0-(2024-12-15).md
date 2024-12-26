# What's new in Percona Everest 1.4.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**|[Helm charts](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282024-12-15%29.html#__tabbed_1_1)|Simplify your Percona Everest deployments with Helm|
    | **2.**|[Namespace management](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282024-12-15%29.html#__tabbed_1_2)|Manage your namespaces with new everestctl commands|
    | **3.**|[Improved edit database flow](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282024-12-15%29.html#__tabbed_1_3)|Manage your namespaces with new `everestctl` commands|
    | **4.**|[Operators support](https://docs.percona.com/everest/release-notes/Percona-Everest-1.4.0-%282024-12-15%29.html#__tabbed_1_4)|Support for PSMDB Operator v1.18.0 and PG operator v2.5.0|
    | **5.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.4.0|
    | **6.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.4.0|
    | **8.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.4.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.4.0|


## Release highlights

=== "Helm charts"
    ### Simplify your Percona Everest deployments with Helm

    We are excited to announce the launch of Helm charts in Percona Everest 1.4.0. [Helm charts](https://helm.sh/) simplify the deployment process by packaging all necessary resources and configurations, making them ideal for automating and managing installations in Kubernetes environments.

    Percona Helm charts can be found in [percona/percona-helm-charts]( https://github.com/percona/percona-helm-charts/tree/main/charts/everest) repository in Github.

    ??? info "Install Percona Everest with Helm"

        1. Add the Percona Helm repository:

            ```sh
            helm repo add percona https://percona.github.io/percona-helm-charts/
            ```

        2. Install Percona Everest:

            ```sh
            helm install everest-core percona/everest \
            --namespace everest-system \
            --create-namespace
            ```
        
            For a deep dive into using Helm charts for installing Percona Everest, refer to our [documentation](https://docs.percona.com/everest/install/install_everest_helm_charts.html).


    Don't miss our [Upgrade :material-arrow-right:](https://docs.percona.com/everest/upgrade/upgrade_with_helm.html){.md-button} or [Uninstall :material-arrow-right:](https://docs.percona.com/everest/uninstall/uninstall_everest_helm.html){.md-button} sections, which provide information on upgrading or uninstalling Percona Everest with Helm.
    
=== "Namespaces management"

    ### Manage your namespaces with new everestctl commands

    Namespace management is essential in Percona Everest for efficiently organizing, securing, and allocating resources, particularly in large and complex Kubernetes environments. By leveraging Kubernetes namespaces, Percona Everest achieves logical isolation, enhanced security, and better resource allocation for databases, backups, and monitoring setups.


    Starting with Percona Everest 1.4.0, we have introduced new `everestctl` commands to manage your namespaces. These commands enable you to:
        
    - [Add new namespaces](https://docs.percona.com/everest/administer/manage_namespaces.html#add-new-namespaces)
    - [Update existing namespaces](https://docs.percona.com/everest/administer/manage_namespaces.html#update-namespaces)
    - [Delete any used namespaces](delete-namespaces)

    For a deep dive into managing namespaces for provisioning DB namespaces in Percona Everest, refer to our [documentation](https://docs.percona.com/everest/administer/manage_namespaces.html).

=== "Improved edit database flow"

    ### Removal of the Edit DB Wizard for an enhanced User Experience

    Starting with Percona Everest 1.4.0, we have removed the **Edit DB** wizard to provide a more streamlined user experience. You can now edit specific fields directly from the **DB Overview** screen using our new editable widgets, eliminating the need to navigate through the entire **Edit DB** wizard.

    ![!image](../images/remove_edit_db_wizard.png)

     Let's assume you want to make changes to **Point-in-time-Recovery (PITR)**. First, navigate to the specific database. Then, go to **Overview > Point-in-time-Recovery (PITR)** and click **Edit**. Make the necessary changes and click **Save**.

    ![!image](../images/remove_db_wizard_edit_resource_widget.png)

=== "Operators support"

    ### Support for PSMDB Operator v1.18.0 and PG operator 2.5.0

    Starting with Percona Everest 1.4.0, we are thrilled to announce that we have added support for PSMDB Operator v1.18.0 and PG operator v2.5.0.

## New features


- [EVEREST-1511](https://perconadev.atlassian.net/browse/EVEREST-1511): We have introduced Helm charts, which simplify the Percona Everest deployment process by packaging all necessary resources and configurations. These charts are ideal for automating and managing installations in Kubernetes environments.

- [EVEREST-1512](https://perconadev.atlassian.net/browse/EVEREST-1512): You can now seamlessly upgrade your Percona Everest installation using Helm, a package manager for Kubernetes. This streamlined process simplifies the upgrade experience.

- [EVEREST-1673](https://perconadev.atlassian.net/browse/EVEREST-1673): Starting with Percona Everest 1.4.0, we have introduced new `everestctl` commands to manage your namespaces.

- [EVEREST-908](https://perconadev.atlassian.net/browse/EVEREST-908): Starting with Percona Everest 14.0, the **Overview** screen now includes the **Connection URL** in the **Connection Details** section of the **DB Details** widget, allowing you to copy it directly.

- [EVEREST-1599](https://perconadev.atlassian.net/browse/EVEREST-1599): We have added support for PostgreSQL operator v2.5.0.

- [EVEREST-1624](https://perconadev.atlassian.net/browse/EVEREST-1624): We have added support for PSMDB Operator v1.18.0.


## Improvement

- [EVEREST-1065](https://perconadev.atlassian.net/browse/EVEREST-1065): Starting with Percona Everest 1.4.0, we have removed the **Edit** button from the database list actions. This change provides a more streamlined user experience, allowing you to edit the database directly from the database **Overview** screen without having to go through the entire edit wizard.


- [EVEREST-1066](https://perconadev.atlassian.net/browse/EVEREST-1066): We have improved the **Backups & PITR** widget on the database **Overview** screen. With this enhancement, you can now directly enable or disable PITR by clicking **Edit** from this screen.

- [EVEREST-1210](https://perconadev.atlassian.net/browse/EVEREST-1210): The **Advanced Configuration** panel on the **DB Details** widget is now more user-friendly than ever. You can  edit or enable parameters directly from the database **Overview** screen. Just click **Edit**, and and make your changes with ease.

- [EVEREST-1304](https://perconadev.atlassian.net/browse/EVEREST-1304): We have simplified the create database wizard. When you click on **Create Database**, a menu shows up under the button with the options **MySQL**, **PostgreSQL**, and **MongoDB**. After selecting a database type, you will be guided to the wizard with the chosen value pre-set.

- [EVEREST-1546](https://perconadev.atlassian.net/browse/EVEREST-1546): You can see the number of proxies, routers, and bouncers, along with their resources, directly on the **Database Summary** and **Overview** screens. This enhancement provides greater visibility into the resources within your clusters.

- [EVEREST-1683](https://perconadev.atlassian.net/browse/EVEREST-1683): The **Backups** on the **Overview** screen are organized in descending order, making it easier to find your most recent backups by their start date and time.

- [EVEREST-1686](https://perconadev.atlassian.net/browse/EVEREST-1686): We've adopted a 24-hour time format for our backups and restores to eliminate any potential confusion and ensure consistency across Percona Everest.

- [EVEREST-1687](https://perconadev.atlassian.net/browse/EVEREST-1687): The label for the upgrade CRD button has been shortened to improve readability.  

- [EVEREST-1701](https://perconadev.atlassian.net/browse/EVEREST-1701): Starting with Percona Everest 1.4.0, when configuring RBAC policies, the resource name for `database-cluster-backups` now corresponds to the database name instead of the backup name. This change allows for a more intuitive configuration of permissions for backups at the database level.


- [EVEREST-1702](https://perconadev.atlassian.net/browse/EVEREST-1702): Starting with Percona Everest 1.4.0, when configuring RBAC policies, the resource name for `database-cluster-restores` now corresponds to the database name instead of the restore name. This change allows for a more intuitive configuration of permissions for backups at the database level.

## Bugs

- [EVEREST-1688](https://perconadev.atlassian.net/browse/EVEREST-1688): If a user changed the value for the number of shards and then scrolled down, the number of shards would unexpectedly increase. Conversely, if they scrolled up, the number of shards would decrease. The value did not remain constant, and similar behavior was observed with other fields as well. This issue has been resolved now, and the values for the fields remain constant.

- [EVEREST-1187](https://perconadev.atlassian.net/browse/EVEREST-1187): We’ve resolved the issue that prevented Point-In-Time Recovery (PITR) from being enabled for the PostgreSQL database after setting up backup schedules on the **Backups** page.

- [EVEREST-1235](https://perconadev.atlassian.net/browse/EVEREST-1235), [EVEREST-1254](https://perconadev.atlassian.net/browse/EVEREST-1254): `everestctl` now provides relevant error messages when using the `install` command, helping you identify any issues that occurred during the installation process. For instance, if the kubeconfig is unavailable, the cluster configuration is incorrect, or the cluster cannot be connected to, `everestctl` will display an appropriate error message.

- [EVEREST-1254](https://perconadev.atlassian.net/browse/EVEREST-1254): During the uninstallation of Percona Everest, an unusual error code appeared at the end of the process. The issue has been resolved now.

- [EVEREST-1301](https://perconadev.atlassian.net/browse/EVEREST-1301) \[UI\] Mongodb backup schedule can't be created if a schedule with a different backup storage is created in db edit

- [EVEREST-1320](https://perconadev.atlassian.net/browse/EVEREST-1320): The warning message for a gap in Point-in-Time Recovery (PITR) is now shown on both the **Backups** and **Restores** pages. Additionally, when the database is up and running, there is a triangle icon on the dashboard page that now correctly directs you to the **Backups** page.

- [EVEREST-1352](https://perconadev.atlassian.net/browse/EVEREST-1352): To ensure data integrity, all database actions are now disabled while the database is in a **Deleting** state.

- [EVEREST-1399](https://perconadev.atlassian.net/browse/EVEREST-1399): The **Resource per node** now accurately displays the value set during database creation. Previously, there was a mismatch between the value chosen at setup and what was shown when editing the database. Instead, it defaulted to **Custom**, which was not the initial selection. 

- [EVEREST-1407](https://perconadev.atlassian.net/browse/EVEREST-1407): We've resolved an issue where a user lacking the necessary RBAC permissions could access specific information in Percona Everest.

- [EVEREST-1440](https://perconadev.atlassian.net/browse/EVEREST-1440): We've resolved an issue that caused a delay while loading the **Backups** page. Furthermore, the **Add Storage** option was displayed on the **Backups** page even though the user did not have backup storage permissions.

- [EVEREST-1518](https://perconadev.atlassian.net/browse/EVEREST-1518): We've resolved an issue that allowed users to see and edit DB clusters without the required permissions for the database engine(s).


- [EVEREST-1534](https://perconadev.atlassian.net/browse/EVEREST-1534) \[RBAC\] '/databases' page does not show any individual dbs from the policy

- [EVEREST-1565](https://perconadev.atlassian.net/browse/EVEREST-1565): The MongoDB versions are now sorted in descending order, and all the versions are visible on the **Basic information** page when selecting the **Database version**.

- [EVEREST-1593](https://perconadev.atlassian.net/browse/EVEREST-1593): We’ve resolved an issue that was preventing the display name and database version from showing up during new cluster creation.

- [EVEREST-1594](https://perconadev.atlassian.net/browse/EVEREST-1594): Scheduled backups begin to fail after several successful backups when the number of shards in the MongoDB sharded cluster is changed.

- [EVEREST-1604](https://perconadev.atlassian.net/browse/EVEREST-1604) \[RBAC\] Create a database from a backup is successful if the user does not have database-engines permissions

- [EVEREST-1608](https://perconadev.atlassian.net/browse/EVEREST-1608) \[UI\] Error should be displayed on Resources page if the proxies field has no value

- [EVEREST-1613](https://perconadev.atlassian.net/browse/EVEREST-1613) Issue with Topology Settings Reverting to "Custom" in Percona Everest UI

- [EVEREST-1615](https://perconadev.atlassian.net/browse/EVEREST-1615) \[CLI\] Uninstall fails if a mongodb sharded cluster is in Deleting state

- [EVEREST-1630](https://perconadev.atlassian.net/browse/EVEREST-1630) "Config Servers" Reset to Default Value of 1 in GUI After Editing Resources

- [EVEREST-1642](https://perconadev.atlassian.net/browse/EVEREST-1642) \[UI\] Database version can be changed when restoring to a new database

- [EVEREST-1649](https://perconadev.atlassian.net/browse/EVEREST-1649) UI - Backup "Add Storage" Button Inactive After Refresh

- [EVEREST-1650](https://perconadev.atlassian.net/browse/EVEREST-1650) UI - Unable to Create Backup After Adding Storage

- [EVEREST-1694](https://perconadev.atlassian.net/browse/EVEREST-1694) \[RBAC\] Backup storages page is empty if user only has access to a single storage

- [EVEREST-1695](https://perconadev.atlassian.net/browse/EVEREST-1695) \[RBAC\] Monitoring instances page is empty if user only has access to a single instance

- [EVEREST-1700](https://perconadev.atlassian.net/browse/EVEREST-1700) Database clusters restarted on creation when PMM monitoring enabled

- [EVEREST-1703](https://perconadev.atlassian.net/browse/EVEREST-1703) \[UI\] MongoDB sharded cluster is stuck after selecting not enough config serbvers

- [EVEREST-1712](https://perconadev.atlassian.net/browse/EVEREST-1712): We've resolved an issue where the Percona Everest UI pages became unresponsive after some time. None of the page elements worked, and the only solution was to close the page and start a new browser session.
