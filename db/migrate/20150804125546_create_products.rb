class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
