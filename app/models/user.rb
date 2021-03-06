# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_digest :string
#  boss            :boolean
#

class User < ActiveRecord::Base
  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:name, :presence => true)
  validates(:email, :presence => true,
    :format => { :with =>  VALID_EMAIL_REGEX },
    :uniqueness => {:case_sensitive => false} )

  has_secure_password
  validates(:password, :length => {:minimum => 6}, :allow_blank => true)

  has_many :orders

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, :cost => cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

end
