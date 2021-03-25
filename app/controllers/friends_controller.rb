class FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = Expense.where(created_at: Time.now.all_month)
    expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_month)
    @month_sum = expenses.sum(:amount)
  end

end
