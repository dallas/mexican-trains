require 'spec_helper'

describe Game do
  it 'should create a new instance given valid attributes' do
    Game.create!(:name => 'Mexican Trains', :slug => 'mexican-trains')
  end

  it 'should require the name and slug attributes to be present' do
    game = Game.create
    game.should have(1).error_on(:name)
    game.should have(1).error_on(:slug)
    game = Game.create(:name => '', :slug => '')
    game.should have(1).error_on(:name)
    game.should have(1).error_on(:slug)
  end

  it 'should require the name and slug attributes to be unique' do
    Game.create!(:name => 'Mexican Trains', :slug => 'mexican-trains')
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican-trains')
    game.should have(1).error_on(:name)
    game.should have(1).error_on(:slug)
  end

  it 'should require the slug attribute to be in the specified, URL-friendly format' do
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican trains')
    game.should have(1).error_on(:slug)
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican_trains')
    game.should have(1).error_on(:slug)
  end

  it 'should have many game plays' do
    Game.reflections.should have_key(:game_plays)
    Game.reflections[:game_plays].macro.should eql(:has_many)
    Game.new.game_plays.should be_an_instance_of(Array)
  end
end
