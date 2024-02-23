# Changelog

All notable changes to this project will be documented in this file.

## master (unreleased)

### New Features

* Add `ruby-3.1` and `ruby-3.2` to CI
* Add `yamllint` check in CI
* Add `dependabot` check for `GitHub Actions`
* Add several rspec tests

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

### Changes

* Require `mfa` for releasing gem
* Check `dependabot` at 8:00 Moscow time daily
* Remove support of `ruby-2.5` and `ruby-2.6` since they are EOL'ed
* Drop `ruby-2.7` support since it's EOL'ed

## 1.1.0 (2021-09-08)

### Fixes

* Correct usage of ssl connection

### Changes

* Default port now is 443

## 1.0.0 (2021-03-17)

### New Features

* Add support of `rubocop` with extensions
* Add `rubocop` to CI
* Add `dependabot` support
* Add `markdownlint` support in CI
* Add `rake` task for release and description to README

### Changes

* `.idea` folder added to `.gitignore`
* Cleanup `gemspec` file

## 0.3.4 (2018-11-14)

### New Features

* Add logging. By default, log level = 1 (info). Result link will be printed to stdout

## 0.3.3 (2018-08-16)

### New Features

* Add new attr_reader `result_set_link` for keeping link
  to result set after result adding

## 0.3.2 (2018-07-27)

### Fixes

* Return result_set_id for for every result, no for first

## 0.3.1 (2018-06-27)

### New Features

* Add new api method get_result_sets for getting result_sets by status

## 0.2.1 (2018-02-14)

### Fixes

* Fix: error with data input

## 0.2.0 (2018-02-14)

### Changes

* Change data format after api update to 0.1.0 version
