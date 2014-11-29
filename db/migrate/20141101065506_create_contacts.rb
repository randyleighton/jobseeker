class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :cell_phone
      t.string :work_phone
      t.text :notes
      t.belongs_to :company, index: true
    end
  end
end
