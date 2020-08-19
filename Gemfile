source 'https://rubygems.org' do
  gem 'rails', '~> 6.0.3'

  # Use postgres as the database for Active Record
  gem 'pg'
  # Use Puma as the app server
  gem 'puma', '~> 4.3'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 6.0'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 5.0'

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.10'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Authenticate via Google OAuth
  gem 'omniauth', '~> 1.9.1'
  gem 'omniauth-google-oauth2'

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

  group :development, :test do
    # Audit gems for security vulnerabilities
    gem 'brakeman'
    gem 'bundler-audit', require: false
    gem 'capybara'
    gem 'pry-rails'
    gem 'rspec-rails', '~> 4.0'
  end

  group :development do
    gem 'listen', '~> 3.2.1'
    gem 'rails-erd'
    gem 'rubocop', require: false
    gem 'rubocop-performance', require: false
    gem 'rubocop-rails', require: false
    gem 'rubocop-rspec', require: false

  end

  group :test do
    gem 'codecov', require: false
    gem 'database_cleaner'
    gem 'selenium-webdriver'
    gem 'webdrivers', '~> 4.4'
  end
end
