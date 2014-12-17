class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :subject
      t.string :body
      t.integer :rem_id
      t.string :rem_type

      t.timestamps
    end
  end
end
