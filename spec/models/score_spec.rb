require 'spec_helper'

describe Score do
  before(:each) do
    @valid_attributes = {
      :round_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Score.create!(@valid_attributes)
  end
end
