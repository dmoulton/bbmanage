class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :division_id
      t.string :name
      t.integer :wins
      t.integer :losses
      t.text :notes

      t.timestamps
    end
  end
end
