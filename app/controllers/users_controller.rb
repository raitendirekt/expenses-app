class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_month)
  end
end
