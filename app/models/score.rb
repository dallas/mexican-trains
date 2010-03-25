class Score < ActiveRecord::Base
  belongs_to :round
  belongs_to :player

  validates_presence_of :round_id, :player_id
end
