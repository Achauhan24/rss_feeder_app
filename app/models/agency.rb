class Agency < ApplicationRecord
  has_many :agency_categories, dependent: :destroy
  has_many :categories, through: :agency_categories

  has_many :feeds, through: :agency_categories
end
