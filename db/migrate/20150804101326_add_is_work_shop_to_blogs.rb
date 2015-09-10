class AddIsWorkShopToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :is_workshop, :boolean, default: false, null: false
  end
end
