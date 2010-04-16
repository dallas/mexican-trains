# == Schema Information
# Schema version: 20100325033303
#
# Table name: rounds
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  double     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Round do
  it 'should create a new instance given valid attributes' do
    Round.create!(:game_id => 1)
  end

  it 'should belong to a Game record' do
    Round.reflections.should have_key(:game)
    Round.reflections[:game].macro.should eql(:belongs_to)
  end

  it 'should require an associated Game record' do
    round = Round.create
    round.should have(1).error_on(:game_id)
  end

  it 'should have many scores' do
    Round.reflections.should have_key(:scores)
    Round.reflections[:scores].macro.should eql(:has_many)
  end
end
