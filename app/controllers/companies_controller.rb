class CompaniesController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def index
		@companies = Company.where(user_id:current_user.id).by_name
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.create(company_params)
		if @company.valid?
      redirect_to companies_path, notice: "Company: #{@company.name} created."
	  else
	   	render 'new', alert: "Company could not be created."
	  end
	end

	def edit
	end

	def show
    
	end

	def update
    if @company.update(company_params)
			redirect_to company_path(@company), notice: "Company: #{@company.name} updated."
		else
			render 'edit', alert: "Failed to Update."
		end
	end

	def destroy
		@company.destroy
    flash[:notice]="Company: #{@company.name} deleted, including all its contacts and jobs."
   	redirect_to root_path
	end


  private
  def company_params
    params.require(:company).permit(:name, :url, :comments, :user_id,:phone,:email,:street,:city,:state,:zip,:country)
  end

  def find_company
		@company = Company.find(params[:id])
  end

  def not_found
    session[:return_to]||= root_url
    redirect_to session[:return_to], flash: {alert: 'Problem finding company record, you might not be authorized.'}
  end

end