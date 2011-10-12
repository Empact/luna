class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    User.find_each do |user|
      user.update_attribute(:username, user.id.to_s)
    end
    change_column_null :users, :username, false
  end
end
