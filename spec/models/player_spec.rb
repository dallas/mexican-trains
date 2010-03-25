require 'spec_helper'

describe Player do
  it 'should create a new instance given valid attributes' do
    Player.create!(
      :first_name => 'Dallas',
      :last_name  => 'Reedy',
      :nickname   => 'dallas',
      :mo         => 'Tile hog!'
    )
  end
end
