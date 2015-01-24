class ContactsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company, except: :index
  before_filter :find_contact, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_contacts = Contact.all.where(user_id:current_user.id).by_last_name
  end

  def new
    @contact = @company.contacts.new
    @accounts = @contact.accounts.new
  end

  def create
    @contact = @company.contacts.new(contact_params)
    @contact.accounts.last.user_id = current_user.id
    if @contact.save
      redirect_to company_path(@company), notice: "#{@contact.first_name} #{@contact.last_name} created."
    else
      render 'new', alert: "Contact could not be created."
    end
  end

  def show

  end

  def edit
    @contact.accounts.build
  end

  def update
    if @contact.update(contact_params)
      redirect_to company_contact_path(@company, @contact), notice: "Contact #{@contact.first_name} #{@contact.last_name} updated."
    else
      render 'edit', alert: "Failed to Update."
    end
  end

  def destroy
    @contact.destroy
    flash[:notice]="Contact #{@contact.first_name} #{@contact.last_name} deleted"
    redirect_to company_path(@company)
  end


  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :title, :email, :cell_phone, :work_phone, :company_id, :user_id, accounts_attributes: [:id, :_destroy, :description, :info, :user_id, :contact_id] )
  end

  def find_company
    @company = Company.find(params[:company_id])

  end

  def find_contact
    @contact = @company.contacts.find(params[:id])
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end


end