class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :questionnaire
      t.boolean :alive

      t.timestamps null: false
    end
  end
end
