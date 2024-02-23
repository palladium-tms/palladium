# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in palladium.gemspec
gemspec

group :development do
  gem 'rake', '~> 13'
  gem 'rubocop', '~> 1'
  gem 'rubocop-performance', '~> 1'
  gem 'rubocop-rake', '~> 0'
  gem 'rubocop-rspec', '~> 2'
  gem 'rubocop-packaging', '~> 0'
end

group :test do
  gem 'rspec', '~> 3'
end
