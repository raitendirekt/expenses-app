class CategoryController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = Expense.where(user_id: current_user.id).where(date: Time.now.all_month)
    time = Time.now
    @this_month = time.month
    @month_sum = @expenses.sum(:amount)
  end

  private

  def cal_category_sum
    category_sum = 0

  end
end
