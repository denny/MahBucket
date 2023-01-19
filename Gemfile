ruby "3.0.0"

source 'https://rubygems.org' do
  gem 'rails', '~> 6.1.0'

  # Use postgres as the database for Active Record
  gem 'pg'
  # Use Puma as the app server
  gem 'puma', '~> 5.6'
  # Use SCSS for stylesheets
  gem 'sass-rails'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails'

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Authenticate via Google OAuth
  gem 'omniauth', '~> 2.0'
  gem 'omniauth-google-oauth2'
  gem 'omniauth-rails_csrf_protection'
  gem 'repost'

  # Store files on Amazon S3
  gem 'aws-sdk-s3'
  # Paperclip is no longer maintained and isn't compatible with Ruby 3.
  # We switched to kt-paperclip.  Sadly we use paperclip-meta for width and height
  # which is tied to the original paperclip. The author refused the PR that fixes this
  # so we're now using a version that someone else has fixed!
  gem "kt-paperclip", '>= 7.0.1'
  gem 'paperclip-meta', git: 'https://github.com/GoodMeasuresLLC/paperclip-meta'
  # Add tag features
  gem 'acts-as-taggable-on'

  # Pagination
  gem 'kaminari'

  # New Relic monitoring
  gem 'newrelic_rpm'

  # Error reporting
  gem 'sentry-rails'
  gem 'sentry-ruby'

  # https://github.com/advisories/GHSA-vr8q-g5c7-m54m
  gem "nokogiri", ">= 1.11.0.rc4"

  group :development, :test do
    # Audit gems for security vulnerabilities
    gem 'brakeman'
    gem 'bundler-audit', require: false
    gem 'capybara'
    gem 'pry-rails'
    gem 'rspec-rails'
  end

  group :development do
    gem 'listen'
    gem 'rails-erd'
    gem 'rubocop', require: false
    gem 'rubocop-performance', require: false
    gem 'rubocop-rails', require: false
    gem 'rubocop-rspec', require: false

  end

  group :test do
    gem 'codecov', require: false
    gem 'database_cleaner'
    gem 'rspec'
    gem 'rspec_junit_formatter'
    gem 'selenium-webdriver'
    gem 'webdrivers', '~> 4.4'
  end
end
