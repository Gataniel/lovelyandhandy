class CreateAboutSections < ActiveRecord::Migration
  def change
    create_table :about_sections do |t|
      t.text :content
      t.text :video_url
      t.string :mail_to

      t.timestamps null: false
    end
  end
end
