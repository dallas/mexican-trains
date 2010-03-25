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
end
