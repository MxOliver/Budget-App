class CreateSavings < ActiveRecord::Migration[5.2]
  def change
    create_table :savings do |t|
      t.boolean :long_term, default: false
      t.boolean :short_term, default: false
      t.references :expense, foreign_key: true

      t.timestamps
    end
  end
end
