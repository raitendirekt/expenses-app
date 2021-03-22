class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_month)
    @user  = User.find(params[:id])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
