require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  
  let(:the_params){
      {customer_id: 3, input_amount: 250, output_amount: 600, input_currency: "$", output_currency: "GHS", transaction_date: DateTime.now, status: "1" }
    }
    
  let(:the_wrong_params){
      {input_amount: -250, output_amount: 600, input_currency: "$", output_currency: "GHS", transaction_date: DateTime.now }      
    }

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
                                            transaction_date: transaction.transaction_date.strftime("%F"),
                                            status: transaction.status
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
                                            transaction_date: transaction.transaction_date.strftime("%F"),
                                            status: transaction.status
                                            )
    end
  end
  
  describe ".create" do
    
    
    context "creating with valid attributes" do
      it "creates a new transaction" do
        expect { post "/transactions", params: the_params, as: :json }.to change(Transaction, :count).by(1)
      end
      
      it "renders a json response with the new data" do
        post "/transactions", params: the_params, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
    
    context "creating without valid attributes" do
      it "does not create a new transaction" do
        expect { post "/transactions", params: the_wrong_params, as: :json }.to change(Transaction, :count).by(0)
      end
      
      it "renders a JSON response with errors for the new transaction" do
        post "/transactions", params: the_wrong_params, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end    
  end
  
  
  describe ".update" do
    
    let(:transaction){create(:transaction)}
    
    context "updating with valid params" do
      it "uupdates a record" do
        put "/transactions/#{transaction.id}", params: the_params, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
    
    context "updating with invalid params" do
      it "does not update a record" do
        put "/transactions/#{transaction.id}", params: the_wrong_params, as: :json 
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
