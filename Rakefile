# frozen_string_literal: true

require 'bundler/gem_tasks'
task default: :spec

desc 'Release gem '
task :release_github_rubygems do
  Rake::Task['release'].invoke
  gem_name = "pkg/#{Palladium::NAME}-"\
              "#{Palladium::VERSION}.gem"
  sh('gem push --key github '\
   '--host https://rubygems.pkg.github.com/flaminestone '\
   "#{gem_name}")
end
