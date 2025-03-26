class DepositsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = current_user.deposits.build(deposit_params) # Fixed method call
    @deposit.status = 'pending'

    if @deposit.save
      redirect_to deposits_path, notice: 'Deposit request sent for approval.'
    else
      render :new
    end
  end

  def index
    @deposits = current_user.deposits # Fetch only the current user's deposits
  end

  private

  def deposit_params
    params.require(:deposit).permit(:amount, :transaction_code, :image)
  end
end
