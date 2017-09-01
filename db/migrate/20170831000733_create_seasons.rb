class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :name, null: false
      t.text :pick_up_dates, array: true, default: []
      t.integer :turkeys, null: false
      t.boolean :active, null: false, default: false
      t.datetime :start_date, null: false
      t.datetime :end_date

      t.timestamps
    end
    add_index :seasons, :pick_up_dates, using: 'gin'
  end
end
