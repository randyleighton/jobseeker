class FollowupsController < ApplicationController
  before_filter :find_company, except: :index

  def index
    @followups = Followup.all.where(id:current_user.id)
  end

  def new
    @context = context
    @followup = @context.followups.create.new
  end

  def create
    @context = context
    @followup = @context.followups.create(followup_params)
    if @followup.valid?
      redirect_context_url(context), notice: "The followup has been logged successfully"
    else
      render 'new', alert: "The followup did not save correctly"
    end
  end

  def show
    @followup = context.followups.find(params[:id])
  end




  def destroy
    @context = context
    @followup = context.followups.find(params[:id])
    @followup.destroy
    flash[:notice] = "Followup removed"
    redirect_to context_url(context)
  end

private
  def context
    if params[:contact_id]
      id = params[:contact_id]
      Contact.find(params[:contact_id])
    else 
      id = params[:company_id]
      Company.find(params[:company_id])
  end

  def context_url
    if Company === context
      company_path(context)
    else
      company_contact_path(context)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

end