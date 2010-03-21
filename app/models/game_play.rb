# == Schema Information
# Schema version: 20100321234513
#
# Table name: game_plays
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class GamePlay < ActiveRecord::Base
  belongs_to :game
end
