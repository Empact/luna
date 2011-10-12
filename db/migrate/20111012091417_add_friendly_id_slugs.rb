class AddFriendlyIdSlugs < ActiveRecord::Migration
  def up
    add_column :users, :slug, :string
    add_column :bodies, :slug, :string

    Body.find_each(&:save)
    User.find_each(&:save)

    change_column_null :users, :slug, false
    change_column_null :bodies, :slug, false

    add_index :users, :slug, unique: true
    add_index :bodies, :slug, unique: true
  end

  def down
    remove_column :users, :slug
    remove_column :bodies, :slug
  end
end
