 class Admin::DepositsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      @deposits = Deposit.where(status: 'pending')
    end
    
    def approve
      deposit = Deposit.find(params[:id])
      deposit.update(status: 'approved')
      deposit.user.update(balance: deposit.user.balance + deposit.amount)
      redirect_to admin_deposits_path, notice: 'Deposit approved.'
    end
  end