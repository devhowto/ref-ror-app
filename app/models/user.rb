class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  has_secure_password :recovery_password, validations: false

  attr_accessor :password_digest, :recovery_password_digest

  validates :email,
            uniqueness: true,
            length: {
              within: 5..50,
              message: 'Beteween 5 and 50 please'
            },
            format: {
              with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i,
              message: 'This is not an email address'
            }

  validates :password,
            confirmation: true

  has_one :profile, dependent: :destroy

  has_many :articles,
           -> { order 'published_at DESC, title ASC' },
           dependent: :destroy

  has_many :replies, through: :articles, source: :comments
end
