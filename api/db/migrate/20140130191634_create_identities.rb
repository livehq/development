class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.string :access_token
      t.references :user
      t.timestamps
    end

    add_index :identities, :user_id
  end
end
