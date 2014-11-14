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
      		redirect_to companies_path, notice: "#{@company.name} created."
	    else
	      	flash[:alert] = "Company could not be created."
	      	render 'new'
	    end
	end

	def show
		@company = Company.find(params[:id])
	end

	def update
		@company = @company.find([:id])
		if @company.update_attributes(company_params).valid?
			redirect_to :back, notice: "#{@company.name} updated."
		else
			render company_path(@company), alert: "Failed to Update."
		end
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