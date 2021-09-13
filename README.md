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

## Running locally
If you are docker enabled then there is a very simple docker compose
setup that when run will run rubocop, rspecs and if successful launch
the app.

Run with
```
docker compose up
```


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


## Copyright and Credits

Mah Bucket is copyright (c) 2017-2020 Denny de la Haye - https://denny.me

Initial development was largely paid for by [38 Degrees](https://38degrees.org.uk)

Initial development was greatly assisted by [Eliot Sykes](https://eliotsykes.com)


## Licensing

Mah Bucket is free software; you can redistribute it and/or modify it under
the terms of the GPL (version 2 or later). There are copies of v2 and v3 of
the GPL in [docs/Licensing](docs/Licensing), or you can read them online:  
https://opensource.org/licenses/gpl-2.0  
https://opensource.org/licenses/gpl-3.0


## Current Status

[![CircleCI](https://circleci.com/gh/denny/MahBucket.svg?style=svg)](https://circleci.com/gh/denny/MahBucket)  [![Travis CI](https://travis-ci.org/denny/MahBucket.svg?branch=main)](https://travis-ci.org/denny/MahBucket)  [![codecov](https://codecov.io/gh/denny/MahBucket/branch/main/graph/badge.svg)](https://codecov.io/gh/denny/MahBucket)  [![CodeClimate](https://api.codeclimate.com/v1/badges/7bc3b576f0265db7b8f8/maintainability)](https://codeclimate.com/github/denny/MahBucket/maintainability)
