class TopController < ApplicationController

  def index
    if user_signed_in?
      @expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_month)
      time = Time.now
      @this_month = time.month
      @month_sum = @expenses.sum(:amount)
    end
  end

end