# Use cases: Import external database backups into Percona Everest

Here are some common use cases for importing database backups into Percona Everest.

## Restore a PostgreSQL cluster from an S3 backup

A user has a logical backup of their PostgreSQL database (created using pg_dump) stored in an Amazon S3 bucket. They want to initialize a new PostgreSQL cluster in Percona Everest using this backup.


## Import a MySQL dump from Google Cloud Storage (GCS)

A user has an existing MySQL dump file saved on Google Cloud Storage. They want to spin up a new MySQL cluster into a new everest-managed MySQL cluster.

## Migrate from MongoDB Atlas to Percona Everest

A user wants to migrate from MongoDB Atlas using a `mongodump` export and import it into a MongoDB cluster on Percona Everest.


## Create and share a custom import strategy

A user wants to build and reuse a custom data import strategy for their organization and make it available in Percona Everest.


