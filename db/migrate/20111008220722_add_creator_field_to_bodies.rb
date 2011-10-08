class AddCreatorFieldToBodies < ActiveRecord::Migration
  def change
    Body.delete_all
    add_column :bodies, :created_by_id, :integer, null: false
    add_foreign_key :bodies, :users, column: :created_by_id
  end
end
