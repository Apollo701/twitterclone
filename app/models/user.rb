class User < ApplicationRecord
  has_many :tweets
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :other_tweets,         class_name:  "Retweet",
                                  foreign_key: "retweeter_id",
                                  dependent:   :destroy
  has_many :retweets, through: :other_tweets, source: :tweet

  has_many :favorite_tweets,      class_name:  "Favorite",
                                  foreign_key: "user_id",
                                  dependent:   :destroy
  has_many :favorites, through: :favorite_tweets, source: :tweet
end
