class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :provider
      t.string :auth_token
      t.string :auth_secret
      t.string :uid
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
