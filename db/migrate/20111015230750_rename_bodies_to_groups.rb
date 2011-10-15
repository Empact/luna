class RenameBodiesToGroups < ActiveRecord::Migration
  def change
    rename_table :bodies, :groups
    rename_column :membership_requests, :body_id, :group_id
    rename_column :memberships, :body_id, :group_id
    rename_column :questions, :body_id, :group_id
  end
end
