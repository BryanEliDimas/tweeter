class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, length: { minimum: 3 }

  has_secure_password
  acts_as_follower
  acts_as_followable
end
