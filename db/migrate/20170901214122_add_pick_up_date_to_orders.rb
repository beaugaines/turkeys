class AddPickUpDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :pick_up_date, :date, null: false
  end
end
