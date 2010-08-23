require "spec_helper"

class Test
  include Vidibus::ValidateUri::InstanceMethods
end

describe "Vidibus::ValidateUri::InstanceMethods" do
  let(:test) { Test.new }

  describe "#valid_uri?" do
    it "should validate http://mydomain.local" do
      uri = "http://mydomain.local"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/" do
      uri = "http://mydomain.local/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.com" do
      uri = "http://mydomain.com"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://www.mydomain.com" do
      uri = "http://www.mydomain.com"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.com:8080" do
      uri = "http://mydomain.com:8080"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/" do
      uri = "http://mydomain.local/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://localhost" do
      uri = "http://localhost"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://localhost/" do
      uri = "http://localhost/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should fail for http://localhosts" do
      uri = "http://localhosts"
      test.valid_uri?(uri).should be_false
    end
    
    it "should validate http://localhost:3000" do
      uri = "http://localhost:3000"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://localhost:3000/" do
      uri = "http://localhost:3000/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://84.191.143.127" do
      uri = "http://84.191.199.127"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://84.191.143.127/" do
      uri = "http://84.191.199.127/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://84.191.143.127:80" do
      uri = "http://84.191.199.127:80"
      test.valid_uri?(uri).should be_true
    end
    
    it "should fail for http://84.2a.143.127" do
      uri = "http://84.2a.143.127"
      test.valid_uri?(uri).should be_false
    end
    
    it "should validate https://some.weird.sub.1.mydomain.com:10000" do
      uri = "https://some.weird.sub.1.mydomain.com:10000"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params" do
      uri = "http://mydomain.local?some=params"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/?some=params" do
      uri = "http://mydomain.local/?some=params"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/hello/world" do
      uri = "http://mydomain.local/hello/world"
      test.valid_uri?(uri).should be_true
    end
    
    it "should fail for http://mydomain.local/hel lo/world" do
      uri = "http://mydomain.local/hel lo/world"
      test.valid_uri?(uri).should be_false
    end
    
    it "should validate http://mydomain.local/hello/world/" do
      uri = "http://mydomain.local/hello/world/"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/hello/world.html" do
      uri = "http://mydomain.local/hello/world.html"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/hello/world.html#doit" do
      uri = "http://mydomain.local/hello/world.html#doit"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/hello/world?some=params" do
      uri = "http://mydomain.local/hello/world?some=params"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local/hello/world/?some=params" do
      uri = "http://mydomain.local/hello/world/?some=params"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params&another=one" do
      uri = "http://mydomain.local?some=params&another=one"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate http://mydomain.local?some=params&another=one#withFragment" do
      uri = "http://mydomain.local?some=params&another=one#withFragment"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate https://mydomain.local" do
      uri = "https://mydomain.local"
      test.valid_uri?(uri).should be_true
    end
    
    it "should validate https://mydomain.local with protocol => :https" do
      uri = "https://mydomain.local"
      test.valid_uri?(uri, :protocol => :https).should be_true
    end
    
    it "should validate https://mydomain.local with protocol => [:http, :https]" do
      uri = "https://mydomain.local"
      test.valid_uri?(uri, :protocol => [:http, :https]).should be_true
    end
    
    it "should fail for https://mydomain.local with protocol => :http" do
      uri = "https://mydomain.local"
      test.valid_uri?(uri, :protocol => :http).should be_false
    end
    
    it "should fail for https://mydomain.local with protocol => [:http, :rtmp]" do
      uri = "https://mydomain.local"
      test.valid_uri?(uri, :protocol => [:http, :rtmp]).should be_false
    end
    
    describe "with accessibility check" do
      it "should validate http://www.vidibus.org" do
        uri = "http://www.vidibus.org"
        test.valid_uri?(uri, :accessible => true).should be_true
      end
      
      it "should fail for http://www.vidibus.zzz" do
        uri = "http://www.vidibus.zzz"
        test.valid_uri?(uri, :accessible => true).should be_false
      end
      
      it "should not perform accessibility check of syntactically invalud urls" do
        uri = "http://invalid"
        dont_allow(test).accessible_uri?
        test.valid_uri?(uri, :accessible => true).should be_false
      end
      
      it "should not perform accessibility check in test environment" do
        ENV["RAILS_ENV"] = "test"
        uri = "http://www.vidibus.zzz"
        dont_allow(test).accessible_uri?
        test.valid_uri?(uri, :accessible => true).should be_true
      end
      
      it "should perform accessibility check in test environment if test option is given" do
        ENV["RAILS_ENV"] = "test"
        uri = "http://www.vidibus.zzz"
        mock(test).accessible_uri?("http://www.vidibus.zzz") { false }
        test.valid_uri?(uri, :accessible => true, :test => true).should be_false
      end
    end
  end
end