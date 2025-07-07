# Percona Everest: External cackup import use cases

Here are some common scenarios for importing database backups into Percona Everest.

## Restore a PostgreSQL cluster from an S3 backup

You have a logical backup of a PostgreSQL database, created using `pg_dump`, stored in an Amazon S3 bucket. You want to use this backup to initialize a new PostgreSQL cluster managed by Percona Everest.

## Import a MySQL dump from Google Cloud Storage (GCS)

You have an existing MySQL dump file saved on Google Cloud Storage and want to import it into a new everest-managed MySQL cluster.

## Migrate from MongoDB Atlas to Percona Everest

You want to migrate from MongoDB Atlas using a `mongodump` export and import it into a MongoDB cluster on Percona Everest.

## Create and share a custom import strategy

You want to develop and reuse a custom data import strategy for your organization and make it available within Percona Everest.


