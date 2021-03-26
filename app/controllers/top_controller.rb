class TopController < ApplicationController

  def index
    if user_signed_in?
      time = Time.now
      @expenses = Expense.where(user_id: current_user.id).where(date: Time.now.all_month).order('date DESC')
      @this_month = time.month
      @month_sum = @expenses.sum(:amount)
    end
  end

end
