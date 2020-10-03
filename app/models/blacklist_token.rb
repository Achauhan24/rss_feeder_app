class BlacklistToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
end
