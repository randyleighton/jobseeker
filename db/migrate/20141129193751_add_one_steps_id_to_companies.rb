class AddOneStepsIdToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :one_step, index: true
  end
end
