# == Schema Information
# Schema version: 20100325033303
#
# Table name: rounds
#
#  id           :integer         not null, primary key
#  game_play_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Round < ActiveRecord::Base
  belongs_to :game_play
  has_many :scores

  validates_presence_of :game_play_id
end
