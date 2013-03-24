class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.string :color
      t.integer :capacity
      t.text :description

      t.timestamps
    end
  end
end
