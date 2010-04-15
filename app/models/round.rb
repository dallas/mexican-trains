# == Schema Information
#
# Table name: rounds
#
#  id           :integer         not null, primary key
#  game_play_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  double       :integer
#

class Round < ActiveRecord::Base
  belongs_to :game_play
  has_many :scores
  has_many :players, :through => :scores

  accepts_nested_attributes_for :scores, :reject_if => proc{|a| a.all? {|_,v| v.blank? } }

  # validates_presence_of :game_play_id
end
