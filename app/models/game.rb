# == Schema Information
# Schema version: 20100318035409
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
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug, :allow_blank => true
  validates_format_of :slug, :with => /^[A-Za-z0-9-]+$/, :allow_blank => true
end
