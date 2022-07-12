class Transaction < ApplicationRecord
  validates :customer_id, presence: true
  validates :input_amount, presence: true
  validates :input_currency, presence: true
  validates :output_amount, presence: true
  validates :output_currency, presence: true
  validates :transaction_date, presence: true  
end
