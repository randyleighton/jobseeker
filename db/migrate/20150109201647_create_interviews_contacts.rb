class CreateInterviewsContacts < ActiveRecord::Migration
  def change
    create_table :interviews_contacts do |t|
      t.belongs_to :interview, index: true
      t.belongs_to :contact, index: true
    end
    add_foreign_key :interviews_contacts, :interviews
    add_foreign_key :interviews_contacts, :contacts
    remove_column   :interviews, :contact_id, :integer
  end
end
