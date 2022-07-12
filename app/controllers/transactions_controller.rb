class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show]

  def index
    @transactions = Transaction.all
    render json: serializer.new(@transactions)
  end
  
  def show
    render json: serializer.new(@transaction)
  end
  
  
  def serializer
    TransactionSerializer
  end
  
  protected
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
