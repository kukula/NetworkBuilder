class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.belongs_to :network, index: true
      t.float :lat
      t.float :lng
    end
  end
end
