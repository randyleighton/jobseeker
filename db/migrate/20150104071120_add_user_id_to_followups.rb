class AddUserIdToFollowups < ActiveRecord::Migration
  def change
    add_column :followups, :user_id, :integer
  end
end
