# frozen_string_literal: true

module Api
  class Category::IndexAction < Category::BaseAction
    include Actions::Pagination

    def perform
      @success = !records.nil?
    end

    def records
      @records ||= self.class.record_class.all
    end

    def data
      self.class.serializer.new(paginated_records, options)
    end
  end
end
