class AddIncomeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_income, :integer
    add_index :users, :total_income
  end
end
