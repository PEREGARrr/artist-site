# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aws-sdk'
gem 'aws-sdk-s3'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails', groups: %i(development test)
gem 'foreman'
gem 'friendly_id', '~> 5.1.0'
gem 'instafeed'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'nokogiri', '~> 1.8.1'
gem 'paperclip'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rake', '~> 12.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'vital'
gem 'webpacker'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
