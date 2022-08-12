class AddExcerptAndLocationToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :excerpt, :string, limit: 2048
    add_column :articles, :location, :string, limit: 512
  end
end
