require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "#validations" do
    let(:transaction){build(:transaction)}
    
    it "should test factory" do
      transaction = build :transaction
      expect(transaction).to be_valid
    end
    
    it "should validate attributes" do
      a_transaction = Transaction.new
      expect(a_transaction).not_to be_valid
    end
    
    it "should validate amounts" do
      expect(transaction.input_amount).to be > 0.0
      expect(transaction.output_amount).to be > 0.0
    end
  end
end
