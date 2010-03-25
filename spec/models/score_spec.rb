require 'spec_helper'

describe Score do
  it 'should create a new instance given valid attributes' do
    Score.create!(:round_id => 1, :player_id => 1)
  end

  it 'should belong to a Round record' do
    Score.reflections.should have_key(:round)
    Score.reflections[:round].macro.should eql(:belongs_to)
  end

  it 'should require an associated Round record' do
    score = Score.create
    score.should have(1).error_on(:round_id)
  end

  it 'should belong to a Player record' do
    Score.reflections.should have_key(:player)
    Score.reflections[:player].macro.should eql(:belongs_to)
  end

  it 'should require an associated Player record' do
    score = Score.create
    score.should have(1).error_on(:player_id)
  end
end
