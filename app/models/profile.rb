class Profile < ApplicationRecord
  ##
  # We could also add `optional: true`, but for our purposes, we don't
  # want a profile to exist without a user.
  #
  belongs_to :user
end
