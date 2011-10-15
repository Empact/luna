class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :body_id, null: false
      t.integer :created_by_id, null: false
      t.text :text

      t.timestamps
    end
    add_foreign_key :questions, :bodies
    add_foreign_key :questions, :users, column: :created_by_id
  end
end
