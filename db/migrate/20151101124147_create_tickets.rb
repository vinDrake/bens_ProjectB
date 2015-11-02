class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :player, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true
      t.boolean :complete
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
