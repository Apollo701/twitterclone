class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @tweet = Tweet.new
  end

  def edit
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def current_user
      User.find(params[:id])
    end
end
