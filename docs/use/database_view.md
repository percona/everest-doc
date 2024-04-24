# Database view

The database view in Percona Everest provides an interface to view and provision your databases. With the database view, you can keep a close eye on all your databases and their status and perform tasks such as backup and restore.


   ![!image](../images/database_view.png)

By clicking on the individual database, you will be able to perform various actions such as:

   ![!image](../images/database_view_actions.png)


 - **Edit the database**
    
    To edit any parameters for your database, click the ellipsis (...) menu next to the database you want to edit, then click **Edit**. Make the required changes on the screens that follow and then click **Edit database**.

 -  **Restart the database**

     Restarting your database can improve the performance of your database and enable you to apply recent configuration changes. 
    
     To restart your database, click the ellipsis (...) menu next to the database you want to restart, then click **Restart**. 


 - **Create database from a backup**

    With Percona Everest, you have the ability to create a database by using a backup. 
    
    To create a backup, click the ellipsis (…) menu next to the database, then click **Create database from a backup**. For more in-depth instructions on how to create a database from a backup, refer to the [create a database from a backup ](createBackups/create_new_database.md).

 - **Restore database from a backup**

     With Percona Everest, you have the ability to restore your database using a backup. 
    
     To restore your database, click the ellipsis (...) menu next to the database, then click **Restore database from a backup**. For more in-depth instructions on how to restore a database, refer to the [restore a database from a backup](createBackups/RestoreBackup.md) section.


 - **Suspend the database**

     Suspending your database can save resources when it's not being used. Pausing it can also conserve CPU and memory. 
    
     To suspend your database, click the ellipsis (...) menu next to the database you want to suspend, then click **Suspend**. To resume your database click **Resume**. You database will be immediately resumed.

 - **Delete the database**

     When you no longer need your database, you can delete it. 
    
     To delete your database, click the ellipsis (...) menu next to the database you want to suspend, then click **Delete**.


## Detailed database view

You have the option to access a comprehensive overview of any specific database. To access this information, click on that specific database, the **Overview**, **Backups** and **Restores** tabs will be dispalyed.

- **Overview**

    This tab dispalys all the database details.

    ![!image](../images/database_details.png)


- **Backups** 

    This tab displays the details of backups taken for that database, including the date and time of the backup.


    ![!image](../images/database_backups.png)


- **Restores**

    This tab displays the details of the resrtores for that database including the date and time of the restore.

    ![!image](../images/database_restores.png)
