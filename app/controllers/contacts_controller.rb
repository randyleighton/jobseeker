class ContactsController < ApplicationController
	before_filter :authenticate_user!

  def index
   @contacts = Contact.all
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to :back, notice: "#{@contact.first_name} #{@contact.last_name} created."
    else
      render 'new', alert: "Contact could not be created."
    end
  end

  def show
    @contact = @contact.find(params[:id])
  end

    def destroy
    @contact = Company.find(params[:id])
    @contact.destroy
  end
  
  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :cell, :work_number, :company_id)
  end
  
end