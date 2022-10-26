class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :age
      t.text :remarks

      t.timestamps
    end
  end
end
