module Vidibus
  module ValidateUri
    class UriValidator < ActiveModel::EachValidator
      include Vidibus::ValidateUri::InstanceMethods
      
      def validate_each(record, attribute, value)
        unless validate_uri(value, options)
          record.errors[attribute] << 'is not a valid uri'
        end
      end
    end
  end
end