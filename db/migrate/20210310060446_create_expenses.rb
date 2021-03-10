class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer        :category_id     , null: false
      t.text           :memo            , null: false
      t.integer        :amount          , null: false
      t.references     :user            , foreign_key: true
      t.timestamps
    end
  end
end
