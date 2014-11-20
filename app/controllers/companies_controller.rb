class CompaniesController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.create(company_params)
		if @company.valid?
      redirect_to companies_path, notice: "#{@company.name} created."
	  else
	   	render 'new', alert: "Company could not be created."
	  end
	end

	def edit

	end

	def show
	end

	def update
		if @company.update_attributes(company_params).valid?
			redirect_to :back, notice: "#{@company.name} updated."
		else
			render company_path(@company), alert: "Failed to Update."
		end
	end

	def destroy
		@company.destroy
    flash[:alert]="Company and all its contacts and jobs were deleted."
   	redirect_to(:action=>'index')
	end


  private
  def company_params
    params.require(:company).permit(:name, :url, :comments)
  end

  def find_company
		@company = Company.find(params[:id])
  end

  def not_found
    session[:return_to]||= root_url
    redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end