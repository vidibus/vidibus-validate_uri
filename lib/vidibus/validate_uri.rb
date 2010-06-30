require "validate_uri/instance_methods"
require "validate_uri/extensions"
require "validate_uri/uri_validator"

# Add UriValidator
ActiveModel::Validations.send(:include, Vidibus::ValidateUri)