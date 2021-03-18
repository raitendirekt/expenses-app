class ExpensesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    #query = "SELECT * FROM expenses"
    #@expenses = Expense.find_by_sql(query)
    #@month_sum = Expense.all.sum(:amount)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:category_id, :memo, :amount).merge(
      user_id: current_user.id
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
