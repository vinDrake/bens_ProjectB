class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :guess
      t.references :player, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
