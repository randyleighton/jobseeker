class ContactsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :load_company

  def index
    @contacts = @company.contacts
  end
  
  def new
    @contact = @company.contacts.new
  end
  
  def create
    @contact = @company.contacts.create(contact_params)
    if @contact.valid?
      redirect_to company_contacts_path, notice: "#{@contact.first_name} #{@contact.last_name} created."
    else
      render 'new', alert: "Contact could not be created."
    end
  end

  def show
    @contact = @company.contacts.find(params[:id])
  end

  def update
    @contact = @company.contacts.find([:id])
    if @contact.update_attributes(contact_params).valid?
      redirect_to :back, notice: "#{@contact.name} updated."
    else
      render contact_path(@contact), alert: "Failed to Update."
    end
  end

  def destroy
    @company.contacts.find(params[:id]).destroy
    flash[:notice]="Contact deleted"
    redirect_to(:action=>'index')
  end
  
  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :cell, :work_number, :company_id)
  end

  def load_company
    @company = Company.find(params[:company_id])

  end
  
end