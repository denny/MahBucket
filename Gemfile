source 'https://rubygems.org' do
  gem 'rails', '~> 6.0.3'

  # Use postgres as the database for Active Record
  gem 'pg'

  # Use Puma as the app server
  gem 'puma', '~> 5.0'

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 6.0'
# Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'

  # Authenticate via Google OAuth
  gem 'omniauth', '~> 2.0'
  gem 'omniauth-google-oauth2'
  gem 'omniauth-rails_csrf_protection', '~> 1.0'
  gem 'repost'

  # Store files on Amazon S3
  gem 'aws-sdk-s3'
  gem 'paperclip', '~> 6.1.0'
  gem 'paperclip-meta'

  # Add tag features
  gem 'acts-as-taggable-on'

  # Pagination
  gem 'kaminari'

  # New Relic monitoring
  gem 'newrelic_rpm'

  # https://github.com/advisories/GHSA-vr8q-g5c7-m54m
  gem "nokogiri", ">= 1.11.0.rc4"

  group :development, :test do
    # Audit gems for security vulnerabilities
    gem 'brakeman', require: false
    gem 'bundler-audit', require: false

    gem 'pry-rails'
  end

  group :development do
    gem 'rubocop', require: false
    gem 'rubocop-performance', require: false
    gem 'rubocop-rails', require: false
    gem 'rubocop-rspec', require: false

    gem 'listen', '~> 3.2.1'

    gem 'rails-erd', require: false
  end

  group :test do
    gem 'rspec'
    gem 'rspec-rails', '~> 4.0'

    gem 'database_cleaner'

    gem 'capybara'
    gem 'selenium-webdriver'
    gem 'webdrivers', '~> 4.4'

    gem 'codecov', require: false
    gem 'rspec_junit_formatter'
  end
end
