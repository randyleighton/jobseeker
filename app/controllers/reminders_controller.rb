class RemindersController < ApplicationController
  before_filter :find_company, except: :index

  def new
    @context = context
    @reminder = @context.reminders.new
  end

  def create
    @context = context
    @reminder = @context.reminders.new(reminder_params)
    if @reminder.save
      redirect_to context_url(context), notice: "The reminder has been successfully created."
    else
      render 'new'
    end
  end

  def edit
    @context = context
    @reminder = context.reminders.find(params[:id])
  end

  def update
    @context = context
    @reminder = @context.reminders.find(params[:id])
    if @reminder.update_attributes(reminder_params)
      redirect_to context_url(context), notice: "The reminder has been updated"
    end
  end

private
  def reminder_params
    params.require(:reminder).permit(:subject, :body)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end


  def context
    if params[:job_id]
      id = params[:job_id]
      Job.find(params[:job_id])
    else 
      id = params[:company_id]
      Company.find(params[:company_id])
    end
  end 

  def context_url(context)
    if Company === context
      company_path(context)
    else
      job_path(context)
    end
  end

end



