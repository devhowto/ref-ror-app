class CreateJoinTableArticlesCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :articles, :categories do |t|
      #
      # NOTE: A join tables does not need a PK.
      #

      t.index %i[article_id category_id]
      t.index %i[category_id article_id]
    end
  end
end
