# == Schema Information
# Schema version: 20100325033303
#
# Table name: players
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  nickname   :string(255)
#  mo         :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  has_many :rounds
  has_many :game_plays

  validates_presence_of :first_name, :last_name, :nickname
  validates_format_of :nickname, :with => /^[a-z-]+$/, :allow_blank => true
  validates_uniqueness_of :nickname

  def name
    "#{first_name} #{last_name}"
  end

  def name=(names)
    self.first_name, self.last_name = names.split(' ', 2)
  end
end
