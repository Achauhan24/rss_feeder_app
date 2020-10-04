# frozen_string_literal: true

require 'rss'
require 'open-uri'

module RssFeed
  class Listener
    class << self
      def sync
        AgencyCategory.all.each do |agency_category|
          feeds = RSS::Parser.parse(URI.parse(agency_category.url).open.read, false).items

          entries = feeds.each_with_object([]) do |attributes, array|
            array << {
              title: attributes.title,
              description: attributes.description,
              link: attributes.link,
              published_date: attributes.pubDate,
              agency_category_id: agency_category.id,
              created_at: Time.current,
              updated_at: Time.current
            }
          end

          # rubocop:disable Rails/SkipsModelValidations
          Feed.upsert_all(entries, unique_by: [:title])
          # rubocop:enable Rails/SkipsModelValidations
        end
      end
    end
  end
end
