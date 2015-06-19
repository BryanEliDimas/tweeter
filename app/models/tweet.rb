class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: {maximum: 142}
  validates :user_id, presence: true
end
