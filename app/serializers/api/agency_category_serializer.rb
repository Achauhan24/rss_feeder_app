# frozen_string_literal: true

module Api
  class AgencyCategorySerializer < Api::BaseSerializer
    attributes :id, :url

    attributes :category do |object|
      {
        id: object.category.id,
        name: object.category.title
      }
    end

    attributes :agency do |object|
      {
        id: object.agency.id,
        name: object.agency.name
      }
    end
  end
end
