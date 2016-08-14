FactoryGirl.define do
  factory :list_subscriber do
    list_id 1
    user_id 1
  end
  factory :list_member do
    list_id 1
    user_id 1
  end
  factory :list do
    name "MyString"
    author_id 1
  end
  factory :tagged_tweet do
    tweet_id 1
    tag_id 1
  end
  factory :tag do
    tag "MyString"
  end
  factory :favorite do
    tweet_id 1
    user_id 1
  end
  factory :retweet do
    tweet_id 1
    retweeter_id 1
  end
  factory :relationship do
    follower_id 1
    followed_id 1
  end
  factory :tweet do
    user_id 1
    tweet "MyString"
  end
  factory :user do
    username "MyString"
    email "MyString"
  end
end
