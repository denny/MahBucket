# README

Mah Bucket is a simple file library with search and tagging, which uses Amazon
S3 for storage.

It has primarily been developed for storing and organising image files, but
should hopefully be useful (or at least usable) for other file types too.


## Ruby and Rails versions

Mah Bucket was initially developed using Ruby 2.3.1 and Rails 5.0.1, and is
currently using Ruby 2.7.1 and Rails 6.0.3 - so it should have a fairly wide
compatibility range. If you find a version of either that it won't run with,
please let me know.


## System dependencies

The paperclip gem requires ImageMagick to be installed.


## Services

Mah Bucket uses Amazon S3 for file storage, Google OAuth for authentication,
and was developed using Postgres for data storage - although any database
supported by ActiveRecord should work.


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

`rails db:setup`


## How to run the test suite

`rspec`


## Author

Mah Bucket was written by Denny de la Haye <2020@denny.me>


## Copyright

(c) 2017-2020 Denny de la Haye


## Credits

Initial development was largely paid for by [38 Degrees](https://38degrees.org.uk)

Initial development was greatly assisted by [Eliot Sykes](https://eliotsykes.com)


## Current Status

[![CircleCI](https://circleci.com/gh/denny/MahBucket.svg?style=svg)](https://circleci.com/gh/denny/MahBucket)  [![Travis CI](https://travis-ci.org/denny/MahBucket.svg?branch=master)](https://travis-ci.org/denny/MahBucket)  [![codecov](https://codecov.io/gh/denny/MahBucket/branch/master/graph/badge.svg)](https://codecov.io/gh/denny/MahBucket)  [![CodeClimate](https://api.codeclimate.com/v1/badges/7bc3b576f0265db7b8f8/maintainability)](https://codeclimate.com/github/denny/MahBucket/maintainability)
