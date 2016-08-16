class Tag < ApplicationRecord
  has_many :tagged_tweets
  has_many :tweets, through: :tagged_tweets
end
