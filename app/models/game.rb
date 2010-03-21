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
end
