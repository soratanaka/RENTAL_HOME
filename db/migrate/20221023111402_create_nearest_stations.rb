class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.text :route
      t.text :station
      t.integer :time
    end
  end
end
