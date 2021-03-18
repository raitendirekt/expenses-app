class MonthController < ApplicationController
  before_action :set_months, only: :index
  def index
    @expenses = Expense.where(user_id: current_user.id).where(created_at: Time.now.all_year)
    time = Time.now
    @this_year = time.year
    @year_sum = @expenses.sum(:amount)
  end

  private

  def set_months
    require 'date'
    @day = Date.today
    @months = []
    12.times do |m|
      if @day.month + m <= 12
        @months << @day.month + m
      else
        @months << @day.month + m - 12
      end
    end
  end

end
