require "validate_uri/extensions/controller"

ActiveSupport.on_load(:action_controller) do
  include Vidibus::ValidateUri::Extensions::Controller
end