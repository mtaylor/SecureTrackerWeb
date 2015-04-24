class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.datetime :time
      t.string :user_id

      t.timestamps null: false
    end
  end
end
