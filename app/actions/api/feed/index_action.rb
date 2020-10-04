# frozen_string_literal: true

module Api
  class Feed::IndexAction < Feed::BaseAction
    include Actions::Pagination
    def perform
      @success = !records.nil?
    end

    def records
      @records ||= scope&.feeds&.order(published_date: :desc)
    end

    def data
      self.class.serializer.new(records)
    end
  end
end
