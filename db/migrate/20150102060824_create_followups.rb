class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.integer :follow_id
      t.string :follow_type
      t.string :action
      t.text :notes
      t.date :action_date

      t.timestamps
    end
  end
end
