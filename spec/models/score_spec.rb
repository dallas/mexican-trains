require 'spec_helper'

describe Score do
  it 'should create a new instance given valid attributes' do
    Score.create!(:round_id => 1, :player_id => 1, :score => 1)
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

# == Schema Information
#
# Table name: scores
#
#  id         :integer         not null, primary key
#  round_id   :integer
#  player_id  :integer
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

