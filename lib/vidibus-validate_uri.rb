require 'active_support'
require 'active_support/core_ext'
require 'active_model'

require 'vidibus/validate_uri'

if defined?(Rails)
  module Vidibus::ValidateUri
    class Engine < ::Rails::Engine; end
  end
end
