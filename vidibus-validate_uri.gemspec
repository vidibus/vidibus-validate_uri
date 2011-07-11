# encoding: UTF-8
lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "vidibus/validate_uri/version"

Gem::Specification.new do |s|
  s.name        = "vidibus-validate_uri"
  s.version     = Vidibus::ValidateUri::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Andre Pankratz"
  s.email       = "andre@vidibus.com"
  s.homepage    = "https://github.com/vidibus/vidibus-validate_uri"
  s.summary     = "URI validation for Rails 3"
  s.description = "It provides validation of URIs (URLs) to ActiveModel records and ActionControllers in Rails 3."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vidibus-resource"

  s.add_dependency "rack", "~> 1.2.1"
  s.add_dependency "activesupport", "~> 3"
  s.add_dependency "activemodel", "~> 3"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "rcov"
  s.add_development_dependency "rspec", "~> 2"
  s.add_development_dependency "rr"
  s.add_development_dependency "actionpack", "~> 3"
  s.add_development_dependency "webmock"

  s.files = Dir.glob("{lib,app,config}/**/*") + %w[LICENSE README.md Rakefile]
  s.require_path = "lib"
end
