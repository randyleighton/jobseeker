class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.string :account_info
      t.belongs_to :contact
    end
  end
end
