FactoryGirl.define do
  factory :tweet do
    user_id 1
    tweet "MyString"
  end
  factory :user do
    username "MyString"
    email "MyString"
  end
end
