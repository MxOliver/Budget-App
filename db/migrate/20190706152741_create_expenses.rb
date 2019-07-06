class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :planned_amount
      t.integer :actual_amount, allow_nil: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
