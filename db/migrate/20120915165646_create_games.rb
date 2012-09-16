class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :winner_id
      t.integer :winning_score
      t.integer :losing_score
      t.text :notes

      t.timestamps
    end
  end
end
