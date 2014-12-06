class CreateOneSteps < ActiveRecord::Migration
  def change
    create_table :one_steps do |t|
      t.timestamps
    end
  end
end
