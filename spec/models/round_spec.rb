require 'spec_helper'

describe Round do
  before(:each) do
    @valid_attributes = {
      :game_play_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Round.create!(@valid_attributes)
  end
end
