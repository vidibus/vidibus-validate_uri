require "spec_helper"

class Controller < ActionController::Base; end

describe "ActionController::Base" do
  it "should respond to #valid_uri?" do
    Controller.new.should respond_to(:valid_uri?)
  end
end