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

class Round < ActiveRecord::Base
  belongs_to :game
  has_many :scores

  accepts_nested_attributes_for :scores

  def score_for(player)
    scores.find_by_player_id(player.id)
  end
end
