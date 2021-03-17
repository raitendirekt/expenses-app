class CategoryController < ApplicationController
  def index
    @expenses = Expense.where(user_id: current_user.id)
    time = Time.now
    @this_month = time.month
    @month_sum = @expenses.sum(:amount)
  end

  private

  def cal_category_sum
    category_sum = 0

  end
end
