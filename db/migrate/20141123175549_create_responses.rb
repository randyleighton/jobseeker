class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :notes
      t.date :response_date
      t.belongs_to :job, index: true
    end
  end
end
