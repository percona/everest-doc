# What's new in Percona Everest 1.3.0

To begin your journey with Percona Everest, check out the [Quickstart Guide for Percona Everest](../quickstart-guide/quick-install.md).


## Release summary

|**Sr. No**|**Release summary**|**Description**|
|---------|---------------------|---------|
| **1.**  |[MongoDB Sharding](#sharding)|Introducing **sharding** in Percona Everest: Optimize your MongoDB databases with sharding|
| **2.**  |[MongoDB Sharding](#sharding)|Introducing **sharding** in Percona Everest: Optimize your MongoDB databases with sharding|

| **3.**|[New features](#new-features)|Check out the new features introduced in Percona Everest 1.3.0|
| **4.**|[Improvements](#improvements)|Discover all the enhancements featured in Percona Everest 1.3.0|
| **5.**|[New and deprecated API's](#the-latest-in-apis-whats-new-and-whats-deprecated)|Discover all the new APIs that have been added to Percona Everest 1.3.0, as well as any deprecated APIs|
| **6.**|[Bugs](#bugs)|Find out about all the bugs fixed in Percona Everest 1.3.0|
| **7.**|[Known limitations](#known-limitations)|Discover all the known limitations in Percona Everest 1.3.0|


## Release highlights


### Optimize MongoDB with sharding in Percona Everest


We're excited to announce that we've achieved another milestone with the implementation of MongoDB sharding in Percona Everest 1.3.0. You can now harness the benefits of sharding for your MongoDB databases with Percona Everest.

[Sharding  :octicons-link-external-16:](https://docs.mongodb.com/manual/reference/glossary/#term-sharding) is used for horizontal database scaling. It distributes a database horizontally across multiple nodes or servers, known as **shards**. Each shard manages a portion of the data, forming a sharded cluster, which enables MongoDB to handle large datasets and high user concurrency effectively.

The key components of MongoDB sharding are:

- Shard: Each shard has a subset of the data.
- Mongos: The query router directs the client queries to the proper shard(s).
- Config servers: The configuration servers store the cluster's metadata and configuration settings.

Here's how you can enable sharding:

On the **Create Database** wizard, select **MongoDB** database and turn on the **Sharded Cluster** toggle.

![!image](../images/enable_sharding.png)


## New features

- [EVEREST-1303](https://perconadev.atlassian.net/browse/EVEREST-1303): We have introduced MongoDB sharding in Percona Everest 1.3.0. Now, you can benefit from sharding for your MongoDB databases with Percona Everest.

- [EVEREST-777](https://perconadev.atlassian.net/browse/EVEREST-777): You now have the ability to customize the number of proxy replicas and their resources, including CPU and RAM, just like you can already do for the number of DB engine replicas and resources.

- [EVEREST-1310](https://perconadev.atlassian.net/browse/EVEREST-1310): 


