# frozen_string_literal: true

namespace :rss_feed do
  desc 'Sync the rss feed'
  task sync: :environment do
    RssFeed::Listener.sync
  end
end
