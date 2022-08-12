require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save without title" do
    article = Article.new
    assert_not article.save, "saved without a title 😲"
  end

  test "should save with title" do
    article = Article.create(title: "The Force", body: "Some text.")
    assert article.persisted?, "should have been saved"
  end

  test "should not saved without a body" do
    article = Article.create(title: "A Title")
    assert_not article.persisted?, "saved without a body"
  end
end
