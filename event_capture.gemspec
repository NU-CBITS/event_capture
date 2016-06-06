# frozen_string_literal: true
$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_capture/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_capture"
  s.version     = EventCapture::VERSION
  s.authors     = ["Eric Carty-Fickes"]
  s.email       = ["ericcf@northwestern.edu"]
  s.homepage    = "https://github.com/NU-CBITS/event_capture"
  s.summary     = "A Rails engine for capturing events."
  s.description = "A Rails engine for capturing client side events."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*",
                "MIT-LICENSE",
                "Rakefile",
                "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "pg", "~> 0.18"
  s.add_development_dependency "rspec-rails", "~> 3.5.0.beta3"
  s.add_development_dependency "jasmine-rails", "~> 0.10"
  s.add_development_dependency "jshintrb", "~> 0.2"
  s.add_development_dependency "rubocop", "= 0.40"
end
