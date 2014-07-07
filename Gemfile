# -*- coding: utf-8 -*-
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.2.rc1'

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'mysql2'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Ignore digest on assets:precompile for vendor file
gem 'non-stupid-digest-assets'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

# Authentication with OAuth
gem 'omniauth'
gem 'omniauth-twitter'

# Deploy with Capistrano
group :development do
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
end

# for angular
gem 'ng-rails-csrf'

group :development, :test do
  # for js test
  gem "teaspoon"
  gem "guard-teaspoon"
  gem "mocha"
  gem "selenium-webdriver"

  # for capybara test
  gem "capybara"
  gem 'minitest-power_assert'
end
