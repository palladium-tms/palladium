# frozen_string_literal: true

require_relative 'lib/palladium/name'
require_relative 'lib/palladium/version'

Gem::Specification.new do |s|
  s.name = Palladium::NAME
  s.version = Palladium::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.7'
  s.authors = ['Rotatyy Dmitriy']
  s.email = %w[flamine@list.ru]
  s.summary = 'Gem for using Palladium API'
  s.description = 'Wrapper gem for usage of Palladium API'
  s.homepage = "https://github.com/flaminestone/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('rubocop', '~> 1')
  s.add_development_dependency('rubocop-performance', '~> 1')
  s.add_development_dependency('rubocop-rake', '~> 0')
  s.add_development_dependency('rubocop-rspec', '~> 2')
end
