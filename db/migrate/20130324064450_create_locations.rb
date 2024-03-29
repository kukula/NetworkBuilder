class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
