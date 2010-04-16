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

class Score < ActiveRecord::Base
  belongs_to :round
  belongs_to :player

  validates_presence_of :player_id
end
