class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
  acts_as_follower
  acts_as_followable
end
