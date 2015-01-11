class CreateContactsInterviews < ActiveRecord::Migration
  def change
    create_table :contacts_interviews do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :interview, index: true
    end
    add_foreign_key :contacts_interviews, :contacts
    add_foreign_key :contacts_interviews, :interviews
    remove_column   :interviews, :contact_id, :integer
  end
end
