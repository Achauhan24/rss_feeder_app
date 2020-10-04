# frozen_string_literal: true

module Api
  class FeedSerializer < Api::BaseSerializer
    attributes :id, :click_count, :title, :description, :link, :published_date
  end
end
