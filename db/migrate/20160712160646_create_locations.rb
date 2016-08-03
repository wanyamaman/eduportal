class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      # used to generate address
      t.string :street, null: false, default: ""
      t.string :city, null: false, default: ""
      t.belongs_to :state, index: true
      t.string :country, null: false, default: ""
      t.string :zip, null: false, default: ""

      # used by geocode
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
# 20160626191222_create_locations
