class CreateCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color
      t.integer :doors
      t.date :purchased_on
      t.integer :make_id
      t.index :make_id
    end
  end
end
