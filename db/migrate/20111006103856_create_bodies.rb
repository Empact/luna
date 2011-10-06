class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
    add_index :bodies, :name, unique: true
  end
end
