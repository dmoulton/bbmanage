class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :division_id
      t.string :name
      t.integer :wins, :default=>0
      t.integer :losses, :default=>0
      t.text :notes

      t.timestamps
    end
  end
end
