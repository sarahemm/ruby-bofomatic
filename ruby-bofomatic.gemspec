$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "bofomatic/version.rb"

Gem::Specification.new do |s|
  s.name        = "ruby-bofomatic"
  s.version     = BofOMatic::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["sen"]
  s.email       = ["rubygems@sen.cx"]
  s.homepage    = "http://github.com/sarahemm/ruby-bofomatic"
  s.summary     = "BoF-O-Matic API gem"
  s.license     = "MIT"
  s.description = "Gem for reading and writing data from BoF-O-Matic using the REST API."

  s.required_ruby_version = ">= 3.0.0"
  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rest-client", "~>2.0.0"

  s.files        = Dir.glob("lib/**/*") + %w[LICENSE README.md]
  s.require_path = "lib"
end
