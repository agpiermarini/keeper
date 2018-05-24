class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :name
      t.string :oauth_token
      t.string :oauth_secret
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
