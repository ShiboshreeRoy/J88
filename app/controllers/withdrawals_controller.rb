class WithdrawalsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @withdrawal = Withdrawal.new
  end
  
  def create
    if current_user.balance >= withdrawal_params[:amount].to_d
      @withdrawal = current_user.withdrawals.build(withdrawal_params)
      @withdrawal.status = 'pending'
      if @withdrawal.save
        current_user.update(balance: current_user.balance - @withdrawal.amount)
        redirect_to withdrawals_path, notice: 'Withdrawal request sent.'
      else
        render :new
      end
    else
      redirect_to withdrawals_path, alert: 'Insufficient balance.'
    end
  end
  
  def index
    @withdrawals = current_user.withdrawals
  end
  
  private
  def withdrawal_params
    params.require(:withdrawal).permit(:amount)
  end
end
