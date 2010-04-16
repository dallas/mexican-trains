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
  has_many :players, :through => :scores

  accepts_nested_attributes_for :scores, :reject_if => proc{|a| a.all? {|_,v| v.blank? } }
end
