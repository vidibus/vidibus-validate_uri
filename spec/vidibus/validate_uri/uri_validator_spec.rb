require 'spec_helper'

class Model
  include ActiveModel::Validations
  attr_accessor :uri
  validates :uri, :uri => true
end

class SecureModel < Model
  validates :uri, :uri => {:protocol => 'https'}
end

class AccessibleModel < Model
  validates :uri, :uri => {:accessible => true}
end

describe 'Vidibus::ValidateUri::UriValidator' do
  let(:model) {Model.new}
  let(:secure_model) {SecureModel.new}
  let(:accessible_model) {AccessibleModel.new}

  it 'should be available as URI validator' do
    Model.validators_on(:uri).first.should be_a_kind_of(Vidibus::ValidateUri::UriValidator)
  end

  it 'should add an error to model if URI is blank' do
    model.uri = nil
    model.should be_invalid
    model.errors[:uri].should eql(['is invalid'])
  end

  it 'should add an error to model if URI is invalid' do
    model.uri = 'http://localhosts'
    model.should be_invalid
    model.errors[:uri].should eql(['is invalid'])
  end

  it 'should add no error to model if URI is valid' do
    model.uri = 'http://vidibus.org'
    model.should be_valid
  end

  it 'should add an error if uri does not match provided protocols' do
    secure_model.uri = 'http://www.vidibus.org'
    secure_model.should be_invalid
    secure_model.errors[:uri].should have(1).error
  end

  it 'should add an error to model if URI is inaccessible' do
    accessible_model.uri = 'http://vidibus.zzz'
    stub.any_instance_of(Net::HTTP).head {raise SocketError}
    accessible_model.should be_invalid
    accessible_model.errors[:uri].should eql(['is inaccessible'])
  end
end
