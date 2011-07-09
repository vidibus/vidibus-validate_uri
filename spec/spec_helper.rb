$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "rspec"
require "ostruct"
require "vidibus-validate_uri"

RSpec.configure do |config|
  config.mock_with :rr
end

I18n.load_path += Dir[File.join('config', 'locales', '**', '*.{rb,yml}')]
