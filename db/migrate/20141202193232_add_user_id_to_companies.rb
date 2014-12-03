class AddUserIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :user_id, :integer
    add_column :contacts, :user_id, :integer
    add_column :jobs, :user_id, :integer
    add_column :responses, :user_id, :integer
    add_column :interviews, :user_id, :integer
  end
end
