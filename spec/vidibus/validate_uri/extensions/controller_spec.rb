require "spec_helper"

class Controller < ActionController::Base; end

describe "Vidibus::ValidateUri::Extensions::Controller" do
  
  def controller
    @controller ||= begin
      Controller.new
    end
  end
    
  describe "#validate_uri" do
    it "should validate http://mydomain.local" do
      uri = "http://mydomain.local"
      controller.validate_uri(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params" do
      uri = "http://mydomain.local?some=params"
      controller.validate_uri(uri).should be_true
    end
    
    it "should validate http://mydomain.local/?some=params" do
      uri = "http://mydomain.local/?some=params"
      controller.validate_uri(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params&another=one" do
      uri = "http://mydomain.local?some=params&another=one"
      controller.validate_uri(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params&another=one#withFragment" do
      uri = "http://mydomain.local?some=params&another=one#withFragment"
      controller.validate_uri(uri).should be_true
    end
    
    it "should validate https://mydomain.local" do
      uri = "https://mydomain.local"
      controller.validate_uri(uri).should be_true
    end
    
    it "should not validate https://mydomain.local with protocol => :https" do
      uri = "https://mydomain.local"
      controller.validate_uri(uri, :protocol => :https).should be_true
    end
    
    it "should not validate https://mydomain.local with protocol => :http" do
      uri = "https://mydomain.local"
      controller.validate_uri(uri, :protocol => :http).should be_false
    end
    
    it "should not validate https://mydomain.local with protocol => [:http, :rtmp]" do
      uri = "https://mydomain.local"
      controller.validate_uri(uri, :protocol => [:http, :rtmp]).should be_false
    end
  end
end
