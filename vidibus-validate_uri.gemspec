# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vidibus-validate_uri}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Pankratz"]
  s.date = %q{2011-05-04}
  s.description = %q{It provides validation of URIs (URLs) to ActiveModel records and ActionControllers in Rails 3.}
  s.email = %q{andre@vidibus.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config/locales/de.yml",
    "config/locales/en.yml",
    "lib/vidibus-validate_uri.rb",
    "lib/vidibus/validate_uri.rb",
    "lib/vidibus/validate_uri/core.rb",
    "lib/vidibus/validate_uri/extensions.rb",
    "lib/vidibus/validate_uri/extensions/controller.rb",
    "lib/vidibus/validate_uri/uri_validator.rb",
    "spec/spec_helper.rb",
    "spec/vidibus/validate_uri/action_controller_spec.rb",
    "spec/vidibus/validate_uri/core_spec.rb",
    "spec/vidibus/validate_uri/uri_validator_spec.rb",
    "vidibus-validate_uri.gemspec"
  ]
  s.homepage = %q{http://github.com/vidibus/vidibus-validate_uri}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Provides an URI validator for Rails 3.}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/vidibus/validate_uri/action_controller_spec.rb",
    "spec/vidibus/validate_uri/core_spec.rb",
    "spec/vidibus/validate_uri/uri_validator_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<relevance-rcov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<relevance-rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<relevance-rcov>, [">= 0"])
  end
end

