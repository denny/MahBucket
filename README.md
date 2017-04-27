# README

Mah Bucket is a file library with tagging, which uses Amazon S3 for storage.

It has primarily been developed for storing and organising image files, but
should hopefully be useful (or at least usable) for other file types too.


* Ruby version

  Mah Bucket was developed using Ruby 2.3.1 and 2.3.3, but will very probably
  work with earlier versions too.  If you find a version it won't run with,
  please let me know (by email, or by providing a patch to this README file).


* System dependencies

* Configuration

  Set the following ENV vars:
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    S3_BUCKET
    S3_REGION
    S3_HOST_ALIAS
    DATABASE_URL
    GOOGLE_OAUTH_CLIENT_ID
    GOOGLE_OAUTH_CLIENT_SECRET
    GOOGLE_OAUTH_DOMAIN

You can save these in a .env file for use with Foreman, and/or to load using
the following command: export $(cat .env | grep -v ^# | xargs)


* Database creation

```
rake db:migrate
```

* Database initialization

```
psql
create database mahbucket;
```

* How to run the test suite


```
rspec
```

Circle CI status: [![CircleCI](https://circleci.com/gh/38dgs/MahBucket.svg?style=svg)](https://circleci.com/gh/38dgs/MahBucket)


* Services

  Mah Bucket uses Amazon S3 for file storage, Amazon RDS for data storage,
  and Google OAuth for authentication.


* Deployment instructions


* Author

Mah Bucket was written by Denny de la Haye <2017@denny.me>


* Copyright

(c) 2017 Denny de la Haye


* Credits

Initial development was largely paid for by 38 Degrees (38degrees.org.uk)

Initial development was greatly assisted by Eliot Sykes (eliotsykes.com)
