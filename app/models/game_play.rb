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
  has_many :rounds, :order => 'double desc'

  validates_presence_of :game_id

  def player_ids=(ids)
    ids.reject(&:blank?).each do |id|
      current_round.scores.build :player => Player.find(id)
    end
  end

  def players
    current_round.scores.map &:player
  end

  def next_round(*players)
    return if ended?
    rounds.build(
      :double => (rounds.last.try(:double) || 13) - 1,
      :scores_attributes => players.compact.map {|p| [{:player => p}] }
    )
  end

  def next_round!(*players)
    return if ended?
    next_round(*players).save
  end

  def current_round
    @current_round ||= rounds.last
  end

  def build_all_rounds
    players = self.players
    13.times do |n|
      attrs = {:double => 12 - n}
      rounds.build(attrs) unless rounds.exists?(attrs)
      players.each do |player|
        rounds.each do |round|
          round.scores.build(:score => 0, :player => player) unless round.scores.exists?(:player_id => player.id)
        end
      end
    end
  end

  def ended?
    rounds.last.try(:double) == 0
  end
end
