require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Cucumber::Rake::Task.new :cuke
RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new :cop

task default: [:cuke, :spec, :cop]
