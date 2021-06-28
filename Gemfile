# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem "rspec"
gem "capybara"
gem "sinatra", "~> 2.1"
gem "sinatra-activerecord", "~> 2.0"
gem "sinatra-flash"
gem "rake", "~> 13.0"
gem "pg", "~> 1.2"
gem 'capybara', group: :test
gem 'rspec', group: :test
gem 'bcrypt'


group :test do
  gem "sinatra-contrib"
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'launchy'
  gem "selenium-webdriver"
  gem 'pry', '~> 0.13.1'
  gem 'rexml'
  gem "webrick", "~> 1.7"
end
