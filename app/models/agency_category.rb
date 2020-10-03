class AgencyCategory < ApplicationRecord
  belongs_to :agency
  belongs_to :category

  has_many :feeds, dependent: :destroy

  validates :url, presence: true
end
