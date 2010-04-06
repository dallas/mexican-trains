# == Schema Information
# Schema version: 20100321234513
#
# Table name: games
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many :game_plays

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug, :allow_blank => true
  validates_format_of :slug, :with => /^[A-Za-z0-9-]+$/, :allow_blank => true

  def name=(name)
    super
    self.slug = name.downcase.gsub(' & ', ' and ').parameterize
  end
end
