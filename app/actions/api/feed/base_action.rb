# frozen_string_literal: true

module Api
  class Feed::BaseAction < Abstract::BaseAction
    def self.record_class
      ::Feed
    end

    def self.serializer
      Api::FeedSerializer
    end

    def scope
      @scope ||= record.feeds
    end

    def record
      @record ||= self.class.record_class.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      not_found_error(self.class.record_class, self.class.record_type, params[:id])
    end
  end
end
