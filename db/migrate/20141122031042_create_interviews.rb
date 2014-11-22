class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :interview_date
      t.string :notes
      t.belongs_to :jobs, index: true
    end
  end
end
