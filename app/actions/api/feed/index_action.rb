# frozen_string_literal: true

module Api
  class Feed::IndexAction < Feed::BaseAction
    include Actions::Pagination
    def perform
      @success = !records.nil?
    end

    def records
      @records ||= self.class.record_class.all.order(published_date: :desc)
    end

    def data
      self.class.serializer.new(paginated_records, options)
    end
  end
end
