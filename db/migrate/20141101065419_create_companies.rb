class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :url
      t.text :comments
      t.timestamps
    end
  end
end
