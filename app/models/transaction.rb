class Transaction < ApplicationRecord
  validates :customer_id, presence: true
  validates :input_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :input_currency, presence: true
  validates :output_amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :output_currency, presence: true
  validates :transaction_date, presence: true  
  validates :status, presence: true
end
