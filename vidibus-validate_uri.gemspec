# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vidibus-validate_uri}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Pankratz"]
  s.date = %q{2010-08-24}
  s.description = %q{It provides validation of URIs (URLs) to ActiveModel records and ActionControllers in Rails 3.}
  s.email = %q{andre@vidibus.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "config/locales/en.yml",
     "lib/vidibus-validate_uri.rb",
     "lib/vidibus/validate_uri.rb",
     "lib/vidibus/validate_uri/extensions.rb",
     "lib/vidibus/validate_uri/extensions/controller.rb",
     "lib/vidibus/validate_uri/instance_methods.rb",
     "lib/vidibus/validate_uri/uri_validator.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/vidibus/validate_uri/action_controller_spec.rb",
     "spec/vidibus/validate_uri/instance_methods_spec.rb",
     "spec/vidibus/validate_uri/uri_validator_spec.rb",
     "vidibus-validate_uri.gemspec"
  ]
  s.homepage = %q{http://github.com/vidibus/vidibus-validate_uri}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides an URI validator for Rails 3.}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/vidibus/validate_uri/action_controller_spec.rb",
     "spec/vidibus/validate_uri/instance_methods_spec.rb",
     "spec/vidibus/validate_uri/uri_validator_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<relevance-rcov>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0.rc"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<relevance-rcov>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.0.0.rc"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<relevance-rcov>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.0.0.rc"])
  end
end

