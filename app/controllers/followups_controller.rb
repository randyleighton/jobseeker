class FollowupsController < ApplicationController

  def index
    @followups = Followup.all.where(user_id:current_user.id).order_by
  end

  def new
    @context = context
    @followup = @context.followups.new
  end

  def create
    @context = context
    @followup = @context.followups.create(followup_params)
    if @followup.valid?
      redirect_to context_url, notice: "The followup has been logged successfully"
    else
      @followup.action_date = nil
      render 'new', alert: "The followup did not save correctly"
    end
  end

  def show
    @followup = context.followups.find(params[:id])
    @context = context
    if @context.class == Company
      @company = @context
    else
      @contact = @context
    end
  end

  def edit
    @context = context
    @followup = context.followups.find(params[:id])
  end

  def update
    @context = context
    @followup = context.followups.find(params[:id])
    if @followup.update(followup_params)
      redirect_to context_url, notice: "The followup has been updated"
    end
  end

  def destroy
    @context = context
    @followup = context.followups.find(params[:id])
    @followup.destroy
    flash[:notice] = "Followup removed"
    redirect_to context_url
  end

private
  def followup_params
    params.require(:followup).permit(:action, :action_date, :notes, :contact_id,:user_id)
  end

  def context
    if params[:contact_id]
      id = params[:contact_id]
      Contact.find(params[:contact_id])
    else 
      id = params[:company_id]
      Company.find(params[:company_id])
    end
  end

  def context_url
    if Company === context
      company_path(context)
    else
      company_contact_path(context)
    end
  end

end