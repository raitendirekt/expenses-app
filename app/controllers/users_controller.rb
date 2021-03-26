class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_month).order('date DESC')
    @user  = User.find(params[:id])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'search'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'search'
  end

  def search
    @users = User.search(params[:keyword])
  end

end
