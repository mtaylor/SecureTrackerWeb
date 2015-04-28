class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :longitude
      t.string :latitude
      t.datetime :time
      t.string :user

      t.timestamps null: false
    end
  end
end
