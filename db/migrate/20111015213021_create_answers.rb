class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.integer :created_by_id, null: false
      t.string :text

      t.timestamps
    end
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :users, column: :created_by_id
  end
end
