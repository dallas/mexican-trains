# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

unless Game.exists? :name => 'Mexican Trains'
  print 'Creating game “Mexican Trains”…'; STDOUT.flush
  Game.create :name => 'Mexican Trains'
  puts 'done.'
end

unless Player.exists? :login => 'dallas'
  print 'Creating player “Dallas Reedy”…'; STDOUT.flush
  Player.create(
    :name => 'Dallas Reedy',
    :login => 'dallas',
    # :email => '',
    :password => (pw = 'sekret'),
    :password_confirmation => pw
  )
  puts 'done.'
end

unless Player.exists? :login => 'nicole'
  print 'Creating player “Nicole Reedy”…'; STDOUT.flush
  Player.create(
    :name => 'Nicole Reedy',
    :login => 'nicole',
    # :email => '',
    :password => (pw = 'sekret'),
    :password_confirmation => pw
  )
  puts 'done.'
end