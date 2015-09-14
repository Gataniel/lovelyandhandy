class AddImageDescriptionColumnsToBlogs < ActiveRecord::Migration
  def up
    add_attachment :blogs, :image
    add_column :blogs, :description, :text
  end

  def down
    remove_attachment :blogs, :image
    remove_attachment_column :blogs, :description
  end
end
