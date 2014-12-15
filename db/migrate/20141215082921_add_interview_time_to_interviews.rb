class AddInterviewTimeToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :interview_time, :time
  end
end
