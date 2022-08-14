class Article < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  scope :published, -> { where.not(published_at: nil) }
  scope :draft, -> { where(published_at: nil) }
  scope :recent, -> { where('articles.published_at > ?', 1.week.ago.to_date) }
  scope :where_title, -> (q) { where('articles.title ILIKE ?', "%#{q}%") }

  def long_title
    "#{title} - #{published_at}"
  end
end

=begin
Using a lambda makes the scope be reevaluated every time
it is used. Using some other approach would make the scope
be evaluated only once, and then we would return stale data.
=end
