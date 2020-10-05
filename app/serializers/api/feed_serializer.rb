# frozen_string_literal: true

module Api
  class FeedSerializer < Api::BaseSerializer
    attributes :id, :click_count, :title, :description, :link, :published_date

    attributes :agency do |feed|
      {
        name: feed.agency_category.agency.name
      }
    end
  end
end
