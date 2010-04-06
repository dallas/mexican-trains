# Table name: games
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

Factory.define :game do |g|
  g.name { Forgery(:game).name }
end
