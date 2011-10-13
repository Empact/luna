class CreateMembershipRequests < ActiveRecord::Migration
  def change
    create_table :membership_requests do |t|
      t.integer :member_id, null: false
      t.integer :body_id, null: false

      t.timestamps
    end
    add_index :membership_requests, [:member_id, :body_id], unique: true
    add_foreign_key :membership_requests, :bodies
    add_foreign_key :membership_requests, :users, column: :member_id
  end
end
