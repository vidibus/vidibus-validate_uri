require "spec_helper"
require "action_controller"

class Controller < ActionController::Base; end

describe "ActionController::Base" do
  it "should respond to #valid_uri?" do
    Controller.new.should respond_to(:valid_uri?)
  end

  it "should respond to #accessible_uri?" do
    Controller.new.should respond_to(:accessible_uri?)
  end
end
