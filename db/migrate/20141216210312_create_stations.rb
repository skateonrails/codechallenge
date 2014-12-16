class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :display_name
      t.integer :zone
      t.integer :total_lines
      t.integer :rail

      t.timestamps
    end
  end
end
