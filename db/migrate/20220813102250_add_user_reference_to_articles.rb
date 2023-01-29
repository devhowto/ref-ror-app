class AddUserReferenceToArticles < ActiveRecord::Migration[7.0]
  def change
    ##
    # Adds `user_id` to `articles`.
    #
    add_reference :articles, :user, foreign_key: true
  end
end
