class ContactsController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
  
  def index
   @contacts = Contact.all
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.create(contact_params)
    if @contact.valid
      flash[:notice] = "Your contact has been saved"
      redirect_to :back
    else
      flash[:alert] = "Your contact failed to save"
      render 'new'
    end
  end
  
  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :cell, :work_number, :company_id)
  end
  
end