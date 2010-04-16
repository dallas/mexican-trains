# == Schema Information
# Schema version: 20100325033303
#
# Table name: games
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Game do
  it 'should create a new instance given valid attributes' do
    Game.create!
  end

  it 'should have many rounds' do
    Game.reflections.should have_key(:rounds)
    Game.reflections[:rounds].macro.should eql(:has_many)
  end
end
