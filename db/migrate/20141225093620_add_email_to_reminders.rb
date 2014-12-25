class AddEmailToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :email, :boolean
  end
end
