# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  ALGORITHM = 'HS512'

  has_many :agency_categories, dependent: :destroy
  has_many :categories, through: :agency_categories
  has_many :agencies, through: :agency_categories
  has_many :feeds, through: :agency_categories
  has_many :blacklist_tokens, dependent: :destroy

  def generate_token(exp = true)
    payload = { id: id, time: Time.now.to_i }
    payload[:exp] = Time.current.to_i + 15.days if exp
    JWT.encode(payload,
               SECRETS[:secret_key_base],
               ALGORITHM)
  end
end
