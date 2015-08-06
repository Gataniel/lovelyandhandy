class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :mark
      t.text :description
      t.integer :product_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
