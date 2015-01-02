class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.integer :follow_id
      t.string :follow_type
      t.string :action
      t.text :notes
      t.integer :contact_id
    end
  end
end
