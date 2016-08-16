class Tweet < ApplicationRecord
  default_scope { includes(:user) }
  belongs_to :user
  has_many :tagged_tweets
  has_many :tags, through: :tagged_tweets
end
