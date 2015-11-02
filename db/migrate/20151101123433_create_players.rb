class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :question_feed

      t.timestamps null: false
    end
  end
end
