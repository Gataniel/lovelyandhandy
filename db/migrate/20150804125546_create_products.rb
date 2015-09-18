class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
