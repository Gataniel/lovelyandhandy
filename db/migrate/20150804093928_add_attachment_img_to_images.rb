class AddAttachmentImgToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :img, null: false
    end
  end

  def self.down
    remove_attachment :images, :img
  end
end
