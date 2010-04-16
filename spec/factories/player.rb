# == Schema Information
# Schema version: 20100325033303
#
# Table name: players
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)     not null
#  last_name          :string(255)     not null
#  mo                 :string(255)
#  login              :string(255)     not null
#  email              :string(255)
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  perishable_token   :string(255)     not null
#  login_count        :integer         default(0)
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

Factory.define :player do |p|
  p.first_name { Forgery(:name).first_name }
  p.last_name { Forgery(:name).last_name }
  p.nickname {|p| p.first_name.downcase }
  p.mo { Forgery(:lorem_ipsum).words(rand(5) + 2, :random => true) }
end
