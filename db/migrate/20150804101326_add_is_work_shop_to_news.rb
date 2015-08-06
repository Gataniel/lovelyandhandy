class AddIsWorkShopToNews < ActiveRecord::Migration
  def change
    add_column :news, :is_workshop, :boolean, default: false, null: false
  end
end
