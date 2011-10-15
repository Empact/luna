class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :member_id, null: false
      t.integer :group_id, null: false
      t.integer :created_by_id, null: false

      t.timestamps
    end
    add_index :memberships, [:member_id, :group_id], unique: true
    add_foreign_key :memberships, :groups
    add_foreign_key :memberships, :users, column: :member_id
    add_foreign_key :memberships, :users, column: :created_by_id
  end
end
