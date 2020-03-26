class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.string :p1Move
      t.string :p2Move

      t.timestamps
    end
  end
end
