# What's new in Percona Everest 1.4.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


??? info "Release summary at a glance"

    |**Sr. No**|**Release summary**|**Description**|
    |---------|---------------------|---------|
    | **1.**  |[Helm charts]()||
    | **2.**  |[MongoDB Sharding](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#__tabbed_1_2)|Introducing **sharding** in Percona Everest: Optimize your MongoDB databases with sharding|

    | **5.**|[New features](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#new-features)|Check out the new features introduced in Percona Everest 1.4.0|
    | **6.**|[Improvements](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#improvements)|Discover all the enhancements featured in Percona Everest 1.4.0|
    | **7.**|[Deprecated APIs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#deprecated-api-endpoints)|Discover all the Deprecated APIs from Percona Everest 1.4.0|
    | **8.**|[Bugs](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#bugs)|Find out about all the bugs fixed in Percona Everest 1.4.0|
    | **9.**|[Known limitations](https://docs.percona.com/everest/release-notes/Percona-Everest-1.3.0-%282024-11-18%29.html#known-limitations)|Discover all the known limitations in Percona Everest 1.4.0|


## Release highlights


=== "Helm charts"

    ### Capability to configure proxy nodes and define their resource limits

    Starting with Percona Everest 1.3.0, we have introduced a new feature that permits you to customize the number of proxies and their resources, including the allocation of CPU and RAM for each proxy. This feature mirrors the existing capability to customize the number of database engine replicas and allocate resources to them.

    With this feature, you now have more flexibility to customize the resources allocated to proxies according to your needs, thus providing more control over your Percona Everest deployments.


    ![!image](../images/proxies_resources.png)

=== "MongoDB sharding"

    ### Optimize MongoDB with sharding in Percona Everest

    !!! warning
         - Sharding is currently in **Technical Preview**. Early adopters are advised to use this feature only for testing purposes and not in production environments.
        -  Check out the [known limitations](#known-limitations) section for important information about the limitations of sharding.

        - If you reshard or unshard a collection, create a new backup to avoid data inconsistency and restore failure.

    We're excited to announce that we've achieved another milestone with the implementation of MongoDB sharding in Percona Everest 1.3.0. You can now harness the benefits of sharding for your MongoDB databases with Percona Everest.

    [Sharding  :octicons-link-external-16:](https://docs.mongodb.com/manual/reference/glossary/#term-sharding) is used for horizontal database scaling. It distributes a database horizontally across multiple nodes or servers, known as **shards**. Each shard manages a portion of the data, forming a sharded cluster, which enables MongoDB to handle large datasets and high user concurrency effectively.

    The key components of MongoDB sharding are:

    - Shard: Each shard has a subset of the data.
    - Mongos: The query router directs the client queries to the proper shard(s).
    - Config servers: The configuration servers store the cluster's metadata and configuration settings.

    Here's how you can enable sharding:

    On the **Create Database** wizard, select **MongoDB** database and turn on the **Sharded Cluster** toggle.

    ![!image](../images/enable_sharding.png)

    If you're looking to dive deeper into MongoDB sharding, check out the [documentation](https://docs.percona.com/everest/use/mongo_sharding.html).

