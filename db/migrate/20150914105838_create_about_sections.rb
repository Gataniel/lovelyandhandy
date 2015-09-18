class CreateAboutSections < ActiveRecord::Migration
  def change
    create_table :about_sections do |t|
      t.text :content, null: false
      t.text :video_url, null: false
      t.string :mail_to, null: false

      t.timestamps null: false
    end
  end
end
