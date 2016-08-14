class List < ApplicationRecord
  has_many :list_members
  has_many :members, through: :list_members, source: :user

  has_many :list_subscribers
  has_many :subscribers, through: :list_subscribers, source: :user

  belongs_to :user
end
