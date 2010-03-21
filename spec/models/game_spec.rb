require 'spec_helper'

describe Game, :type => :model do
  it 'should define a new record given valid, required attributes' do
    Game.create!(:name => 'Mexican Trains', :slug => 'mexican-trains')
  end

  it 'should require the name and slug attributes' do
    game = Game.create
    game.should have(1).errors_on(:name)
    game.should have(1).errors_on(:slug)
    game = Game.create(:name => '', :slug => '')
    game.should have(1).errors_on(:name)
    game.should have(1).errors_on(:slug)
  end

  it 'should require the name and slug attributes to be unique' do
    Game.create!(:name => 'Mexican Trains', :slug => 'mexican-trains')
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican-trains')
    game.should have(1).errors_on(:name)
    game.should have(1).errors_on(:slug)
  end

  it 'should require the slug attribute to be in the specified, URL-friendly format' do
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican trains')
    game.should have(1).errors_on(:slug)
    game = Game.create(:name => 'Mexican Trains', :slug => 'mexican_trains')
    game.should have(1).errors_on(:slug)
  end
end
