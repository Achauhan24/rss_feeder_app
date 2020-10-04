# frozen_string_literal: true

require 'rss'
require 'open-uri'

module RssFeed
  class Listener
    class << self
      def sync
        AgencyCategory.all.each do |agency_category|
          feeds = RSS::Parser.parse(URI.parse(agency_category.url).open.read, false).items
          # check if u can use insert_all
          feeds.each do |entry|
            local_feed = Feed.find_or_initialize_by(title: entry.title)
            local_feed.update(description: entry.description,
                              link: entry.link,
                              published_date: entry.pubDate,
                              agency_category_id: agency_category.id)
          end
        end
      end
    end
  end
end
