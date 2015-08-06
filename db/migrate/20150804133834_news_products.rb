class NewsProducts < ActiveRecord::Migration
  def change
    create_table :news_products, id: false do |t|
      t.belongs_to :new, index: true
      t.belongs_to :product, index: true
    end
  end
end
