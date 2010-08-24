$:.unshift(File.join(File.dirname(__FILE__), "..", "lib", "vidibus"))
require "validate_uri"
require "rails"

module Vidibus::ValidateUri
  class Engine < ::Rails::Engine; end
end