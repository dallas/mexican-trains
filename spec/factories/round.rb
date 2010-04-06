# Table name: rounds
#
#  id           :integer         not null, primary key
#  game_play_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

Factory.define :round do |r|
  r.game_play { Factory(:game_play) }
end
