# Table name: game_plays
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

Factory.define :game_play do |gp|
  gp.game { Factory(:game) }
end
