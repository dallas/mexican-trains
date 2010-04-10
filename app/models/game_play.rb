# == Schema Information
# Schema version: 20100321234513
#
# Table name: game_plays
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class GamePlay < ActiveRecord::Base
  belongs_to :game
  has_many :rounds

  validates_presence_of :game_id

  def player_ids=(ids)
    ids.reject(&:blank?).each do |id|
      current_round.scores.build :player => Player.find(id)
    end
  end

  def players
    current_round.scores.map &:player
  end

  def new_round
    rounds.build
  end

  def current_round
    @current_round ||= rounds.last || new_round
  end
end
