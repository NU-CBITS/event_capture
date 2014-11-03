begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load "rails/tasks/engine.rake"

Bundler::GemHelper.install_tasks

require "rspec/core"
require "rspec/core/rake_task"

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(spec: "app:db:test:prepare")

require "jshintrb/jshinttask"
Jshintrb::JshintTask.new :jshint do |t|
  t.pattern = "app/assets/javascripts/**/*.js"
  t.options = :defaults
  t.globals = ["$"]
end

require "rubocop/rake_task"
RuboCop::RakeTask.new

task :default do
  Rake::Task["rubocop"].invoke
  Rake::Task["spec"].invoke
end
