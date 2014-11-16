class ContactsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company # Company required for all contacts
  before_filter :find_contact, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_message

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
    
  end

  def update
    if @contact.update_attributes(contact_params).valid?
      redirect_to :back, notice: "#{@contact.name} updated."
    else
      render contact_path(@contact), alert: "Failed to Update."
    end
  end

  def destroy
    @contact.destroy
    flash[:notice]="Contact deleted"
    redirect_to(:action=>'index')
  end
  
  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :cell, :work_number, :company_id)
  end

  def find_company
    @company = Company.find(params[:company_id])

  end

  def find_contact
    @contact = @company.contacts.find(params[:id])
  end

  def not_found_message
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end


end