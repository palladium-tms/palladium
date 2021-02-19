# Palladium API Gem

Wrapper gem for usage of Palladium API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'palladium'
```

And then execute:

```shell script
bundle
```

Or install it yourself as:

```shell script
gem install palladium
```

## Usage

See `spec` files to usage examples

## New version release process

1. Increase version number in `lib/palladium/version.rb`
2. Add version header directly below `## master (unreleased)` in CHANGELOG.md
3. Make sure you're logged-in on Rubygems ([instruction](https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg))
   and on GitHub Package registry ([instruction](https://docs.github.com/en/packages/guides/configuring-rubygems-for-use-with-github-packages#authenticating-with-a-personal-access-token))
4. Run `rake release_github_rubygems`
5. After success of 4 step - go to [Release](https://github.com/flaminestone/palladium/releases)
   page and add new release and Changelog
