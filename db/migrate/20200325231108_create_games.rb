class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :p1Id
      t.integer :p2Id
      t.integer :p1score, :default => 0
      t.integer :p2score, :default => 0
      t.integer :numRounds
      t.boolean :complete?, :default => false

      t.timestamps
    end
  end
end
