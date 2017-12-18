# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'vidibus/validate_uri/version'

Gem::Specification.new do |s|
  s.name        = 'vidibus-validate_uri'
  s.version     = Vidibus::ValidateUri::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Andre Pankratz'
  s.email       = 'andre@vidibus.com'
  s.homepage    = 'https://github.com/vidibus/vidibus-validate_uri'
  s.summary     = 'URI validation for Rails 3'
  s.description = 'It provides validation of URIs (URLs) to ActiveModel records and ActionControllers in Rails 3.'
  s.license = 'MIT'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'vidibus-validate_uri'

  s.add_dependency 'rack'
  s.add_dependency 'activesupport'
  s.add_dependency 'activemodel'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'actionpack'
  s.add_development_dependency 'webmock'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[LICENSE README.md Rakefile]
  s.require_path = 'lib'
end
