class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      ##
      # This creates `user_id` FK.
      #
      t.references :user, null: false, foreign_key: true

      t.string :name, limit: 96
      t.date :birthday
      t.text :bio
      t.string :color, limit: 24
      t.string :twitter, limit: 128

      t.timestamps
    end
  end
end
