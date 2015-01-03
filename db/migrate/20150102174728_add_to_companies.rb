class AddToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :street, :string
    add_column :companies, :city, :string
    add_column :companies, :state, :string
    add_column :companies, :zip, :string
    add_column :companies, :phone, :string
    add_column :companies, :email, :string
    add_column :companies, :country, :string
  end
end