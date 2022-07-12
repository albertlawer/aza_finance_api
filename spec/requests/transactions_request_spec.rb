require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe ".index" do
    
    let(:transaction){build(:transaction)}
    
    it "returns a success response" do
      get '/transactions'
      expect(response).to have_http_status(:ok)
    end
    
    it "returns a vaild JSON" do
      transaction = create(:transaction)
      get '/transactions'
      body = JSON.parse(response.body).deep_symbolize_keys
      thedata = body[:data]
      expect(thedata.length).to eq 1
      the_response = thedata.first
      expect(the_response[:type]).to eq "transaction"
      expect(the_response[:id]).to eq transaction.id.to_s
      expect(the_response[:attributes]).to eq(
                                            customer_id: transaction.customer_id,
                                            input_amount: transaction.input_amount.to_s,
                                            input_currency: transaction.input_currency,
                                            output_amount: transaction.output_amount.to_s,
                                            output_currency: transaction.output_currency,
                                            transaction_date: transaction.transaction_date.strftime("%F")
                                            )
    end
  end
  
  describe ".show" do
    let(:transaction){create(:transaction)}
    
    it "returns a success response" do
      get "/transactions/#{transaction.id}"
      expect(response).to have_http_status(:ok)
    end
    
    it "returns a valid json" do
      get "/transactions/#{transaction.id}"
      body = JSON.parse(response.body).deep_symbolize_keys
      the_response = body[:data]
      expect(the_response[:type]).to eq "transaction"
      expect(the_response[:id]).to eq transaction.id.to_s
      expect(the_response[:attributes]).to eq(
                                            customer_id: transaction.customer_id,
                                            input_amount: transaction.input_amount.to_s,
                                            input_currency: transaction.input_currency,
                                            output_amount: transaction.output_amount.to_s,
                                            output_currency: transaction.output_currency,
                                            transaction_date: transaction.transaction_date.strftime("%F")
                                            )
    end
  end
  
  
end
