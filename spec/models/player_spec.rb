require 'spec_helper'

describe Player do
  before(:each) do
    @valid_attributes = {
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :nickname => "value for nickname",
      :mo => "value for mo"
    }
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end
end
