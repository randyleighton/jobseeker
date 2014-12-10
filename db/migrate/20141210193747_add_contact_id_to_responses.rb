class AddContactIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :contact_id, :integer
  end
end
