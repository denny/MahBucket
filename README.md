# README

Mah Bucket is a file library with tagging, which uses Amazon S3 for storage.

It has primarily been developed for storing and organising image files, but
should hopefully be useful (or at least usable) for other file types too.


## Ruby version

  Mah Bucket was developed using Ruby 2.3.1 and 2.3.3, but will very probably
  work with earlier and later versions too.  If you find a version it won't run
  with, please let me know (by email, or by providing a patch to this README
  file).


## System dependencies



## Configuration

Set the following ENV vars:
```
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    S3_BUCKET
    S3_REGION
    S3_HOST_ALIAS
    DATABASE_URL
    GOOGLE_OAUTH_CLIENT_ID
    GOOGLE_OAUTH_CLIENT_SECRET
    GOOGLE_OAUTH_DOMAIN
```

You can save these in a .env file for use with Foreman, and/or to load using
the following command: export $(cat .env | grep -v ^# | xargs)


## Database creation

```
rake db:migrate
```

## Database initialization

```
psql
create database mahbucket;
```

## How to run the test suite


```
rspec
```


## Services

Mah Bucket uses Amazon S3 for file storage, Amazon RDS for data storage, 
and Google OAuth for authentication.


## Deployment instructions


## Author

Mah Bucket was written by Denny de la Haye <2018@denny.me>


## Copyright

(c) 2017-2018 Denny de la Haye


## Credits

Initial development was largely paid for by 38 Degrees (38degrees.org.uk)

Initial development was greatly assisted by Eliot Sykes (eliotsykes.com)


## Current Status

[![CircleCI](https://circleci.com/gh/denny/MahBucket.svg?style=svg)](https://circleci.com/gh/denny/MahBucket) (CircleCI)  [![Travis CI](https://travis-ci.org/denny/MahBucket.svg?branch=master)](https://travis-ci.org/denny/MahBucket) (Travis CI)  [![codecov](https://codecov.io/gh/denny/MahBucket/branch/master/graph/badge.svg)](https://codecov.io/gh/denny/MahBucket) (CodeCov)  [![CodeClimate](https://api.codeclimate.com/v1/badges/7bc3b576f0265db7b8f8/maintainability)](https://codeclimate.com/github/denny/MahBucket/maintainability) (Code Climate)
