$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "active_record"
require "action_controller"
require "vidibus-validate_uri"
require "spec"
require "spec/autorun"