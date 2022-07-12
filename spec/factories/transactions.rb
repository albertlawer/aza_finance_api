FactoryBot.define do
  factory :transaction do
    customer_id { 1 }
    input_amount { 9.99 }
    input_currency { "$" }
    output_amount { 9.99 }
    output_currency { "GHS" }
    transaction_date { "2022-07-12" }
  end
end
