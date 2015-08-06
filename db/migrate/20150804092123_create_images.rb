class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :imageable_id, null: false
      t.string :imageable_type, null: false

      t.timestamps null: false
    end
  end
end
