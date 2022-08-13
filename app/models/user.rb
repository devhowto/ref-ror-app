class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :articles,
    -> { order 'published_at DESC, title ASC' },
    dependent: :destroy
end
