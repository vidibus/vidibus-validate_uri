module Vidibus
  module ValidateUri
    module InstanceMethods
      
      PORT_REGEXP = /(([:]\d+)?)/
      DOMAIN_REGEXP = /([äüößa-z0-9\-]+\.?)*([äüößa-z0-9]{2,})\.([a-z]{2,}){1,2}/
      IP_REGEXP = /(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5])(?:\/(?:[12]?\d|3[012])|-(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5]))?/
      PATH_REGEXP = /(\/?\?[a-z0-1\-_\&=]*)?/
      FRAGMENT_REGEXP = /(\#.*)?/
      
      # Returns true if given uri is valid.
      #
      # To restrict to a certain protocol, set
      #   :protocol => :rtmp
      #   or
      #   :protocol => [:rtsp, :rtmp]
      #
      def validate_uri(uri, options = {})
        return false if uri.blank?
        if protocol = options[:protocol]
          protocol = [protocol] unless p.is_a?(Array)
          map = protocol.map { |p| p.to_s }.join("|")
          protocol_regexp = /#{map}/
        else
          protocol_regexp = /\w+/
        end
        regexp = /^#{protocol_regexp}:\/\/(#{DOMAIN_REGEXP}|#{IP_REGEXP})#{PORT_REGEXP}#{PATH_REGEXP}#{FRAGMENT_REGEXP}$/i
        uri.match(regexp) ? true : false
      end
    end
  end
end