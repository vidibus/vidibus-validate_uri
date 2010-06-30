require "spec_helper"

class Model
  include ActiveModel::Validations
  attr_accessor :uri, :https_uri
  validates :uri, :uri => { :allow_blank => true }
  validates :https_uri, :uri => { :protocol => :https, :allow_blank => true }
end

describe "Vidibus::ValidateUri::UriValidator" do
  
  def instance
    @instance ||= begin
      Model.new
    end
  end
  
  it "should be available as uri validator" do
    Model.validators_on(:uri).first.should be_a_kind_of(Vidibus::ValidateUri::UriValidator)
  end
  
  it "should be available as https_uri validator" do
    Model.validators_on(:https_uri).first.should be_a_kind_of(Vidibus::ValidateUri::UriValidator)
  end
  
  it "should validate http://valid.local" do
    instance.uri = "http://valid.local"
    instance.valid?.should be_true
  end
  
  it "should add an error for http://invalid" do
    instance.uri = "http://invalid"
    instance.valid?.should be_false
  end
  
  it "should validate https://valid.local with forced https protocol" do
    instance.https_uri = "https://valid.local"
    instance.valid?.should be_true
  end
  
  it "should add an error for http://valid.local with forced https rotocol" do
    instance.https_uri = "http://valid.local"
    instance.valid?.should be_false
    instance.errors[:https_uri].should_not be_blank
  end
end
