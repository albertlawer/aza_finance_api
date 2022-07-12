class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.decimal :input_amount, precision: 12, scale: 2
      t.string :input_currency
      t.decimal :output_amount, precision: 12, scale: 2
      t.string :output_currency
      t.date :transaction_date

      t.timestamps
    end
  end
end
