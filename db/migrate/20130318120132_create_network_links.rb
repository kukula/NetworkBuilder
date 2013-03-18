class CreateNetworkLinks < ActiveRecord::Migration
  def change
    create_table :network_links do |t|
      t.float :start_lat
      t.float :start_lng
      t.float :end_lat
      t.float :end_lng
      t.integer :capacity
      t.string :color
      t.string :description

      t.timestamps
    end
  end
end
