class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contact

  def new
    @account = @contact.accounts.new
  end

  def create
    @account = @contact.accounts.create(account_params)
    if @account.valid?
      redirect_to contact_url(@contact), notice: "The account has been logged successfully"
    else
      render 'new', alert: "The account did not save correctly"
    end
  end

private

  def account_params
    params.require(:account).permit(:account_type, :account_info)
  end

  def find_contact
    @contact = Contact.find(params[:contact_id])
  end

end