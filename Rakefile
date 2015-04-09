require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './app/data_mapper_setup'

Cucumber::Rake::Task.new :cuke
RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new :cop

task default: [:cuke, :spec, :cop]

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Autoupgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Automigrate complete (data could have been lost)"
end
