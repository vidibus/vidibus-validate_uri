require 'vidibus/validate_uri/core'
require 'vidibus/validate_uri/extensions'
require 'vidibus/validate_uri/uri_validator'

ActiveModel::Validations.send(:include, Vidibus::ValidateUri)
