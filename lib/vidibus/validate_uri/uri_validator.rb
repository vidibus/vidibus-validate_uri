module Vidibus
  module ValidateUri
    class UriValidator < ActiveModel::EachValidator
      include Vidibus::ValidateUri::InstanceMethods
      
      def validate_each(record, attribute, value)
        unless valid_uri?(value, options)
          record.errors.add(attribute, :invalid_uri)
        end
      end
    end
  end
end