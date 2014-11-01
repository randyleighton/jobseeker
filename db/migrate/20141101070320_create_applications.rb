class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.date :application_date
      t.belongs_to :contacts, index: true
      t.belongs_to :jobs, index: true
    end
  end
end
