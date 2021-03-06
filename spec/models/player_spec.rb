# == Schema Information
# Schema version: 20100325033303
#
# Table name: players
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)     not null
#  last_name          :string(255)     not null
#  mo                 :string(255)
#  login              :string(255)     not null
#  email              :string(255)
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  perishable_token   :string(255)     not null
#  login_count        :integer         default(0)
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Player do
  it 'should create a new instance given valid attributes' do
    Player.create!(
      :first_name             => 'Dallas',
      :last_name              => 'Reedy',
      :login                  => 'dallas',
      :password               => 'sekret',
      :password_confirmation  => 'sekret'
    )
  end

  it 'should have many scores' do
    Player.reflections.should have_key(:scores)
    Player.reflections[:scores].macro.should eql(:has_many)
  end

  it 'should have many rounds through scores' do
    Player.reflections.should have_key(:rounds)
    Player.reflections[:rounds].macro.should eql(:has_many)
  end

  it 'should require the first_name, last_name, login, password and password_confirmation attributes to be present' do
    player = Player.create
    player.should have(1).error_on(:first_name)
    player.should have(1).error_on(:last_name)
    player.should have(2).errors_on(:login)
    player.should have(1).error_on(:password)
    player.should have(1).error_on(:password_confirmation)
    player.should have(0).errors_on(:mo)
  end

  it 'should require the login attribute to be in the specified, URL-friendly format' do
    player = Player.create(
      :first_name => 'Dallas',
      :last_name  => 'Reedy',
      :login      => 'dallas reedy'
    )
    player.should have(1).error_on(:login)
  end
end

describe Player, '#name' do
  it 'should be made up of the first_name and last_name attributes' do
    player = Player.create(:first_name => 'Dallas', :last_name => 'Reedy')
    player.name.should eql('Dallas Reedy')
  end
end

describe Player, '#name=' do
  it 'should set the first_name and last_name attributes from one string' do
    player = Player.create(:name => 'Dallas Reedy')
    player.first_name.should eql('Dallas')
    player.last_name.should eql('Reedy')
  end

  it 'should create exactly two names: the first_name and last_name' do
    player = Player.create(:name => 'Dallas Adam Reedy')
    player.first_name.should eql('Dallas')
    player.last_name.should eql('Adam Reedy')
  end
end
