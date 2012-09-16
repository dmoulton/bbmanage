class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :birthdate
      t.integer :number
      t.integer :position_id
      t.integer :team_id
      t.boolean :active, :default=>true
      t.text :notes

      t.timestamps
    end
  end
end
