# == Schema Information
# Schema version: 20100325033303
#
# Table name: rounds
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  double     :integer
#  created_at :datetime
#  updated_at :datetime
#

Factory.define :round do |r|
  r.game { Factory(:game) }
end
