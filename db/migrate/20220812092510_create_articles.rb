class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, limit: 128
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
