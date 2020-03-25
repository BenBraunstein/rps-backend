class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :p1Id
      t.integer :p2Id
      t.integer :p1score
      t.integer :p2score
      t.integer :numRounds
      t.boolean :complete?

      t.timestamps
    end
  end
end
