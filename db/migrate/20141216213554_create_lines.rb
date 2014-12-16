class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :station1
      t.integer :station2
      t.integer :line

      t.timestamps
    end
  end
end
