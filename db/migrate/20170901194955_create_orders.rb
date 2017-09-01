class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number, null: false
      t.boolean :paid, null: false, default: false
      t.boolean :picked_up, null: false, default: false
      t.boolean :taxable, null: false, default: true
      t.decimal :subtotal, precision: 6, scale: 2
      t.decimal :tax_total, precision: 6, scale: 2, default: "0.0"
      t.decimal :total, precision: 6, scale: 2
      t.belongs_to :season, foreign_key: true
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end

    add_index :orders, :phone_number
    add_index :orders, :paid, where: 'paid = false'
    add_index :orders, :picked_up, where: 'picked_up = false'
  end
end
