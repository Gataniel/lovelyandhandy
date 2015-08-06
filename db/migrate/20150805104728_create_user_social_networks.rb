class CreateUserSocialNetworks < ActiveRecord::Migration
  def change
    create_table :user_social_networks do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
