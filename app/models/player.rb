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
