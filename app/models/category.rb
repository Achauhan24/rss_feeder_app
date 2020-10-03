class Category < ApplicationRecord
  has_many :agency_categories, dependent: :destroy
  has_many :feeds, through: :agency_categories

  validates :title, presence: true
end
