class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :cell
      t.integer :work_number
      t.belongs_to :company, index: true
    end
  end
end
