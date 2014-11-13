class CompaniesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.create(company_params)
		if @company.valid?
      		redirect_to companies_path, notice: "#{@company.name} saved"
	    else
	      	flash[:alert] = "#{@company.name} failed to save"
	      	render 'new'
	    end
	end

	def show
		@company = Company.find(params[:id])
	end

	def update

	end

	def destroy
		@company = Company.find(params[:id])
		@company.destroy
	end


  private
  def company_params
    params.require(:company).permit(:name)
  end

end