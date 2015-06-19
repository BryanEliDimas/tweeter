class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: {maximum: 142}
end
