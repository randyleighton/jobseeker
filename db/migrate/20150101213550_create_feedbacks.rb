class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
