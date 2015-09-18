class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :title, null: false
      t.timestamps null: false
    end
  end
end
