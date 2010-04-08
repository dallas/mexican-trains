require 'spec_helper'

describe Round do
  it 'should create a new instance given valid attributes' do
    Round.create!(:game_play_id => 1)
  end

  it 'should belong to a GamePlay record' do
    Round.reflections.should have_key(:game_play)
    Round.reflections[:game_play].macro.should eql(:belongs_to)
  end

  it 'should require an associated GamePlay record' do
    round = Round.create
    round.should have(1).error_on(:game_play_id)
  end

  it 'should have many scores' do
    Round.reflections.should have_key(:scores)
    Round.reflections[:scores].macro.should eql(:has_many)
  end
end

# == Schema Information
#
# Table name: rounds
#
#  id           :integer         not null, primary key
#  game_play_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

