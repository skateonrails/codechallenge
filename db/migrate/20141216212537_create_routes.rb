class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :line
      t.string :name
      t.string :colour
      t.string :stripe

      t.timestamps
    end
  end
end
