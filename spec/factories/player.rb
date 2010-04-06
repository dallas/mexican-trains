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

Factory.define :player do |p|
  p.first_name { Forgery(:name).first_name }
  p.last_name { Forgery(:name).last_name }
  p.nickname {|p| p.first_name.downcase }
  p.mo { Forgery(:lorem_ipsum).words(rand(5) + 2, :random => true) }
end
