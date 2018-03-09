module Vidibus
  module ValidateUri
    module Extensions
      module Controller
        include Vidibus::ValidateUri::Core

        def self.included(base)
          base.class_eval do
            helper_method(:validate_uri) if respond_to?(:helper_method)
          end
        end
      end
    end
  end
end
