class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contact

  def new
    @account = @contact.accounts.new
  end

  def create
    @account = @contact.accounts.create(account_params)
    if @account.valid?
      redirect_to contact_url(@contact), notice: "Created #{@account.description} account: #{@account.info}"
    else
      render 'new', alert: "The account did not save correctly"
    end
  end

  def edit
    @account = @contact.accounts.find(params[:id])
  end

  def update
    @account = @contact.accounts.find(params[:id])
    if @account.update(account_params)
      redirect_to @contact, notice:"Updated #{@account.description} account: #{@account.info}"
    else
      render 'edit', notice: "Failed to Create"
    end
  end

  def destroy
    @account = @contact.accounts.find(params[:id])
    @account.destroy
    flash[:notice]="Account removed"
  end

private

  def account_params
    params.require(:account).permit(:description, :info, :user_id, :contact_id)
  end

  def find_contact
    @contact = Contact.find(params[:contact_id])
  end

end