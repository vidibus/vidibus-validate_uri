module Vidibus
  module ValidateUri
    class UriValidator < ActiveModel::EachValidator
      include Vidibus::ValidateUri::Core

      def validate_each(record, attribute, value)
        if valid_uri?(value, options)
          if options[:accessible] == true and !accessible_uri?(value)
            record.errors.add(attribute, :inaccessible_uri)
          end
        else
          record.errors.add(attribute, :invalid_uri)
        end
      end
    end
  end
end
