class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :problem
      t.string :correct_answer
      t.text :wrong_answers
      t.string :category

      t.timestamps null: false
    end
  end
end
