class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :location
      t.string :posting_number
      t.date :application_date
      t.belongs_to :company, index: true
    end
  end
end
