class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :location
      t.text :posting_url
      t.date :application_date
      t.belongs_to :company, index: true
      t.timestamps
    end
  end
end
