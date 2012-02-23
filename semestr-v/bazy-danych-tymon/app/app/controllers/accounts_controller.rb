class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      redirect_to @account, :notice => "Successfully created account."
    else
      render :action => 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    Rails.logger.debug "name"
    Rails.logger.debug @account.name
    Rails.logger.debug "name_old"
    Rails.logger.debug params[:account][:name_old]

    if @account.name != params[:account][:name_old]
      @account.errors.add(:name, "Was changed")
      render :action => 'edit'
    else
      if @account.update_attributes(params[:account])
        redirect_to @account, :notice  => "Successfully updated account."
      else
        render :action => 'edit'
      end
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_url, :notice => "Successfully destroyed account."
  end
end
