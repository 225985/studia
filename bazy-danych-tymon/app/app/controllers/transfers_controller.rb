class TransfersController < ApplicationController
  def new
  end

  def create
    @from = Account.find(params[:from])
    @to = Account.find(params[:to])
    amount = params[:amount].to_i

    res = Account.transaction do
      @to.update_attributes(:balance => @to.balance+amount)

      if @from.balance >= amount
        @from.update_attributes(:balance => @from.balance-amount)
      else
        raise ActiveRecord::Rollback
      end
    end

    if res
      redirect_to accounts_path, :notice => "Transfer succeed."
    else
      redirect_to new_transfer_path, :alert => "Transfer impossible"
    end
  end
end
