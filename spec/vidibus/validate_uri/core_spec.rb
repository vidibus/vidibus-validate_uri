require "spec_helper"

class Test
  include Vidibus::ValidateUri::Core
end

def in_test_environment(&block)
  e = ENV["RAILS_ENV"]
  ENV["RAILS_ENV"] = "test"
  yield
  ENV["RAILS_ENV"] = e
end

describe "Vidibus::ValidateUri::Core" do
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

    it "should validate rtmp://mydomain.local/video/13os/pi1x/1391/sxj9/go.flv?10|12|33 with protocol => [:rtmp, :rtsp]" do
      uri = "rtmp://mydomain.local/video/13os/pi1x/1391/sxj9/go.flv?10|12|33"
      test.valid_uri?(uri, :protocol => [:rtmp, :rtsp]).should be_true
    end

    it "should validate http://www.ali.baba.döner.de" do
      uri = "http://www.ali.baba.döner.de"
      test.valid_uri?(uri).should be_true
    end
  end

  describe "#accessible_uri?" do
    it "should validate http://www.vidibus.org" do
      uri = "http://www.vidibus.org"
      test.accessible_uri?(uri).should be_true
    end

    it "should fail for http://www.vidibus.zzz" do
      uri = "http://www.vidibus.zzz"
      test.accessible_uri?(uri).should be_false
    end

    it "should not perform accessibility check of syntactically invalid URIs" do
      uri = "http://invalid"
      dont_allow(URI).parse
      test.accessible_uri?(uri).should be_false
    end

    it "should not perform accessibility check in test environment" do
      in_test_environment do
        uri = "http://www.vidibus.zzz"
        dont_allow(URI).parse
        test.accessible_uri?(uri).should be_true
      end
    end
  end
end
