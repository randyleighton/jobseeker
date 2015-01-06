class AddSenderInformationToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :sender_name, :string
    add_column :feedbacks, :sender_email, :string
  end
end
