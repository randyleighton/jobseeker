class CreateJobApplication < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.date :applied_date
      t.belongs_to :contact, index: true
      t.belongs_to :job, index: true
    end
  end
end
