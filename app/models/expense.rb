class Expense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :amount, presence: true
  validates :category_id, numericality: { other_than: 1 }

  #def self.get_expense_details(current_user_id)
   # Expense.find(current_user_id)
  #end
end
