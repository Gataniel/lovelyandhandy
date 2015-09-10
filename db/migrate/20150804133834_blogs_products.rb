class BlogsProducts < ActiveRecord::Migration
  def change
    create_table :blogs_products, id: false do |t|
      t.belongs_to :blog, index: true
      t.belongs_to :product, index: true
    end
  end
end
