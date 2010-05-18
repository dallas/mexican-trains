# == Schema Information
# Schema version: 20100325033303
#
# Table name: games
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many :rounds, :order => 'double desc'
  has_many :scores, :through => :rounds

  def player_ids=(player_ids)
    player_ids.each do |player_id|
      current_round.scores.build :player_id => player_id
    end
  end

  def players
    current_round.scores.map &:player
  end

  def winner
    players.min {|a,b| a.score_for(self) <=> b.score_for(self)}
  end

  def score_for(player)
    Score.all(:joins => [{:round => :game}, :player], :conditions => {:player_id => player.id, :rounds => {:game_id => self.id}}).sum(&:score)
  end

  def new_round(double = nil)
    double ||= (rounds.last.try(:double) || 13) - 1
    return if double < 0
    rounds.build :double => double
  end

  def last_round
    rounds.last
  end

  def current_round
    @current_round ||= last_round || new_round
  end
end
