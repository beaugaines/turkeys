class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.decimal :tax_rate, precision: 5, scale: 4

      t.timestamps
    end
  end
end
