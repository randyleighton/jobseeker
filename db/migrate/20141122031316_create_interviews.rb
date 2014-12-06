class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.date :interview_date
      t.text :notes
      t.belongs_to :job, index: true
      t.timestamps
    end
  end
end
