#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

Rake::TestTask.new do |task|
  task.libs << 'test'
  task.pattern = 'test/**/*_test.rb'
  task.verbose = true
end

desc 'Run specs'
task :default => :test
##task :default => :spec
