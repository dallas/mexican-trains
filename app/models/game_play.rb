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

  after_initialize :new_round

  def players
    rounds.first.scores.map(&:player)
  end

  def player_ids=(ids)
    round = new_round
    Player.find(ids).each do |player|
      round.scores.build(:player => player)
    end
  end

  def new_round
    rounds.build
  end
end
