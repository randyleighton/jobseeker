class AddContactIdToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :contact_id, :integer
  end
end
