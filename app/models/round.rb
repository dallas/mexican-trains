class Round < ActiveRecord::Base
  belongs_to :game_play
  has_many :scores

  validates_presence_of :game_play_id
end
