require 'spec_helper'

describe Game, :type => :model do
  it 'should define a new record given valid, required attributes' do
    Game.create!(
      :name => 'Mexican Trains',
      :slug => 'mexican-trains'
    )
  end
end
