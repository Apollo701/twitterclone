FactoryGirl.define do
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
