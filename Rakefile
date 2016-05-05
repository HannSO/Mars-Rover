require 'rspec/core/rake_task'
require './lib/controller.rb'

RSpec::Core::RakeTask.new :test do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task default: [:test]

task :run do
  nasa = Controller.new
  nasa.initiate_rover_fleet
end
