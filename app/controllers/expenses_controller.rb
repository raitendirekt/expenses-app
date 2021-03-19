class ExpensesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    #query = "SELECT * FROM expenses"
    #@expenses = Expense.find_by_sql(query)
    #@month_sum = Expense.all.sum(:amount)
  end

  def new
    @expense = Expense.new
    require "date"
    @now = Date.today
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
    if expense.save
			redirect_to "/users/#{current_user.id}"
		else
			render "edit"
		end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private

  def expense_params
    params.require(:expense).permit(:category_id, :memo, :amount, :date).merge(
      user_id: current_user.id
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
