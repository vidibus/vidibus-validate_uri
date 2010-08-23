require "net/http"

module Vidibus
  module ValidateUri
    module InstanceMethods
      
      PORT_REGEXP = /(([:]\d+)?)/
      DOMAIN_REGEXP = /([äüößa-z0-9\-]+\.?)*([äüößa-z0-9]{2,})\.([a-z]{2,}){1,2}/ # TODO: Support more UTF-8 chars
      IP_REGEXP = /(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5])(?:\/(?:[12]?\d|3[012])|-(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5]))?/
      PATH_REGEXP = /(\/[a-z0-1\-_\.\,\/]*)?/
      PARAMS_REGEXP = /\/?(\?[a-z0-1\-_\&=]*)?/
      FRAGMENT_REGEXP = /(\#.*)?/
      
      # Returns true if given uri is valid.
      #
      # To restrict to a certain protocol, provide :protocol option:
      #
      #   valid_uri?(your_uri, :protocol => :rtmp)
      #   valid_uri?(your_uri, :protocol => [:rtsp, :rtmp])
      #
      # To check if the uri is accessible, provide :accessible option:
      #
      #   valid_uri?(your_uri, :accessible => true)
      #
      def valid_uri?(uri, options = {})
        return false if uri.blank?
        if protocol = options[:protocol]
          protocol = [protocol] unless p.is_a?(Array)
          protocol_regexp = /#{protocol.join("|")}/
        else
          protocol_regexp = /\w+/
        end
        regexp = /^#{protocol_regexp}:\/\/(localhost|#{DOMAIN_REGEXP}|#{IP_REGEXP})#{PORT_REGEXP}#{PATH_REGEXP}#{PARAMS_REGEXP}#{FRAGMENT_REGEXP}$/i
        valid = uri.match(regexp) ? true : false
        
        if valid == true and options[:accessible] == true and (ENV["RAILS_ENV"] != "test" or options[:test] == true)
          valid = accessible_uri?(uri)
        end
        
        return valid
      end
      
      protected
      
      # Checks if given uri is accessible.
      def accessible_uri?(uri)
        _uri = URI.parse(uri)
        path = _uri.path.blank? ? "/" : _uri.path
        begin
          Net::HTTP.start(_uri.host, _uri.port) { |http| http.head(path) }
          true
        rescue
          false
        end
      end
    end
  end
end