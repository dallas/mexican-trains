# == Schema Information
# Schema version: 20100325033303
#
# Table name: scores
#
#  id         :integer         not null, primary key
#  round_id   :integer
#  player_id  :integer
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

Factory.define :score do |s|
  s.round { Factory(:round) }
  s.player { Factory(:player) }
  s.score { rand(1001) }
end
