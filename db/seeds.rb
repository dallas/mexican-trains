unless Player.exists? :login => 'dallas'
  print 'Creating player “Dallas Reedy”…'; STDOUT.flush
  Player.create(
    :name                   => 'Dallas Reedy',
    :login                  => 'dallas',
    :password               => (pw = 'sekret'),
    :password_confirmation  => pw
  )
  puts 'done.'
end

unless Player.exists? :login => 'nicole'
  print 'Creating player “Nicole Reedy”…'; STDOUT.flush
  Player.create(
    :name                   => 'Nicole Reedy',
    :login                  => 'nicole',
    :password               => (pw = 'sekret'),
    :password_confirmation  => pw
  )
  puts 'done.'
end
