require 'spec_helper'

describe GamePlay do
  it 'should create a new instance given valid attributes' do
    GamePlay.create!(:game_id => 1)
  end

  it 'should belong to a Game' do
    GamePlay.reflections.should have_key(:game)
    GamePlay.reflections[:game].macro.should eql(:belongs_to)
  end

  it 'should require an associated Game record' do
    game_play = GamePlay.create
    game_play.should have(1).error_on(:game_id)
  end

  it 'should have many rounds' do
    GamePlay.reflections.should have_key(:rounds)
    GamePlay.reflections[:rounds].macro.should eql(:has_many)
  end
end
