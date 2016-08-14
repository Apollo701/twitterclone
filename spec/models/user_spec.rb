require 'rails_helper'

describe User do
  let(:user)     { FactoryGirl.create( :user, id: 1, email: 'user@example.com', username: 'user') }
  let(:follower) { FactoryGirl.create( :user, id: 2, email: 'apollo701@gmail.com', username: 'apollo') }
  let(:followed) { FactoryGirl.create( :user, id: 3, email: 'juan@juan.com', username: 'juan') }

  describe '#associations' do
    it 'user has many followers' do
      expect(user).to have_many :followers
      expect(user).to have_many :following
    end
  end

  describe '#relationships' do
    context 'from followers perspective' do
      it 'has active relationships' do
        relationship = FactoryGirl.create( :relationship, id: 1, follower_id: 2, followed_id: 3)
        reload_followies
        expect(follower.following.first).to eq followed
      end

      it 'has passive relationships' do
        relationship = FactoryGirl.create( :relationship, id: 1, follower_id: 2, followed_id: 3)
        reload_followies
        expect(follower.followers).to be_empty
      end
    end

    context 'from the followed perspective' do
      it 'has active relationships' do
        relationship = FactoryGirl.create( :relationship, id: 1, follower_id: 2, followed_id: 3)
        reload_followies
        expect(followed.following).to be_empty
      end

      it 'has active relationships' do
        relationship = FactoryGirl.create( :relationship, id: 1, follower_id: 2, followed_id: 3)
        reload_followies
        expect(followed.followers.first).to eq follower
      end
    end

  end

  def reload_followies
    follower.reload
    followed.reload
  end
end
