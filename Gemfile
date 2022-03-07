source 'https://rubygems.org' do
  # Rails 6.1
  gem 'rails', '~> 6.1'

  # Use postgres as the database for Active Record
  gem 'pg'
  # Use Puma as the webserver
  gem 'puma'
  
  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier'
  # Use SCSS for stylesheets
  gem 'sass-rails'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails'
  # Turbolinks makes navigating your webapp faster: https://github.com/turbolinks/turbolinks
  gem 'turbolinks'

  # Authenticate via Google OAuth
  gem 'omniauth', '~> 1.9.1'
  gem 'omniauth-google-oauth2'
  gem 'repost'

  # Store files on Amazon S3
  gem 'aws-sdk-s3'
  gem 'paperclip'
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
    gem 'brakeman'
    gem 'bundler-audit', require: false
    gem 'capybara'
    gem 'pry-rails'
    gem 'rspec-rails'
  end

  group :development do
    gem 'listen'
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
