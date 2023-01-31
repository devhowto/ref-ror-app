class Comment < ApplicationRecord
  belongs_to :article
  validates :name, :email, :body, presence: true
  validate :article_should_be_published

  after_create :email_article_author

  def article_should_be_published
    return unless article&.published?

    errors.add(:article_id, 'is not published yet')
  end

  def email_article_author
    p "TODO: Email -> #{article.user.email} replied in your article."
  end
end
