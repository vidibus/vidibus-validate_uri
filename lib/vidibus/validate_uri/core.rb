# encoding: UTF-8
require "net/https"
require "uri"

module Vidibus
  module ValidateUri
    module Core

      PORT_REGEXP = /(([:]\d+)?)/
      DOMAIN_REGEXP = /([äüößa-z0-9\-]+\.?)*([äüößa-z0-9]{2,})\.([a-z]{2,}){1,2}/i # TODO: Add real IDN support
      IP_REGEXP = /(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5])(?:\/(?:[12]?\d|3[012])|-(?>(?:1?\d?\d|2[0-4]\d|25[0-5])\.){3}(?:1?\d?\d|2[0-4]\d|25[0-5]))?/
      PATH_REGEXP = /(\/[a-z0-9\-_\.\,\/]*)?/i
      PARAMS_REGEXP = /\/?(\?[a-z0-9\-_\&=\|]*)?/i
      FRAGMENT_REGEXP = /(\#.*)?/

      # Returns true if given URI is valid.
      #
      # To restrict URI to a certain protocol, provide :protocol option:
      #
      #   valid_uri?(your_uri, :protocol => :rtmp)
      #   valid_uri?(your_uri, :protocol => [:rtsp, :rtmp])
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
        return !!uri.match(regexp)
      end

      # Checks if given uri is accessible.
      # The check will not be performed in test environment.
      #
      def accessible_uri?(uri)
        return false unless valid_uri?(uri)
        return true if ENV["RAILS_ENV"] == "test"
        _uri = URI.parse(uri)
        path = _uri.path.blank? ? "/" : _uri.path
        begin
          http = Net::HTTP.new(_uri.host, _uri.port)
          if _uri.scheme == "https"
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          end
          http.start { |http| http.head(path) }
          true
        rescue => e
          if defined?(Rails) and Rails.logger
            Rails.logger.error "Accessing #{_uri.host} on port #{_uri.port} failed: #{e.inspect}"
          end
          false
        end
      end
    end
  end
end
