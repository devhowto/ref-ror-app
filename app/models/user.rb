class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :articles
end
