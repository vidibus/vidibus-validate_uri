require "spec_helper"

class Model
  include ActiveModel::Validations
  attr_accessor :uri, :https_uri
  validates :uri, :uri => true
  validates :https_uri, :uri => { :protocol => "https", :allow_blank => true }
end

describe "Vidibus::ValidateUri::UriValidator" do
  let(:model) { Model.new }
  
  it "should be available as URI validator" do
    Model.validators_on(:uri).first.should be_a_kind_of(Vidibus::ValidateUri::UriValidator)
  end
  
  it "should add an error to model if URI is blank" do
    model.uri = nil
    model.should be_invalid
    model.errors[:uri].should eql(["is not a valid uri"])
  end
  
  it "should add an error to model if URI is invalid" do
    model.uri = "http://localhosts"
    model.should be_invalid
    model.errors[:uri].should eql(["is not a valid uri"])
  end
  
  it "should allow options" do
    model.https_uri = "http://www.vidibus.org"
    model.should be_invalid
    model.errors[:https_uri].should have(1).error
  end
end
