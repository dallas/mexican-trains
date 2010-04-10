# == Schema Information
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

class Player < ActiveRecord::Base
  acts_as_authentic do |config|
    config.validate_email_field false
    config.merge_validates_format_of_login_field_options({
      :with => /^[a-z-]+$/,
      :message => 'should use only letters and “-”'
    })
  end

  has_many :scores
  has_many :rounds, :through => :scores

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end

  def name=(names)
    self.first_name, self.last_name = names.split(' ', 2)
  end

  def game_plays
    rounds.map(&:game_play).uniq
  end
end
