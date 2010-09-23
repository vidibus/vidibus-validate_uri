require "rails"
require "active_support/core_ext"

$:.unshift(File.join(File.dirname(__FILE__), "..", "lib", "vidibus"))
require "validate_uri"

module Vidibus::ValidateUri
  class Engine < ::Rails::Engine; end
end
