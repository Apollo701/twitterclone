class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to @tweet.user
    else
      render 'new'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id)
  end
end
