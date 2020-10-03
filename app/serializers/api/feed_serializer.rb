# frozen_string_literal: true

module Api
  class FeedSerializer < Api::BaseSerializer
    attributes :id, :title, :description, :link, :published_date
  end
end
