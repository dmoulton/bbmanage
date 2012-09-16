class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score
      t.integer :innings, :default=>8
      t.text :notes

      t.timestamps
    end
  end
end
