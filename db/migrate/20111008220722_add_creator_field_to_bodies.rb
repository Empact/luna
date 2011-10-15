class AddCreatorFieldToGroups < ActiveRecord::Migration
  def change
    Group.delete_all
    add_column :groups, :created_by_id, :integer, null: false
    add_foreign_key :groups, :users, column: :created_by_id
  end
end
