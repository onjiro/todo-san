class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :name
      t.string :image_url
      t.string :email
      t.string :access_token

      t.timestamps
    end
  end
end
