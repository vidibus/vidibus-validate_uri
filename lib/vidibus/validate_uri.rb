require "validate_uri/core"
require "validate_uri/extensions"
require "validate_uri/uri_validator"

ActiveModel::Validations.send(:include, Vidibus::ValidateUri)
