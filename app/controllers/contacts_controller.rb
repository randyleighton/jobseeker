class ContactsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @contacts = Contact.all
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.create(contact_params)
    if @contact.valid?
      redirect_to :back, notice: "#{@contact.first_name} #{@contact.last_name} created."
    else
      render 'new', alert: "Contact could not be created."
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update

  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:notice]="Contact deleted"
    redirect_to(:action=>'index')
  end
  
  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :cell, :work_number, :company_id)
  end
  
end