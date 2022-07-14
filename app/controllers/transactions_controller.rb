class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update ]

  def index
    @transactions = Transaction.all
    render json: serializer.new(@transactions)
  end
  
  def show
    render json: serializer.new(@transaction)
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: serializer.new(@transaction), status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @transaction.update(transaction_params)
      render json: serializer.new(@transaction), status: :ok, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end
  
  
  protected
  def serializer
    TransactionSerializer
  end
  
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
  
  def transaction_params
    params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency, :transaction_date, :status)
  end
end
